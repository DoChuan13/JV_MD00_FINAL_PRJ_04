package module04.projectmd04.service.chat;

import module04.projectmd04.config.Configs;
import module04.projectmd04.config.detail.Constant;
import module04.projectmd04.model.Chat;
import module04.projectmd04.model.ChatDetail;
import module04.projectmd04.model.User;
import module04.projectmd04.service.Services;
import module04.projectmd04.service.user.IUserService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ChatServiceIMPL implements IChatService {
    private static final Connection connection = Configs.getInstance().getConnectMySQL();
    private static final IUserService userService = Services.getInstance().getUserService();
    String SELECT_FROM_USER_CHAT = "select * from userChat where receivedUserId = ? or  sentUserId = ?;";

    @Override
    public List<Chat> getChatListByUser(User currentUser) {
        List<Chat> chatList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FROM_USER_CHAT);
            preparedStatement.setInt(1, currentUser.getUserId());
            preparedStatement.setInt(2, currentUser.getUserId());
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
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
                Chat chat = new Chat(chatId, startUser, targetUser, startIn, targetIn, startTime, latestTime, chatContent);
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

    private List<ChatDetail> getChatDetailByChatID(int chatId) {
        List<ChatDetail> chatDetails = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from chat where chatId = ?");
            preparedStatement.setInt(1, chatId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int chatDetailId = resultSet.getInt(Constant.CHAT_DETAIL_ID);
                int userId = resultSet.getInt(Constant.USER_ID);
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
}
