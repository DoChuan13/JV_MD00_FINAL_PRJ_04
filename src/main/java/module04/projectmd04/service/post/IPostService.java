package module04.projectmd04.service.post;

import module04.projectmd04.model.Comment;
import module04.projectmd04.model.Post;
import module04.projectmd04.model.User;
import javax.servlet.http.HttpServletRequest;
import module04.projectmd04.model.Like;

import java.util.List;

public interface IPostService {
    List<Post> showAllPostList(User currentUser);
    List<Post> showAllPostListRelativeUser(User currentUser);

    void createNewPost(Post post);

    void updateCurrentPost(Post post);

    void deleteCurrentPost(int postId);

    void likePost(HttpServletRequest request, int id);

    void createComment(String comment, HttpServletRequest request, int postId);

    List<Comment> findListCommentByPostId(int postId);

    List<Like> findListLikeByPostId(int postId);

    void deleteCurrentComment(int postId, int commentId);
}
