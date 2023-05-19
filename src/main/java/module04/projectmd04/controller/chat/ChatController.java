package module04.projectmd04.controller.chat;

import module04.projectmd04.config.detail.Constant;
import module04.projectmd04.config.detail.JSPLink;
import module04.projectmd04.controller.user.UserController;
import module04.projectmd04.model.Chat;
import module04.projectmd04.model.User;
import module04.projectmd04.service.Services;
import module04.projectmd04.service.chat.IChatService;
import module04.projectmd04.service.user.IUserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/chat")
public class ChatController extends HttpServlet {
    private static final IUserService userService = Services.getInstance().getUserService();
    private static final IChatService chatService = Services.getInstance().getChatService();

    public ChatController() {
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User currentUser = UserController.checkLoginStatus(request, response);
        if (currentUser == null) return;
        if (UserController.invalidPermissionUser(request, response)) return;

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        System.out.printf("Do Get in Chat ==> %s%n", action);

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "findChat":
                findCurrentChat(request, response);
                break;
            case "newChat":
                showFormNewChat(request, response);
                break;
            case "findName":
                showFormFindName(request, response);
            default:
                showFormChat(request, response);
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User currentUser = UserController.checkLoginStatus(request, response);
        if (currentUser == null) return;
        if (UserController.invalidPermissionUser(request, response)) return;

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        System.out.printf("Do Post in Chat ==> %s%n", action);

        if (action == null) {
            action = "";
        }
    }

    private void showFormChat(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User currentUser = UserController.checkLoginStatus(request, response);
        if (UserController.invalidPermissionUser(request, response)) return;

        List<Chat> chatList = chatService.getChatListByUser(currentUser);
        request.setAttribute(Constant.CHAT_LIST, chatList);
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_CHAT);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void findCurrentChat(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User currentUser = UserController.checkLoginStatus(request, response);
        String name = request.getParameter(Constant.NAME);
        if (UserController.invalidPermissionUser(request, response)) return;

        List<Chat> chatListResult = chatService.getChatListByUserName(currentUser, name);
        request.setAttribute(Constant.CHAT_LIST, chatListResult);
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_CHAT);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormNewChat(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<User> userList = new ArrayList<>();
        request.setAttribute(Constant.FIND_NAME, userList);
        request.setAttribute(Constant.NEW_CHAT, "newChat");
        showFormChat(request, response);
    }

    private void showFormFindName(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter(Constant.NAME);
        List<User> userList = userService.findUserByName(request, name);
        request.setAttribute(Constant.FIND_NAME, userList);
        request.setAttribute(Constant.NAME, name);
        showFormChat(request, response);
    }
}
