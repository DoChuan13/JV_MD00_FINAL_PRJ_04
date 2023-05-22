package module04.projectmd04.service.chat;

import module04.projectmd04.config.Configs;
import module04.projectmd04.config.detail.Constant;
import module04.projectmd04.model.Chat;
import module04.projectmd04.model.ChatDetail;
import module04.projectmd04.model.User;
import module04.projectmd04.service.Services;
import module04.projectmd04.service.user.IUserService;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ChatServiceIMPL implements IChatService {
    private static final Connection connection = Configs.getInstance().getConnectMySQL();
    private static final IUserService userService = Services.getInstance().getUserService();
    String SELECT_FROM_USER_CHAT = "select * from userChat where receivedUserId = ? or  sentUserId = ? order by latestTime desc ;";
    String SELECT_USER_CHAT_BY_USERS = "select * from userChat where (sentUserId = ? and receivedUserId = ?) or (receivedUserId = ? and  sentUserId = ?);";

    String INSERT_INTO_USER_CHAT = "insert into userChat (sentUserId, receivedUserId) values(?, ?);";
    String UPDATE_USER_CHAT = "update userChat " +
            "set latestTime = now()," +
            "sentUserIn =if(sentUserIn is null ,now(),sentUserIn), " +
            "receivedUserIn=if(receivedUserIn is null ,now(),receivedUserIn) " +
            "where chatId = ?;";
    String INSERT_INTO_CHAT = "insert into chat(chatId, content, sentUserId) values (?,?,?);";
    String SELECT_USER_CHAT_BY_ID = "select * from userChat where chatId = ?;";
    String UPDATE_USER_CHAT_BY_ID = "update userChat set latestTime = now()," +
            "sentUserIn =if(sentUserIn is null ,now(),sentUserIn), " +
            "receivedUserIn=if(receivedUserIn is null ,now(),receivedUserIn) " +
            " where chatId = ?;";
    String SELECT_CHAT_BY_ID = "select * from chat where chatId = ?";
    String UPDATE_USER_CHAT_SENT_USR = "update userChat set sentUserIn = null where chatId = ?;";
    String UPDATE_USER_CHAT_REV_USR = "update userChat set receivedUserIn = null where chatId = ?;";

    @Override
    public List<Chat> getChatListByUser(User currentUser) {
        List<Chat> chatList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FROM_USER_CHAT);
            preparedStatement.setInt(1, currentUser.getUserId());
            preparedStatement.setInt(2, currentUser.getUserId());
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Chat chat = getChatInfo(currentUser, resultSet);
                if ((currentUser.getUserId() == chat.getStartUser().getUserId() && chat.getStartIn() != null) ||
                        currentUser.getUserId() == chat.getTargetUser().getUserId() && chat.getTargetIn() != null) {
                    chatList.add(chat);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return chatList;
    }

    @Override
    public List<Chat> getChatListByUserName(User currentUser, String name) {
        List<Chat> chatList = getChatListByUser(currentUser);
        List<Chat> result = new ArrayList<>();
        for (Chat chat : chatList) {
            User startUser = chat.getStartUser();
            User targetUser = chat.getTargetUser();
            if (startUser.getUserId() != currentUser.getUserId()
                    && startUser.getName().toLowerCase().contains(name.toLowerCase())) {
                result.add(chat);
                continue;
            }
            if (targetUser.getUserId() != currentUser.getUserId() &&
                    targetUser.getName().toLowerCase().contains(name.toLowerCase())) {
                result.add(chat);
            }
        }
        return result;
    }

    @Override
    public Chat findChatRelUser(User currentUser, int userId) {
        Chat chat = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_CHAT_BY_USERS);
            preparedStatement.setInt(1, currentUser.getUserId());
            preparedStatement.setInt(2, userId);
            preparedStatement.setInt(3, currentUser.getUserId());
            preparedStatement.setInt(4, userId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int chatId = resultSet.getInt(Constant.CHAT_ID);
                User startUser = userService.findUserById(resultSet.getInt(Constant.SENT_USER_ID));
                User targetUser = userService.findUserById(resultSet.getInt(Constant.RECEIVED_USER_ID));
                Date startIn = resultSet.getTimestamp(Constant.START_IN);
                Date targetIn = resultSet.getTimestamp(Constant.TARGET_IN);
                Date startTime = resultSet.getTimestamp(Constant.START_TIME);
                Date latestTime = resultSet.getTimestamp(Constant.LATEST_TIME);
                List<ChatDetail> chatContent = getChatDetailByChatID(chatId);

                Date timeFilter;
                if (currentUser.getUserId() == startUser.getUserId()) {
                    timeFilter = startIn;
                } else timeFilter = targetIn;

                for (int i = 0; i < chatContent.size(); i++) {
                    if (timeFilter == null) {
                        chatContent = new ArrayList<>();
                        break;
                    } else if (chatContent.get(i).getSentTime().compareTo(timeFilter) < 0) {
                        chatContent.remove(chatContent.get(i));
                        i--;
                    }
                }

                chat = new Chat(chatId, startUser, targetUser, startIn, targetIn, startTime, latestTime, chatContent);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return chat;
    }

    @Override
    public void startNewChat(Chat chat) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_USER_CHAT);
            preparedStatement.setInt(1, chat.getStartUser().getUserId());
            preparedStatement.setInt(2, chat.getTargetUser().getUserId());
            preparedStatement.executeUpdate();

            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void returnCurrentChat(Chat currentChat) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_CHAT);
            preparedStatement.setInt(1, currentChat.getChatId());
            preparedStatement.executeUpdate();

            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Chat findChatById(User currentUser, int currentChatId) {
        Chat chat = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_CHAT_BY_ID);
            preparedStatement.setInt(1, currentChatId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                chat = getChatInfo(currentUser, resultSet);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return chat;
    }

    @Override
    public void sentChatContent(ChatDetail chatDetail, int chatId) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CHAT);
            preparedStatement.setInt(1, chatId);
            preparedStatement.setString(2, chatDetail.getContent());
            preparedStatement.setInt(3, chatDetail.getUser().getUserId());
            preparedStatement.executeUpdate();

            PreparedStatement preparedStatement1 = connection.prepareStatement(UPDATE_USER_CHAT_BY_ID);
            preparedStatement1.setInt(1, chatId);
            preparedStatement1.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void leaveFromCurrentChat(User currentUser, Chat chat) {
        try {
            connection.setAutoCommit(false);
            if (chat.getStartUser().getUserId() == currentUser.getUserId()) {

                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_CHAT_SENT_USR);
                preparedStatement.setInt(1, chat.getChatId());
                preparedStatement.executeUpdate();
            } else {
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_CHAT_REV_USR);
                preparedStatement.setInt(1, chat.getChatId());
                preparedStatement.executeUpdate();
            }

            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private List<ChatDetail> getChatDetailByChatID(int chatId) {
        List<ChatDetail> chatDetails = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CHAT_BY_ID);
            preparedStatement.setInt(1, chatId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int chatDetailId = resultSet.getInt(Constant.CHAT_DETAIL_ID);
                int userId = resultSet.getInt(Constant.SENT_USER_ID);
                String content = resultSet.getString(Constant.CHAT_CONTENT);
                Date sentTime = resultSet.getTimestamp(Constant.SENT_DATE);
                User user = userService.findUserById(userId);
                ChatDetail chatDetail = new ChatDetail(chatDetailId, content, user, sentTime);

                chatDetails.add(chatDetail);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return chatDetails;
    }

    private Chat getChatInfo(User currentUser, ResultSet resultSet) throws SQLException {
        Chat chat;
        int chatId = resultSet.getInt(Constant.CHAT_ID);
        int startUserId = resultSet.getInt(Constant.SENT_USER_ID);
        int targetUserId = resultSet.getInt(Constant.RECEIVED_USER_ID);
        Date startIn = resultSet.getTimestamp(Constant.START_IN);
        Date targetIn = resultSet.getTimestamp(Constant.TARGET_IN);
        Date startTime = resultSet.getTimestamp(Constant.START_TIME);
        Date latestTime = resultSet.getTimestamp(Constant.LATEST_TIME);

        User startUser = userService.findUserById(startUserId);
        User targetUser = userService.findUserById(targetUserId);
        List<ChatDetail> chatContent = getChatDetailByChatID(chatId);
        Date timeFilter;
        if (currentUser.getUserId() == startUser.getUserId()) {
            timeFilter = startIn;
        } else timeFilter = targetIn;

        for (int i = 0; i < chatContent.size(); i++) {
            if (timeFilter == null) {
                chatContent = new ArrayList<>();
                break;
            } else if (chatContent.get(i).getSentTime().compareTo(timeFilter) < 0) {
                chatContent.remove(chatContent.get(i));
                i--;
            }
        }

        chat = new Chat(chatId, startUser, targetUser, startIn, targetIn, startTime, latestTime, chatContent);
        return chat;
    }
}
