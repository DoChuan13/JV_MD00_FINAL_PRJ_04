package module04.projectmd04.service.post;

import module04.projectmd04.config.Configs;
import module04.projectmd04.model.Comment;
import module04.projectmd04.model.Like;
import module04.projectmd04.model.Post;
import module04.projectmd04.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostServiceIMPL implements IPostService {
    private static final Connection connection = Configs.getInstance().getConnectMySQL();
    String INSERT_INTO_POST = "insert into post (content, status) values (?, ?);";
    String INSERT_INTO_USER_POST = "insert into userPost(postId, userId) values (?, ?);";
    String UPDATE_POST_INFO = "update post set content = ?, status = ? where postId = ?;";
    String DELETE_FROM_LIKE_POST = "delete from likePost where postId = ?;";
    String DELETE_FROM_COMMENT_POST = "delete from commentPost where postId = ?;";
    String DELETE_FROM_POST = "delete from post where postId = ?;";
    String DELETE_FROM_LIKE = "delete from `like` where likeId not in (select likeId from likePost);";
    String DELETE_FROM_COMMENT = "delete from comment where commentId not in (select commentId from commentPost);";
    String SELECT_POST_OWNER = "select p.* from post p join userPost uP on p.postId = uP.postId where up.userId = ?;";
    String SELECT_POST_RE_USER = "select p.* from post p join userPost uP on p.postId = uP.postId join user u on u.userId = uP.userId where (up.userId = ?) or (p.status = 'public' and ());";
    String SELECT_FROM_COMMENT = "select c.*, u.* from comment c " +
                                 "join commentPost cP on c.commentId = cP.commentId " +
                                 "join user u on u.userId = cP.userId where cp.postId = ?";

    String SELECT_FROM_LIKE = "select * from `like` " +
                              "join likePost lP on `like`.likeId = lP.likeId " +
                              "join user u on u.userId = lP.userId where lp.postId = ?;";

    @Override
    public List<Post> showAllPostList(User currentUser) {
        List<Post> postList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POST_OWNER);
            preparedStatement.setInt(1, currentUser.getUserId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int postId = resultSet.getInt("postId");
                String postContent = resultSet.getString("content");
                String postStatus = resultSet.getString("status");
                Date postDate = resultSet.getDate("postedDate");
                List<Comment> commentList = findListCommentByPostId(postId);
                List<Like> likeList = findListLikeByPostId(postId);

                postList.add(new Post(postId, currentUser, postContent, postStatus, postDate, commentList, likeList));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return postList;
    }

    @Override
    public List<Post> showAllPostListRelativeUser(User currentUser) {
        List<Post> postList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POST_RE_USER);
            preparedStatement.setInt(1, currentUser.getUserId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int postId = resultSet.getInt("postId");
                String postContent = resultSet.getString("content");
                String postStatus = resultSet.getString("status");
                Date postDate = resultSet.getDate("postedDate");
                List<Comment> commentList = findListCommentByPostId(postId);
                List<Like> likeList = findListLikeByPostId(postId);

                postList.add(new Post(postId, currentUser, postContent, postStatus, postDate, commentList, likeList));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return postList;
    }

    @Override
    public void createNewPost(Post post) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_POST,
                                                                              Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, post.getPostContent());
            preparedStatement.setString(2, post.getPostStatus());

            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_INTO_USER_POST);
            while (resultSet.next()) {
                preparedStatement1.setInt(1, resultSet.getInt("postId"));
                preparedStatement1.setInt(2, post.getOwnUser().getUserId());
                preparedStatement1.executeUpdate();
            }
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void updateCurrentPost(Post post) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_POST_INFO);
            preparedStatement.setString(1, post.getPostContent());
            preparedStatement.setString(2, post.getPostStatus());
            preparedStatement.setInt(2, post.getPostId());

            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void deleteCurrentPost(int postId) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FROM_LIKE_POST);
            preparedStatement.setInt(1, postId);
            preparedStatement.executeUpdate();

            PreparedStatement preparedStatement1 = connection.prepareStatement(DELETE_FROM_COMMENT_POST);
            preparedStatement1.setInt(1, postId);
            preparedStatement1.executeUpdate();

            PreparedStatement preparedStatement2 = connection.prepareStatement(DELETE_FROM_POST);
            preparedStatement2.setInt(1, postId);
            preparedStatement2.executeUpdate();

            PreparedStatement preparedStatement3 = connection.prepareStatement(DELETE_FROM_LIKE);
            preparedStatement3.executeUpdate();

            PreparedStatement preparedStatement4 = connection.prepareStatement(DELETE_FROM_COMMENT);
            preparedStatement4.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Comment> findListCommentByPostId(int postId) {
        List<Comment> commentList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FROM_COMMENT);
            preparedStatement.setInt(1, postId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int commentId = resultSet.getInt("commentId");
                String commentContent = resultSet.getString("content");

                int userId = resultSet.getInt("userId");
                String name = resultSet.getString("name");
                String userName = resultSet.getString("userName");
                String avatar = resultSet.getString("avatar");
                User userComment = new User(userId, name, userName, avatar);
                Comment comment = new Comment(commentId, userComment, commentContent);
                commentList.add(comment);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return commentList;
    }

    public List<Like> findListLikeByPostId(int postId) {
        List<Like> likeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FROM_LIKE);
            preparedStatement.setInt(1, postId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int likeId = resultSet.getInt("likeId");
                int userId = resultSet.getInt("userId");
                String name = resultSet.getString("name");
                String userName = resultSet.getString("userName");
                String avatar = resultSet.getString("avatar");
                User userLike = new User(userId, name, userName, avatar);
                Like like = new Like(likeId, userLike);
                likeList.add(like);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return likeList;
    }
}