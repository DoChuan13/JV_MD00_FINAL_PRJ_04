package module04.projectmd04.controller.chat;

import module04.projectmd04.service.Services;
import module04.projectmd04.service.user.IUserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public final class ChatController extends HttpServlet {
    private static ChatController instance = null;
    private static final IUserService userService = Services.getUserService();

    public ChatController() {
    }

    public static synchronized ChatController getInstance() {
        if (instance == null) instance = new ChatController();
        return instance;
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Do Get in chat");
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
