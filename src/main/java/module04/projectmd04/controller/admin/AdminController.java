package module04.projectmd04.controller.admin;

import module04.projectmd04.config.detail.Constant;
import module04.projectmd04.config.detail.JSPLink;
import module04.projectmd04.config.detail.URL;
import module04.projectmd04.config.detail.Validate;
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
import java.util.Set;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
    private static final IUserService userService = Services.getInstance().getUserService();
    String alert;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            default:
                showFormAdminManager(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private void blockUnblockAccount(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        RoleName currentRole = RoleName.USER;
        currentRole = getCurrentRoleAcc(request, currentRole);

        User user = userService.findUserById(id);
        List<Role> roleList = new ArrayList<>(user.getRoleSet());
        RoleName targetRole = RoleName.USER;
        for (Role role : roleList) {
            if (role.getName() == RoleName.ADMIN) {
                targetRole = RoleName.ADMIN;
                break;
            } else if (targetRole == RoleName.USER && role.getName() == RoleName.PM) {
                targetRole = RoleName.PM;
            }
        }
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
                response.sendRedirect(URL.PATH_ADMIN);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void changeAccountRole(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        RoleName currentRole = RoleName.USER;
        currentRole = getCurrentRoleAcc(request, currentRole);

        User user = userService.findUserById(id);
        List<Role> roleList = new ArrayList<>(user.getRoleSet());
        RoleName targetRole = RoleName.USER;
        for (Role role : roleList) {
            if (role.getName() == RoleName.ADMIN) {
                targetRole = RoleName.ADMIN;
                break;
            } else if (targetRole == RoleName.USER && role.getName() == RoleName.PM) {
                targetRole = RoleName.PM;
            }
        }
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
                response.sendRedirect(URL.PATH_ADMIN);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void deleteUserAccount(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        RoleName currentRole = RoleName.USER;
        currentRole = getCurrentRoleAcc(request, currentRole);
        User user = userService.findUserById(id);
        List<Role> roleList = new ArrayList<>(user.getRoleSet());
        RoleName targetRole = RoleName.USER;
        for (Role role : roleList) {
            if (role.getName() == RoleName.ADMIN) {
                targetRole = RoleName.ADMIN;
                break;
            } else if (targetRole == RoleName.USER && role.getName() == RoleName.PM) {
                targetRole = RoleName.PM;
            }
        }
        if (targetRole == RoleName.ADMIN) {
            alert = "This account cannot be deleted";
            request.setAttribute(Constant.VALIDATE, alert);
            showFormAdminManager(request, response);
        } else if (targetRole == RoleName.PM && currentRole == RoleName.PM) {
            alert = "This account has no permission to deleted PM User";
            request.setAttribute(Constant.VALIDATE, alert);
            showFormAdminManager(request, response);
        } else {
            userService.delete(user.getUserId());
            try {
                response.sendRedirect(URL.PATH_ADMIN);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void showFormAdminManager(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.findAll();
        request.setAttribute(Constant.USER_LIST, userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_ADMIN_INFO);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static RoleName getCurrentRoleAcc(HttpServletRequest request, RoleName currentRole) {
        User loginUser = userService.getCurrentUser(request);
        List<Role> currentRoles = new ArrayList<>(loginUser.getRoleSet());
        for (Role role : currentRoles) {
            if (role.getName() == RoleName.ADMIN) {
                currentRole = RoleName.ADMIN;
            } else if (role.getName() == RoleName.PM && currentRole == RoleName.USER) {
                currentRole = RoleName.PM;
            }
        }
        return currentRole;
    }
}
