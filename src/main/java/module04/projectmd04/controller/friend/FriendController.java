package module04.projectmd04.controller.friend;

import module04.projectmd04.service.Services;
import module04.projectmd04.service.friend.IFriendService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/friend")
public class FriendController extends HttpServlet {
    private static final IFriendService friendService = Services.getInstance().getFriendService();

    public FriendController() {
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        System.out.printf("Do Get in Friend ==> %s%n", action);

        if (action == null) {
            action = "";
        }

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        System.out.printf("Do Post in Friend ==> %s%n", action);

        if (action == null) {
            action = "";
        }
    }
}
