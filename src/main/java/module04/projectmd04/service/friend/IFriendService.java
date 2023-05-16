package module04.projectmd04.service.friend;

import module04.projectmd04.model.Friend;
import module04.projectmd04.model.User;

import java.util.List;

public interface IFriendService {
    List<Friend> getAcceptFriendList(User currentUser);
    String findStatusByUserId(User currentUser, int userId);
    List<Friend> getFriendStatus(User currentUser, List<User> users);

    void sendAddFriendRequest(User currentUser, int userId);

    void cancelSentRequest(User currentUser, int userId);

    void confirmFriendRequest(User currentUser, int userId);

    void rejectFriendRequest(User currentUser, int userId);

    void cancelFriendStatus(User currentUser, int userId);

    List<Friend> getSentFriendList(User currentUser);

    List<Friend> getRequestedFriendList(User currentUser);
}
