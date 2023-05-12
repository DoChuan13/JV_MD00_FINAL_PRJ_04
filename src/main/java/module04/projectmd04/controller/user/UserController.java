package module04.projectmd04.controller.user;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public final class UserController extends HttpServlet {
    private static UserController instance = null;

    public UserController() {
    }

    public static synchronized UserController getInstance() {
        if (instance == null) instance = new UserController();
        return instance;
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
