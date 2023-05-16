package module04.projectmd04.service.post;

import module04.projectmd04.config.Configs;
import module04.projectmd04.model.Comment;
import module04.projectmd04.model.Post;
import module04.projectmd04.model.User;
import module04.projectmd04.service.user.UserServiceIMPL;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.List;

public class PostServiceIMPL implements IPostService  {
    private static final Connection connection = Configs.getInstance().getConnectMySQL();
    private static final String INSERT_INTO_POST = "insert into post (content, status) values (?, ?);";
    private static final String INSERT_INTO_USER_POST = "insert into userPost(postId, userId) values (?, ?);";
    private static final String UPDATE_POST_INFO = "update post set content = ?, status = ? where postId = ?;";
    private static final String INSERT_INTO_CREATE_COMMENT="insert into comment( content) value (?);";


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
    public void createComment(Comment comment, HttpServletRequest request,int postId) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement=connection.prepareStatement(INSERT_INTO_CREATE_COMMENT,Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1,comment.getComment());
            preparedStatement.executeUpdate();
            int commentId=0;
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            PreparedStatement preparedStatement1 = connection.prepareStatement(INSERT_INTO_USER_POST);
            while (resultSet.next()){
                commentId=resultSet.getInt(1);
            }
            int userId =new UserServiceIMPL().getCurrentUser(request).getUserId();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}