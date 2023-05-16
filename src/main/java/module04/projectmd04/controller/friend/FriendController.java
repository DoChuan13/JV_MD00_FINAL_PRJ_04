package module04.projectmd04.controller.friend;

import module04.projectmd04.config.detail.JSPLink;
import module04.projectmd04.config.detail.URL;
import module04.projectmd04.model.User;
import module04.projectmd04.service.Services;
import module04.projectmd04.service.friend.IFriendService;
import module04.projectmd04.service.user.IUserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/friend")
public class FriendController extends HttpServlet {
    private static final IFriendService friendService = Services.getInstance().getFriendService();
    private static final IUserService userService = Services.getInstance().getUserService();

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
        switch (action) {
            default:
                showFriendPage(request,response);
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

    private void showFriendPage(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser == null) {
            try {
                response.sendRedirect(URL.PATH_USER_LOGIN);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_USER_FRIEND);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
