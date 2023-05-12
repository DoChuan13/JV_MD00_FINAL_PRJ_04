package module04.projectmd04.controller.user;

import module04.projectmd04.service.Services;
import module04.projectmd04.service.user.IUserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public final class UserController extends HttpServlet {
    private static UserController instance = null;
    private static final IUserService userService = Services.getUserService();

    public UserController() {
    }

    public static synchronized UserController getInstance() {
        if (instance == null) instance = new UserController();
        return instance;
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Do Get in user");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
