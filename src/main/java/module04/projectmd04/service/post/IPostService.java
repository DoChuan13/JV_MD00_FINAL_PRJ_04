package module04.projectmd04.service.post;

import module04.projectmd04.model.Post;
import module04.projectmd04.model.User;

import javax.servlet.http.HttpServletRequest;

public interface IPostService {
    void showAllPostList(User currentUser);

    void createNewPost(Post post);

    void updateCurrentPost(Post post);

    void deleteCurrentPost(int postId);

    void likePost(HttpServletRequest request, int id);


}
