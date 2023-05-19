package module04.projectmd04.service.chat;

import module04.projectmd04.model.Chat;
import module04.projectmd04.model.User;

import java.util.List;

public interface IChatService {
    List<Chat> getChatListByUser(User currentUser);

    List<Chat> getChatListByUserName(User currentUser, String name);
}
