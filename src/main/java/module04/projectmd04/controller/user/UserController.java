package module04.projectmd04.controller.user;

import module04.projectmd04.model.role.Role;
import module04.projectmd04.model.role.RoleName;
import module04.projectmd04.model.user.User;
import module04.projectmd04.service.Services;
import module04.projectmd04.service.role.IRoleService;
import module04.projectmd04.service.user.IUserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

public final class UserController extends HttpServlet {
    private static UserController instance = null;
    private static final IUserService userService = Services.getUserService();
    private static final IRoleService roleService = Services.getRoleService();
    private final String VALIDATE = "validate";
    private String ALERT;
    String PATH_FORM_REGISTER = "WEB-INF/register/register.jsp";
    String PATH_FORM_LOGIN = "WEB-INF/login/login.jsp";
    String PATH_HOME = "/";

    public UserController() {
    }

    public static synchronized UserController getInstance() {
        if (instance == null) instance = new UserController();
        return instance;
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        System.out.println("Do Get in user");

        switch (action) {
            case "register":
                showFormRegister(request, response);
                break;
            case "login":
                showFormLogin(request, response);
                break;
            default:

        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        System.out.println("Do Post in user");

        switch (action) {
            case "register":
                actionRegister(request, response);
                break;
            case "login":
                actionLogin(request, response);
                break;
            default:

        }
    }

    private void showFormRegister(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(PATH_FORM_REGISTER);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormLogin(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(PATH_FORM_LOGIN);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionRegister(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");
        String userRole = String.valueOf(RoleName.USER);

        Set<String> stringSet = new HashSet<>();
        stringSet.add(userRole);
        Set<Role> roleSet = generateRoleSet(stringSet);

        if (userService.existedByUserName(userName)) {
            ALERT = "UserName is existed!";
            request.setAttribute(VALIDATE, ALERT);
            showFormRegister(request, response);
            return;
        }
        if (userService.existByEmail(email)) {
            ALERT = "Email is existed!";
            request.setAttribute(VALIDATE, ALERT);
            showFormRegister(request, response);
            return;
        }

        if (!password.equals(rePassword)) {
            ALERT = "Password not match!";
            request.setAttribute(VALIDATE, ALERT);
            showFormRegister(request, response);
            return;
        }

        User user = new User(name, userName, email, password, roleSet);
        userService.save(user);
        try {
            response.sendRedirect("/user?action=login");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionLogin(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        User user = userService.userLogin(userName, password);
        if (user == null) {
            ALERT = "Login failed!!! Please try again";
            request.setAttribute(VALIDATE, ALERT);
            showFormLogin(request, response);
            return;
        }
        HttpSession session = request.getSession();
        session.setAttribute("loginUser", user);
        try {
            response.sendRedirect(PATH_HOME);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private Set<Role> generateRoleSet(Set<String> stringSet) {
        Set<Role> roleSet = new HashSet<>();
        stringSet.forEach(role -> {
            switch (role) {
                case "ADMIN":
                    roleSet.add(roleService.findByRoleName(RoleName.ADMIN));
                    break;

                case "PM":
                    roleSet.add(roleService.findByRoleName(RoleName.PM));
                    break;

                case "USER":
                    roleSet.add(roleService.findByRoleName(RoleName.USER));
                    break;
            }
        });
        return roleSet;
    }
}
