package module04.projectmd04.controller.admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("role");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "pm":
                showFormPMManager(request, response);
                break;
            default:
                showFormAdminManager(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private void showFormPMManager(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showFormAdminManager(HttpServletRequest request, HttpServletResponse response) {
    }
}
