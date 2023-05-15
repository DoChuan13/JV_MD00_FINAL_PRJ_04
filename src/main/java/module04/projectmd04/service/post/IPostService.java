package module04.projectmd04.service.post;

import module04.projectmd04.model.Post;
import module04.projectmd04.model.User;

public interface IPostService {
    void createNewPost(Post post);

    void showAllPostList(User currentUser);
}
