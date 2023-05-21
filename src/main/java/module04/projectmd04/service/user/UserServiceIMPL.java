package module04.projectmd04.service.user;

import module04.projectmd04.config.Configs;
import module04.projectmd04.config.detail.Constant;
import module04.projectmd04.model.Role;
import module04.projectmd04.model.RoleName;
import module04.projectmd04.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class UserServiceIMPL implements IUserService {
    private static final Connection connection = Configs.getInstance().getConnectMySQL();
    String SELECT_USER_FROM_USER = "select userName from user;";
    String SELECT_EMAIL_FROM_USER = "select email from user;";
    String SELECT_USER_LIST = "select * from user;";
    String INSERT_INTO_USER = "insert into user (name, userName, email, password, avatar) " + "values (?, ?, ?, ?, ?);";
    String INSERT_INTO_USER_ROLE = "insert into userRole (userId, roleId) values (?, ?);";
    String SELECT_ROLE_BY_USER_ID = "select r.roleId, r.roleName from role r " +
            "join userRole ur on r.roleId = ur.roleId where ur.userId = ?;";
    String SELECT_LOGIN_USER = "select * from user " +
            "where userName = ? and convert(password using utf8mb4) collate utf8mb4_bin = ?;";
    String UPDATE_AVATAR = "update user set avatar = ? where userId = ?;";
    String SELECT_USER_BY_ID = "select * from user where userId = ?;";
    String UN_BLOCK_USER = "update user set status = ? where userId = ?;";
    String UPDATE_USER_ROLE = "update userRole set roleId = ? where userId = ?;";
    String DELETE_FROM_IMAGE_POST = "delete from imagePost where postId not in (select p.postId from post p join userPost uP on p.postId = uP.postId where uP.userId not in (select userId from user));;";
    String DELETE_USER_POST = "delete from userPost where userId = ?;";
    String DELETE_FROM_IMAGE = "delete from image where imageId not in (select imageId from imagePost);";
    String DELETE_USER_CHAT = "delete from userChat where sentUserId =? or receivedUserId = ?;";
    String DELETE_USER_FRIEND = "delete from userFriend where sentUserId = ? or receivedUserId = ?;";
    String DELETE_USER_ROLE = "delete from userRole where userId = ?;";
    String DELETE_COMMENT_POST = "delete from commentPost where userId = ? or postId in (select post.postId from post join userPost uP on post.postId = uP.postId where uP.userId =?);";
    String DELETE_LIKE_POST = "delete from likePost where postId in (select post.postId from post join userPost uP on post.postId = uP.postId where uP.userId =?);";
    String DELETE_USER_BY_ID = "delete from user where userId = ?;";
    String DELETE_POST = "delete from post where postId not in (select postId from userPost);";
    String DELETE_LIKE = "delete from `like` where likeId not in (select likeId from likePost);";
    String DELETE_COMMENT = "delete from comment where commentId not in (select commentId from commentPost);";
    String DELETE_CHAT = "delete from chat where chatId in (select chatId from userChat where sentUserId =? or receivedUserId =?);";
    String DELETE_FRIEND = "delete from friend where friendId not in (select friendId from userFriend);";
    String UPDATE_USER_INFO = "update user set name = ?, userName =?, email=?, password=?, avatar=? where userId =?;";
    String SELECT_USER_BY_NAME = "select * from user where name like ? or name like ? or name like ?;";

    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_LIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = generateUserInfo(resultSet);
                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public void save(User user) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_USER,
                    Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getUserName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getAvatar());
            preparedStatement.executeUpdate();

            int userId = 0;
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            while (resultSet.next()) {
                userId = resultSet.getInt(1);
            }

            List<Role> roleList = new ArrayList<>(user.getRoleSet());
            List<Integer> roleIntList = new ArrayList<>();
            for (Role role : roleList) {
                roleIntList.add(role.getId());
            }

            PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_INTO_USER_ROLE);
            for (Integer roleId : roleIntList) {
                preparedStatement1.setInt(1, userId);
                preparedStatement1.setInt(2, roleId);
                preparedStatement1.executeUpdate();
            }
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void delete(int id) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement4 = connection.prepareStatement(DELETE_COMMENT_POST);
            preparedStatement4.setInt(1, id);
            preparedStatement4.setInt(2, id);
            preparedStatement4.executeUpdate();


            PreparedStatement preparedStatement5 = connection.prepareStatement(DELETE_LIKE_POST);
            preparedStatement5.setInt(1, id);
            preparedStatement5.executeUpdate();

            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_POST);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();

            PreparedStatement preparedStatement7 = connection.prepareStatement(DELETE_POST);
            preparedStatement7.executeUpdate();

            PreparedStatement preparedStatement8 = connection.prepareStatement(DELETE_LIKE);
            preparedStatement8.executeUpdate();

            PreparedStatement preparedStatement9 = connection.prepareStatement(DELETE_COMMENT);
            preparedStatement9.executeUpdate();

            PreparedStatement preparedStatement6_1 = connection.prepareStatement(DELETE_FROM_IMAGE_POST);
            preparedStatement6_1.executeUpdate();

            PreparedStatement preparedStatement7_1 = connection.prepareStatement(DELETE_FROM_IMAGE);
            preparedStatement7_1.executeUpdate();

            PreparedStatement preparedStatement10 = connection.prepareStatement(DELETE_CHAT);
            preparedStatement10.setInt(1, id);
            preparedStatement10.setInt(2, id);
            preparedStatement10.executeUpdate();

            PreparedStatement preparedStatement1 = connection.prepareStatement(DELETE_USER_CHAT);
            preparedStatement1.setInt(1, id);
            preparedStatement1.setInt(2, id);
            preparedStatement1.executeUpdate();


            PreparedStatement preparedStatement2 = connection.prepareStatement(DELETE_USER_FRIEND);
            preparedStatement2.setInt(1, id);
            preparedStatement2.setInt(2, id);
            preparedStatement2.executeUpdate();
            PreparedStatement preparedStatement11 = connection.prepareStatement(DELETE_FRIEND);
            preparedStatement11.executeUpdate();

            PreparedStatement preparedStatement3 = connection.prepareStatement(DELETE_USER_ROLE);
            preparedStatement3.setInt(1, id);
            preparedStatement3.executeUpdate();

            PreparedStatement preparedStatement6 = connection.prepareStatement(DELETE_USER_BY_ID);
            preparedStatement6.setInt(1, id);
            preparedStatement6.executeUpdate();

            //
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Set<Role> findRoleByUserId(int userId) {
        Set<Role> roleSet = new HashSet<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ROLE_BY_USER_ID);
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(Constant.ROLE_ID);
                RoleName name = RoleName.valueOf(resultSet.getString(Constant.ROLE_NAME));
                roleSet.add(new Role(id, name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return roleSet;
    }

    @Override
    public boolean existedByUserName(String userName) {
        List<String> userNameList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_FROM_USER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                userNameList.add(resultSet.getString(Constant.USER_NAME));
            }
            for (String existedUserName : userNameList) {
                if (userName.equalsIgnoreCase(existedUserName)) {
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public boolean existByEmail(String email) {
        List<String> emailList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMAIL_FROM_USER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                emailList.add(resultSet.getString(Constant.EMAIL));
            }
            for (String existedEmail : emailList) {
                if (email.equalsIgnoreCase(existedEmail)) {
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public User userLogin(String loginUserName, String password) {
        User user = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LOGIN_USER);
            preparedStatement.setString(1, loginUserName);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                boolean status = resultSet.getBoolean(Constant.STATUS);
                if (status) {
                    return null;
                }
                user = generateUserInfo(resultSet);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public void updateAvatar(String avatar, int id) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_AVATAR);
            preparedStatement.setString(1, avatar);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User getCurrentUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return null;
        }
        return (User) session.getAttribute(Constant.LOGIN_USER);
    }

    @Override
    public RoleName redirectAction(User user, HttpServletResponse response) {
        List<Role> roleList = new ArrayList<>(user.getRoleSet());
        boolean adminRole = false, pmRole = false;
        for (Role role : roleList) {
            if (role.getName() == RoleName.ADMIN) {
                adminRole = true;
                continue;
            }
            if (role.getName() == RoleName.PM) {
                pmRole = true;
            }
        }
        if (adminRole) {
            return RoleName.ADMIN;
        }
        if (pmRole) {
            return RoleName.PM;
        }
        return RoleName.USER;
    }

    @Override
    public User findUserById(int id) {
        User user = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                user = generateUserInfo(resultSet);
                user.setPassword(resultSet.getString(Constant.PASSWORD));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public void blockUnblockAccount(User user) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(UN_BLOCK_USER);
            preparedStatement.setBoolean(1, (!user.isStatus()));
            preparedStatement.setInt(2, user.getUserId());

            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void changeAccountRole(User user) {
        Role role = new ArrayList<>(user.getRoleSet()).get(0);
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_ROLE);
            preparedStatement.setInt(1, (role.getId() == 3 ? 2 : 3));
            preparedStatement.setInt(2, user.getUserId());
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> findUserByName(HttpServletRequest request, String findName) {
        List<User> userList = new ArrayList<>();
        User currentUser = getCurrentUser(request);
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_NAME);
            preparedStatement.setString(1, (findName + "%"));
            preparedStatement.setString(2, ("%" + findName + "%"));
            preparedStatement.setString(3, ("%" + findName));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = generateUserInfo(resultSet);
                int userId = resultSet.getInt(Constant.USER_ID);
                Set<Role> roleSet = findRoleByUserId(userId);
                boolean userRole = true;
                for (Role role : roleSet) {
                    if (role.getName() == RoleName.ADMIN || role.getName() == RoleName.PM) {
                        userRole = false;
                        break;
                    }
                }
                if (userId != currentUser.getUserId() && userRole && !user.isStatus()) {
                    userList.add(user);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public void updateCurrentUser(User user) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_INFO);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getUserName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getAvatar());
            preparedStatement.setInt(6, user.getUserId());
            preparedStatement.executeUpdate();

            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private User generateUserInfo(ResultSet resultSet) throws SQLException {
        int userId = resultSet.getInt(Constant.USER_ID);
        String name = resultSet.getString(Constant.NAME);
        String userName = resultSet.getString(Constant.USER_NAME);
        String email = resultSet.getString(Constant.EMAIL);
        String avatar = resultSet.getString(Constant.AVATAR);
        boolean status = resultSet.getBoolean(Constant.STATUS);
        Set<Role> roleSet = findRoleByUserId(userId);
        return new User(userId, name, userName, email, avatar, roleSet, status);
    }
}