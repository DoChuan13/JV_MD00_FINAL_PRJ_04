package module04.projectmd04.service.chat;

import module04.projectmd04.model.Chat;
import module04.projectmd04.model.ChatDetail;
import module04.projectmd04.model.User;

import java.util.List;

public interface IChatService {
    List<Chat> getChatListByUser(User currentUser);

    List<Chat> getChatListByUserName(User currentUser, String name);

    Chat findChatRelUser(User currentUser, int userId);

    void startNewChat(Chat chat);

    void returnCurrentChat(Chat currentChat);

    Chat findChatById(User currentUser, int chatId);

    void sentChatContent(ChatDetail chatDetail, int chatId);

    void leaveFromCurrentChat(User currentUser, Chat chat);
}
