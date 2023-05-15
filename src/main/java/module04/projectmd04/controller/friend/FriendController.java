package module04.projectmd04.controller.friend;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FriendController extends HttpServlet {
    private static FriendController instance = null;

    public FriendController() {
    }

    public static synchronized FriendController getInstance() {
        if (instance == null) instance = new FriendController();
        return instance;
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.printf("Do Get in Friend ==> %s%n", action);

        if (action == null) {
            action = "";
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.printf("Do Post in Friend ==> %s%n", action);

        if (action == null) {
            action = "";
        }
    }
}
