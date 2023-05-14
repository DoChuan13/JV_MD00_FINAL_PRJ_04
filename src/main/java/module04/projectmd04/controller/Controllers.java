package module04.projectmd04.controller;

import module04.projectmd04.config.detail.URL;
import module04.projectmd04.controller.chat.ChatController;
import module04.projectmd04.controller.friend.FriendController;
import module04.projectmd04.controller.post.PostController;
import module04.projectmd04.controller.user.UserController;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "Controllers", value = "/")
public final class Controllers extends HttpServlet {
    private static final ChatController chatController = ChatController.getInstance();
    private static final FriendController friendController = FriendController.getInstance();
    private static final PostController postController = PostController.getInstance();
    private static final UserController userController = UserController.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String extendPathURL = request.getServletPath();

        if (extendPathURL.startsWith(URL.PATH_CHAT)) {
            chatController.doGet(request, response);
            return;
        }
        if (extendPathURL.startsWith(URL.PATH_FRIEND)) {
            friendController.doGet(request, response);
            return;
        }
        if (extendPathURL.startsWith(URL.PATH_POST)) {
            postController.doGet(request, response);
        }
        if (extendPathURL.startsWith(URL.PATH_USER)) {
            userController.doGet(request, response);
            return;
        }
        response.sendRedirect(URL.PATH_HOME);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String extendPathURL = request.getServletPath();
        if (extendPathURL.startsWith(URL.PATH_CHAT)) {
            chatController.doPost(request, response);
            return;
        }
        if (extendPathURL.startsWith(URL.PATH_FRIEND)) {
            friendController.doPost(request, response);
            return;
        }
        if (extendPathURL.startsWith(URL.PATH_POST)) {
            postController.doPost(request, response);
            return;
        }
        if (extendPathURL.startsWith(URL.PATH_USER)) {
            userController.doPost(request, response);
            return;
        }
        response.sendRedirect(URL.PATH_HOME);
    }
}