package module04.projectmd04.service.user;

import module04.projectmd04.config.Configs;
import module04.projectmd04.model.Role;
import module04.projectmd04.model.RoleName;
import module04.projectmd04.model.User;

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
    String INSERT_INTO_USER = "insert into user (name, userName, email, password, avatar) " +
            "values (?, ?, ?, ?, ?);";
    String INSERT_INTO_USER_ROLE = "insert into userRole (userId, roleId) values (?, ?);";
    String SELECT_ROLE_BY_USER_ID = "select r.roleId, r.roleName from role r " +
            "join userRole ur on r.roleId = ur.roleId where r.roleId = ?;";
    String SELECT_LOGIN_USER = "select * from user " +
            "where userName = ? and convert(password using utf8mb4) collate utf8mb4_bin = ?;";
    String UPDATE_AVATAR = "update user set avatar = ? where userId = ?;";
    String DELETE_USER_BY_ID = "delete from user where userId = ?;";

    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_LIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                String name = resultSet.getString("name");
                String userName = resultSet.getString("userName");
                String email = resultSet.getString("email");
                String avatar = resultSet.getString("avatar");
                Set<Role> roleSet = findRoleByUserId(userId);
                userList.add(new User(userId, name, userName, email, avatar, roleSet));
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
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_USER, Statement.RETURN_GENERATED_KEYS);
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
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
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
                int id = resultSet.getInt("roleId");
                RoleName name = RoleName.valueOf(resultSet.getString("roleName"));
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
                userNameList.add(resultSet.getString("userName"));
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
                emailList.add(resultSet.getString("email"));
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
    public User userLogin(String userName, String password) {
        User user = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LOGIN_USER);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String avatar = resultSet.getString("avatar");
                Set<Role> roleSet = findRoleByUserId(userId);
                user = new User(userId, name, userName, email, avatar, roleSet);
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
}