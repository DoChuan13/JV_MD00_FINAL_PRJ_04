package module04.projectmd04.service.friend;

import module04.projectmd04.config.Configs;
import module04.projectmd04.config.detail.Constant;
import module04.projectmd04.model.Friend;
import module04.projectmd04.model.User;
import module04.projectmd04.service.Services;
import module04.projectmd04.service.user.IUserService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FriendServiceIMPL implements IFriendService {
    private static final Connection connection = Configs.getInstance().getConnectMySQL();
    private static final IUserService userService = Services.getInstance().getUserService();
    private static final String SELECT_SENT_FRIEND = "select uF.* from friend f join userFriend uF on f.friendId = uF.friendId " + "where uF.sentUserId = ? and f.status != 'accepted';";
    private static final String SELECT_REQUESTED_FRIEND = "select uF.* from friend f join userFriend uF on f.friendId = uF.friendId " + "where uF.receivedUserId = ? and f.status = 'pending';";
    String SELECT_FROM_USER_FRIENDS = "select uF.* from friend f join userFriend uF on f.friendId = uF.friendId where (uF.sentUserId = ? or uF.receivedUserId =?) and f.status = 'accepted';";
    String SELECT_FROM_FRIEND_ST = "select * from userFriend uf join friend f on f.friendId = uf.friendId where (uf.sentUserId = ? and uf.receivedUserId = ?) or (uf.receivedUserId = ? and uf.sentUserId = ?);";
    String INSERT_INTO_FRIEND = "insert into friend (status) values (default);";
    String INSERT_INTO_USER_FRIEND = "insert into userFriend (friendId, sentUserId, receivedUserId) values (?, ?, ?);";
    String SELECT_FROM_FR_TO_FR_ID = "select friendId from userFriend where receivedUserId = ?;";
    String UPDATE_FRIEND_BY_ID = "update friend set friendDate = now(),status = 'pending' where friendId = ?;";
    String UPDATE_USER_FRIEND_BY_ID = "update userFriend set sentUserId =?,receivedUserId = ? where friendId =?;";
    String DELETE_FROM_USER_FRIEND_BY_ID = "delete from userFriend where sentUserId = ? and receivedUserId =?;";
    String DELETE_FROM_FRIEND = "delete from friend where friendId not in (select friendId from userFriend);";
    String UPDATE_FRIEND_STATUS = "update friend set status = ? where friendId = (select friendId from userFriend where sentUserId = ? and receivedUserId = ?);";
    String DELETE_FROM_FRIEND_STATUS = "delete from userFriend where (sentUserId =? and receivedUserId = ?) or (receivedUserId = ? and  sentUserId = ?);";

    @Override
    public List<Friend> getAcceptFriendList(User currentUser) {
        List<Friend> friendList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FROM_USER_FRIENDS);
            preparedStatement.setInt(1, currentUser.getUserId());
            preparedStatement.setInt(2, currentUser.getUserId());
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int friendId = resultSet.getInt("friendId");
                int sentId = resultSet.getInt("sentUserId");
                int receivedId = resultSet.getInt("receivedUserId");
                User sentUser = userService.findUserById(sentId);
                User receivedUser = userService.findUserById(receivedId);
                Friend friend = new Friend(friendId, sentUser, receivedUser, Constant.ACCEPTED);
                friendList.add(friend);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return friendList;
    }

    @Override
    public String findStatusByUserId(User currentUser, int userId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FROM_FRIEND_ST);
            preparedStatement.setInt(1, currentUser.getUserId());
            preparedStatement.setInt(2, userId);
            preparedStatement.setInt(3, currentUser.getUserId());
            preparedStatement.setInt(4, userId);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int sentId = resultSet.getInt("sentUserId");
                String status = resultSet.getString("status");
                if (status.equals(Constant.ACCEPTED)) {
                    return Constant.ACCEPTED;
                }
                if (sentId == currentUser.getUserId()) {
                    return Constant.PENDING;
                }
                if (sentId != currentUser.getUserId() && !status.equals(Constant.REJECTED)) {
                    return Constant.REQUESTED;
                }
                if (sentId != currentUser.getUserId() && status.equals(Constant.REJECTED)) {
                    return Constant.REJECTED;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return Constant.NONE;
    }

    @Override
    public List<Friend> getFriendStatus(User currentUser, List<User> users) {
        List<Friend> friendList = new ArrayList<>();
        for (User user : users) {
            String status = findStatusByUserId(currentUser, user.getUserId());
            friendList.add(new Friend(currentUser, user, status));
        }
        return friendList;
    }

    @Override
    public void sendAddFriendRequest(User currentUser, int userId) {
        String status = findStatusByUserId(currentUser, userId);
        try {
            connection.setAutoCommit(false);
            if (status.equals(Constant.NONE)) {
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_FRIEND, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.executeUpdate();

                int friendId = 0;
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                while (resultSet.next()) {
                    friendId = resultSet.getInt(1);
                }
                PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_INTO_USER_FRIEND);
                preparedStatement1.setInt(1, friendId);
                preparedStatement1.setInt(2, currentUser.getUserId());
                preparedStatement1.setInt(3, userId);
                preparedStatement1.executeUpdate();
            } else {
                PreparedStatement preparedStatement2 = connection.prepareStatement(SELECT_FROM_FR_TO_FR_ID);
                preparedStatement2.setInt(1, currentUser.getUserId());
                ResultSet resultSet = preparedStatement2.executeQuery();
                int currentFriendId = 0;
                while (resultSet.next()) {
                    currentFriendId = resultSet.getInt(1);
                }
                PreparedStatement preparedStatement3 = connection.prepareStatement(UPDATE_FRIEND_BY_ID);
                preparedStatement3.setInt(1, currentFriendId);
                preparedStatement3.executeUpdate();

                PreparedStatement preparedStatement4 = connection.prepareStatement(UPDATE_USER_FRIEND_BY_ID);
                preparedStatement4.setInt(1, currentUser.getUserId());
                preparedStatement4.setInt(2, userId);
                preparedStatement4.setInt(3, currentFriendId);
                preparedStatement4.executeUpdate();
            }
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void cancelSentRequest(User currentUser, int userId) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FROM_USER_FRIEND_BY_ID);
            preparedStatement.setInt(1, currentUser.getUserId());
            preparedStatement.setInt(2, userId);
            preparedStatement.executeUpdate();

            PreparedStatement preparedStatement1 = connection.prepareStatement(DELETE_FROM_FRIEND);
            preparedStatement1.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void confirmFriendRequest(User currentUser, int userId) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FRIEND_STATUS);
            preparedStatement.setString(1, Constant.ACCEPTED);
            preparedStatement.setInt(2, userId);
            preparedStatement.setInt(3, currentUser.getUserId());
            preparedStatement.executeUpdate();

            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void rejectFriendRequest(User currentUser, int userId) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FRIEND_STATUS);
            preparedStatement.setString(1, Constant.REJECTED);
            preparedStatement.setInt(2, userId);
            preparedStatement.setInt(3, currentUser.getUserId());
            preparedStatement.executeUpdate();

            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void cancelFriendStatus(User currentUser, int userId) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FROM_FRIEND_STATUS);
            preparedStatement.setInt(1, currentUser.getUserId());
            preparedStatement.setInt(2, userId);
            preparedStatement.setInt(3, currentUser.getUserId());
            preparedStatement.setInt(4, userId);
            preparedStatement.executeUpdate();

            PreparedStatement preparedStatement1 = connection.prepareStatement(DELETE_FROM_FRIEND);
            preparedStatement1.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Friend> getSentFriendList(User currentUser) {
        List<Friend> friendList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SENT_FRIEND);
            preparedStatement.setInt(1, currentUser.getUserId());
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int friendId = resultSet.getInt("friendId");
                int sentId = resultSet.getInt("sentUserId");
                int receivedId = resultSet.getInt("receivedUserId");
                User sentUser = userService.findUserById(sentId);
                User receivedUser = userService.findUserById(receivedId);
                Friend friend = new Friend(friendId, sentUser, receivedUser, Constant.PENDING);
                friendList.add(friend);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return friendList;
    }

    @Override
    public List<Friend> getRequestedFriendList(User currentUser) {
        List<Friend> friendList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REQUESTED_FRIEND);
            preparedStatement.setInt(1, currentUser.getUserId());
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int friendId = resultSet.getInt("friendId");
                int sentId = resultSet.getInt("sentUserId");
                int receivedId = resultSet.getInt("receivedUserId");
                User sentUser = userService.findUserById(sentId);
                User receivedUser = userService.findUserById(receivedId);
                Friend friend = new Friend(friendId, sentUser, receivedUser, Constant.REQUESTED);
                friendList.add(friend);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return friendList;
    }
}
