package module04.projectmd04.service.post;

import module04.projectmd04.config.Configs;
import module04.projectmd04.model.Like;
import module04.projectmd04.model.Comment;
import module04.projectmd04.model.Post;
import module04.projectmd04.model.User;
import module04.projectmd04.service.user.UserServiceIMPL;

import javax.servlet.http.HttpServletRequest;
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

    String LIKE_POST = "select lP.userId from user join likePost lP on user.userId = lP.userId where lP.likeId =? and user.userId=?";
    String INSERT_INTO_CREATE_COMMENT = "insert into comment( content) value (?);";

    @Override
    public void showAllPostList(User currentUser) {

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

    @Override
    public void likePost(HttpServletRequest request, int postId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(LIKE_POST);
            preparedStatement.setInt(1, postId);
            User currentUser = new UserServiceIMPL().getCurrentUser(request);
            int userId = currentUser.getUserId();
            preparedStatement.setInt(2, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            List<Like> likeList = new ArrayList<>();
            PreparedStatement preparedStatement1 = connection.prepareStatement(LIKE_POST);
            while (resultSet.next()) {
                int likeId = resultSet.getInt("likeId");
                likeList.add(new Like(likeId, currentUser));
            }
            if (likeList.size() == 0) {
                likeList.add(new Like());
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void createComment(Comment comment, HttpServletRequest request, int postId) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CREATE_COMMENT,
                    Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, comment.getComment());
            preparedStatement.executeUpdate();
            int commentId = 0;
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_INTO_USER_POST);
            while (resultSet.next()) {
                commentId = resultSet.getInt(1);
            }
            int userId = new UserServiceIMPL().getCurrentUser(request).getUserId();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}