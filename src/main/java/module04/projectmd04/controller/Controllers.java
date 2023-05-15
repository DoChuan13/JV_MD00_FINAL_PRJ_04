package module04.projectmd04.controller;

import module04.projectmd04.config.detail.URL;
import module04.projectmd04.controller.chat.ChatController;
import module04.projectmd04.controller.friend.FriendController;
import module04.projectmd04.controller.post.PostController;
import module04.projectmd04.controller.user.UserController;
import module04.projectmd04.model.RoleName;
import module04.projectmd04.model.User;
import module04.projectmd04.service.Services;

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String extendPathURL = request.getServletPath();
        System.out.println("Do Get in Main");
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
        redirectRolePage(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String extendPathURL = request.getServletPath();
        System.out.println("Do Post in Main");
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
        redirectRolePage(request, response);
    }

    private void redirectRolePage(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("loginUser");
        RoleName role = Services.getInstance().getUserService().redirectAction(user, response);
        try {
            if (role == RoleName.ADMIN) {
                response.sendRedirect(URL.PATH_ADMIN);
                return;
            }
            if (role == RoleName.PM) {
                response.sendRedirect(URL.PATH_PM);
                return;
            }
            response.sendRedirect(URL.PATH_HOME);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}