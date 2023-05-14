package module04.projectmd04.controller;

import module04.projectmd04.controller.chat.ChatController;
import module04.projectmd04.controller.user.UserController;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "Controllers", value = "/")
public final class Controllers extends HttpServlet {
    private static final UserController userController = UserController.getInstance();
    private static final ChatController chatController = ChatController.getInstance();
    private static final String PATH_USER = "/user";
    private static final String PATH_CHAT = "/chat";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String extendPathURL = request.getServletPath();
        if (extendPathURL.startsWith(PATH_USER)) {
            userController.doGet(request, response);
            return;
        }
        if (extendPathURL.startsWith(PATH_CHAT)) {
            chatController.doGet(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String extendPathURL = request.getServletPath();
        if (extendPathURL.startsWith(PATH_USER)) {
            userController.doPost(request, response);
            return;
        }
        if (extendPathURL.startsWith(PATH_CHAT)) {
            chatController.doPost(request, response);
        }
    }
}