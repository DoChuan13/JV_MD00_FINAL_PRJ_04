package module04.projectmd04.service.post;

import module04.projectmd04.model.Comment;
import module04.projectmd04.model.Post;
import module04.projectmd04.model.User;
import module04.projectmd04.service.generic.IGenericService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IPostService  {
    void showAllPostList(User currentUser);

    void createNewPost(Post post);

    void updateCurrentPost(Post post);
    void createComment(Comment comment, HttpServletRequest request, int postId);

}
