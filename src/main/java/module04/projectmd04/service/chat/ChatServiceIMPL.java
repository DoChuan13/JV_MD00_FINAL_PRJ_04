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
    String SELECT_FROM_USER_CHAT = "select * from userChat where receivedUserId = ? or  sentUserId = ?;";
    String SELECT_USER_CHAT_BY_USERS = "select * from userChat where (sentUserId = ? and receivedUserId = ?) or (receivedUserId = ? and  sentUserId = ?);";

    String INSERT_INTO_USER_CHAT = "insert into userChat (sentUserId, receivedUserId) values(?, ?);";
    String UPDATE_USER_CHAT = "update userChat set latestTime = ?,sentUserId =?, receivedUserId =? where chatId = ?;";
    String INSERT_INTO_CHAT = "insert into chat(chatId, content, sentUserId) values (?,?,?);";
    String SELECT_USER_CHAT_BY_ID = "select * from userChat where chatId = ?;";
    String UPDATE_USER_CHAT_BY_ID = "update userChat set latestTime = now() where chatId = ?;";
    String SELECT_CHAT_BY_ID = "select * from chat where chatId = ?";

    @Override
    public List<Chat> getChatListByUser(User currentUser) {
        List<Chat> chatList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FROM_USER_CHAT);
            preparedStatement.setInt(1, currentUser.getUserId());
            preparedStatement.setInt(2, currentUser.getUserId());
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Chat chat = getChatInfo(resultSet);
                chatList.add(chat);
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
                Date startIn = resultSet.getDate(Constant.START_IN);
                Date targetIn = resultSet.getDate(Constant.TARGET_IN);
                Date startTime = resultSet.getDate(Constant.START_TIME);
                Date latestTime = resultSet.getDate(Constant.LATEST_TIME);
                List<ChatDetail> chatContent = getChatDetailByChatID(chatId);

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
            preparedStatement.setDate(1, (java.sql.Date) currentChat.getLatestTime());
            preparedStatement.setDate(2, (java.sql.Date) currentChat.getStartIn());
            preparedStatement.setDate(3, (java.sql.Date) currentChat.getTargetIn());
            preparedStatement.setInt(4, currentChat.getChatId());
            preparedStatement.executeUpdate();

            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Chat findChatById(int currentChatId) {
        Chat chat = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_CHAT_BY_ID);
            preparedStatement.setInt(1, currentChatId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                chat = getChatInfo(resultSet);
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
                Date sentTime = resultSet.getDate(Constant.SENT_DATE);
                User user = userService.findUserById(userId);
                ChatDetail chatDetail = new ChatDetail(chatDetailId, content, user, sentTime);

                chatDetails.add(chatDetail);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return chatDetails;
    }

    private Chat getChatInfo(ResultSet resultSet) throws SQLException {
        Chat chat;
        int chatId = resultSet.getInt(Constant.CHAT_ID);
        int startUserId = resultSet.getInt(Constant.SENT_USER_ID);
        int targetUserId = resultSet.getInt(Constant.RECEIVED_USER_ID);
        Date startIn = resultSet.getDate(Constant.START_IN);
        Date targetIn = resultSet.getDate(Constant.TARGET_IN);
        Date startTime = resultSet.getDate(Constant.START_TIME);
        Date latestTime = resultSet.getDate(Constant.LATEST_TIME);

        User startUser = userService.findUserById(startUserId);
        User targetUser = userService.findUserById(targetUserId);
        List<ChatDetail> chatContent = getChatDetailByChatID(chatId);
        chat = new Chat(chatId, startUser, targetUser, startIn, targetIn, startTime, latestTime, chatContent);
        return chat;
    }
}
