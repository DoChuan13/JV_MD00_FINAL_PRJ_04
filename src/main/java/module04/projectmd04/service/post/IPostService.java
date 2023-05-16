package module04.projectmd04.service.post;

import module04.projectmd04.model.Comment;
import module04.projectmd04.model.Like;
import module04.projectmd04.model.Post;
import module04.projectmd04.model.User;

import java.util.List;

public interface IPostService {
    List<Post> showAllPostList(User currentUser);
    List<Post> showAllPostListRelativeUser(User currentUser);

    void createNewPost(Post post);

    void updateCurrentPost(Post post);

    void deleteCurrentPost(int postId);

    List<Comment> findListCommentByPostId(int postId);

    List<Like> findListLikeByPostId(int postId);
}
