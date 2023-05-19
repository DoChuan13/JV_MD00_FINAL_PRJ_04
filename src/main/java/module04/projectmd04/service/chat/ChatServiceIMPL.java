package module04.projectmd04.service.chat;

import module04.projectmd04.config.Configs;
import module04.projectmd04.config.detail.Constant;
import module04.projectmd04.model.Chat;
import module04.projectmd04.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ChatServiceIMPL implements IChatService {
    private static final Connection connection = Configs.getInstance().getConnectMySQL();

    @Override
    public List<Chat> getChatListByUser(User currentUser) {
        List<Chat> chatList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from userChat where receivedUserId = ? or  sentUserId = ?");
            preparedStatement.setInt(1, currentUser.getUserId());
            preparedStatement.setInt(2, currentUser.getUserId());
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int chatId = resultSet.getInt(Constant.CHAT_ID);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
