package module04.projectmd04.controller.post;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PostController extends HttpServlet {
    private static PostController instance = null;

    public PostController() {
    }

    public static PostController getInstance() {
        if (instance == null) instance = new PostController();
        return instance;
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.printf("Do Get in Post ==> %s%n", action);

        if (action == null) {
            action = "";
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.printf("Do Post in Post ==> %s%n", action);

        if (action == null) {
            action = "";
        }
    }
}
