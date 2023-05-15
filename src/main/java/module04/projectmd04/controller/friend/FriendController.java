package module04.projectmd04.controller.friend;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/friend")
public class FriendController extends HttpServlet {
    public FriendController() {
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
