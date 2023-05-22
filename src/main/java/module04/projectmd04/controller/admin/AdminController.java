package module04.projectmd04.controller.admin;

import module04.projectmd04.config.detail.Constant;
import module04.projectmd04.config.detail.JSPLink;
import module04.projectmd04.config.detail.URL;
import module04.projectmd04.controller.user.UserController;
import module04.projectmd04.model.Role;
import module04.projectmd04.model.RoleName;
import module04.projectmd04.model.User;
import module04.projectmd04.service.Services;
import module04.projectmd04.service.user.IUserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
    private static final IUserService userService = Services.getInstance().getUserService();
    String alert;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        if (invalidPermissionAdmin(request, response)) return;

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "blockUser":
            case "unblockUser":
                blockUnblockAccount(request, response);
                break;
            case "changeRole":
                changeAccountRole(request, response);
                break;
            case "delete":
                deleteUserAccount(request, response);
                break;
            case "logout":
                UserController.logoutUser(request, response);
                break;
            default:
                showFormAdminManager(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        if (invalidPermissionAdmin(request, response)) return;

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

    private void blockUnblockAccount(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User currentUser = userService.getCurrentUser(request);
        RoleName currentRole = getRoleNameByUser(currentUser);
        User user = userService.findUserById(id);
        RoleName targetRole = getRoleNameByUser(user);

        if (targetRole == RoleName.ADMIN) {
            alert = "This account cannot be block/unblock";
            request.setAttribute(Constant.VALIDATE, alert);
            showFormAdminManager(request, response);
        } else if (targetRole == RoleName.PM && currentRole == RoleName.PM) {
            alert = "This account has no permission to block/unblock PM User";
            request.setAttribute(Constant.VALIDATE, alert);
            showFormAdminManager(request, response);
        } else {
            userService.blockUnblockAccount(user);
            try {
                int currentPage = getNewCurrentPage(request);
                response.sendRedirect(URL.PATH_ADMIN_PAGE + currentPage);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void changeAccountRole(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User currentUser = userService.getCurrentUser(request);
        RoleName currentRole = getRoleNameByUser(currentUser);
        User user = userService.findUserById(id);
        RoleName targetRole = getRoleNameByUser(user);

        if (currentRole == RoleName.PM) {
            alert = "This account has no permission to change role";
            request.setAttribute(Constant.VALIDATE, alert);
            showFormAdminManager(request, response);
        } else if (targetRole == RoleName.ADMIN) {
            alert = "This account cannot change role";
            request.setAttribute(Constant.VALIDATE, alert);
            showFormAdminManager(request, response);
        } else {
            userService.changeAccountRole(user);
            try {
                int currentPage = getNewCurrentPage(request);
                response.sendRedirect(URL.PATH_ADMIN_PAGE + currentPage);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void deleteUserAccount(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        User currentUser = userService.getCurrentUser(request);
        RoleName currentRole = getRoleNameByUser(currentUser);
        User targetUser = userService.findUserById(id);
        RoleName targetRole = getRoleNameByUser(targetUser);

        if (targetRole == RoleName.ADMIN) {
            alert = "This account cannot be deleted";
            request.setAttribute(Constant.VALIDATE, alert);
            showFormAdminManager(request, response);
        } else if (targetRole == RoleName.PM && currentRole == RoleName.PM) {
            alert = "This account has no permission to deleted PM User";
            request.setAttribute(Constant.VALIDATE, alert);
            showFormAdminManager(request, response);
        } else {
            userService.delete(targetUser.getUserId());
            try {
                int currentPage = getNewCurrentPage(request);
                response.sendRedirect(URL.PATH_ADMIN_PAGE + currentPage);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private static int getNewCurrentPage(HttpServletRequest request) {
        String page = request.getParameter(Constant.PAGE);
        List<User> allList = userService.findAll();

        int currentPage = Integer.parseInt(page);
        int maxElement = allList.size();
        int maxPage = (int) ((float) maxElement % 5 == 0 ? (float) maxElement / 5 : ((float) maxElement / 5 + 1));
        if (currentPage > maxPage) {
            currentPage = maxPage;
        }
        return currentPage;
    }

    private void showFormAdminManager(HttpServletRequest request, HttpServletResponse response) {
        String page = request.getParameter(Constant.PAGE);
        if (page == null) {
            try {
                page = "1";
                response.sendRedirect(URL.PATH_ADMIN_PAGE + page);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        List<User> allList = userService.findAll();
        List<User> userList = userService.getUserListByPage(page);

        int currentPage = Integer.parseInt(page);
        int maxElement = allList.size();
        int maxPage = (int) ((float) maxElement % 5 == 0 ? (float) maxElement / 5 : ((float) maxElement / 5 + 1));

        request.setAttribute(Constant.MAX_ELEMENT, maxElement);
        request.setAttribute(Constant.CURRENT_PAGE, currentPage);
        request.setAttribute(Constant.MAX_PAGE, maxPage);
        request.setAttribute(Constant.USER_LIST, userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_ADMIN_INFO);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static boolean invalidPermissionAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User currentUser = UserController.checkLoginStatus(request, response);
        if (currentUser == null) return true;
        else {
            List<Role> roleList = new ArrayList<>(currentUser.getRoleSet());
            boolean userRole = true;
            for (Role role : roleList) {
                if (role.getName() == RoleName.ADMIN || role.getName() == RoleName.PM) {
                    userRole = false;
                    break;
                }
            }
            if (userRole) {
                response.sendRedirect(URL.PATH_POST);
                return true;
            }
        }
        return false;
    }

    private static RoleName getRoleNameByUser(User user) {
        RoleName targetRole = RoleName.USER;
        List<Role> roleList = new ArrayList<>(user.getRoleSet());
        for (Role role : roleList) {
            if (role.getName() == RoleName.ADMIN) {
                targetRole = RoleName.ADMIN;
                break;
            } else if (targetRole == RoleName.USER && role.getName() == RoleName.PM) {
                targetRole = RoleName.PM;
            }
        }
        return targetRole;
    }
}
