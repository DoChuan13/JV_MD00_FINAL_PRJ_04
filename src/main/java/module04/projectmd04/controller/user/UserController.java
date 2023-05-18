package module04.projectmd04.controller.user;

import module04.projectmd04.config.detail.Constant;
import module04.projectmd04.config.detail.JSPLink;
import module04.projectmd04.config.detail.URL;
import module04.projectmd04.config.detail.Validate;
import module04.projectmd04.controller.post.PostController;
import module04.projectmd04.model.*;
import module04.projectmd04.service.Services;
import module04.projectmd04.service.friend.IFriendService;
import module04.projectmd04.service.post.IPostService;
import module04.projectmd04.service.role.IRoleService;
import module04.projectmd04.service.user.IUserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet("/user")
public class UserController extends HttpServlet {
    private static final IUserService userService = Services.getInstance().getUserService();
    private static final IRoleService roleService = Services.getInstance().getRoleService();
    private static final IPostService postService = Services.getInstance().getPostService();
    private static final IFriendService friendService = Services.getInstance().getFriendService();
    private String alert;

    public UserController() {
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter(Constant.ACTION);
        System.out.printf("Do Get in User ==> %s%n", action);
        User currentUser = userService.getCurrentUser(request);
        if (currentUser != null) {
            List<Friend> acceptedFriend = friendService.getAcceptFriendList(currentUser);
            request.setAttribute("friendCount", acceptedFriend);
        }

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "register":
                showFormRegister(request, response);
                break;
            case "login":
                showFormLogin(request, response);
                break;
            case "like":
                likePostInUser(request, response);
                break;
            case "changeProfile":
                showFormChangeProfile(request, response);
                break;
            case "changePassword":
                showFormPassword(request, response);
                break;
            case "logout":
                logoutUser(request, response);
                break;
            case "delete":
                deleteCurrentPost(request, response);
                break;
            default:
                showUserInfo(request, response);
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter(Constant.ACTION);
        System.out.printf("Do Post in User ==> %s%n", action);

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "register":
                actionRegister(request, response);
                break;
            case "login":
                actionLogin(request, response);
                break;
            case "create":
                actionCreateNewPost(request, response);
                break;
            case "changeProfile":
                actionChangeProfile(request, response);
                break;
            case "changePassword":
                actionChangePassword(request, response);
                break;
            case "comment":
                actionCreateComment(request, response);
        }
    }

    private void deleteCurrentPost(HttpServletRequest request, HttpServletResponse response) {
        int postId = Integer.parseInt(request.getParameter(Constant.POST_ID));
        postService.deleteCurrentPost(postId);
        try {
            response.sendRedirect(URL.PATH_USER);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionCreateComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int postId = Integer.parseInt(request.getParameter(Constant.POST_ID));
        String comment = request.getParameter(Constant.COMMENT);
        if (comment.equals("")) {
            showUserInfo(request, response);
            return;
        }
        postService.createComment(comment, request, postId);
        try {
            response.sendRedirect(URL.PATH_USER);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionCreateNewPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (invalidPermissionUser(request, response)) return;
        String content = request.getParameter(Constant.POST_CONTENT);
        String status = request.getParameter(Constant.POST_STATUS);
        String avatar = request.getParameter(Constant.AVATAR);
        if (content.equals("") || status.equals("")) {
            new PostController().setAttributePostRequest(request, response, content, status);
            return;
        }
        String[] imgArr = avatar.split("--%%%%%%%%%%--");
        List<String> imgList = new ArrayList<>();
        Collections.addAll(imgList, imgArr);
        User currentUser = userService.getCurrentUser(request);
        Post post = new Post(content, status, currentUser, imgList);
        postService.createNewPost(post);
        try {
            response.sendRedirect(URL.PATH_USER);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormRegister(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser != null) {
            try {
                response.sendRedirect(URL.PATH_HOME);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_FORM_REGISTER);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormLogin(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser != null) {
            try {
                response.sendRedirect(URL.PATH_HOME);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_FORM_LOGIN);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void logoutUser(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        if (session.getAttribute(Constant.LOGIN_USER) != null) {
            session.removeAttribute(Constant.LOGIN_USER);
            session.invalidate();
            try {
                response.sendRedirect(URL.PATH_USER_LOGIN);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void showUserInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User currentUser = checkLoginStatus(request, response);
        if (invalidPermissionUser(request, response)) return;
        List<Post> postList = postService.showAllPostList(currentUser);
        request.setAttribute(Constant.POST_LIST, postList);
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_USER_INFO);
        postService.showAllPostList(currentUser);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void actionRegister(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser != null) {
            try {
                response.sendRedirect(URL.PATH_HOME);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        String name = request.getParameter(Constant.NAME);
        String userName = request.getParameter(Constant.USER_NAME);
        String email = request.getParameter(Constant.EMAIL);
        String password = request.getParameter(Constant.PASSWORD);
        String rePassword = request.getParameter(Constant.RE_PASSWORD);
        String userRole = String.valueOf(RoleName.USER);

        Set<String> stringSet = new HashSet<>();
        stringSet.add(userRole);
        Set<Role> roleSet = generateRoleSet(stringSet);

        if (!Validate.validateName(name)) {
            alert = "Name is Invalid!";
            setAttributeRegisterRequest(request, alert, name, userName, email, password);
            showFormRegister(request, response);
            return;
        }

        if (!Validate.validateUserName(userName)) {
            alert = "UserName is Invalid!";
            setAttributeRegisterRequest(request, alert, name, userName, email, password);
            showFormRegister(request, response);
            return;
        }

        if (!Validate.validateEmail(email)) {
            alert = "Email is Invalid!";
            setAttributeRegisterRequest(request, alert, name, userName, email, password);
            showFormRegister(request, response);
            return;
        }

        if (!Validate.validatePassword(password)) {
            alert = "Password is Invalid!";
            setAttributeRegisterRequest(request, alert, name, userName, email, password);
            showFormRegister(request, response);
            return;
        }

        if (userService.existedByUserName(userName)) {
            alert = "UserName is existed!";
            setAttributeRegisterRequest(request, alert, name, userName, email, password);
            showFormRegister(request, response);
            return;
        }
        if (userService.existByEmail(email)) {
            alert = "Email is existed!";
            setAttributeRegisterRequest(request, alert, name, userName, email, password);
            showFormRegister(request, response);
            return;
        }

        if (!password.equals(rePassword)) {
            alert = "Re-Password not match!";
            setAttributeRegisterRequest(request, alert, name, userName, email, password);
            showFormRegister(request, response);
            return;
        }

        User user = new User(name, userName, email, password, roleSet);
        userService.save(user);
        try {
            response.sendRedirect(URL.PATH_USER_LOGIN);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionChangeProfile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User currentUser = checkLoginStatus(request, response);
        if (currentUser == null) return;
        if (invalidPermissionUser(request, response)) return;
        String name = request.getParameter(Constant.NAME);
        String userName = request.getParameter(Constant.USER_NAME);
        String email = request.getParameter(Constant.EMAIL);
        String password = request.getParameter(Constant.PASSWORD);
        String avatar = request.getParameter(Constant.AVATAR);
        if (avatar.equals("")) {
            avatar = currentUser.getAvatar();
        } else {
            String[] imgArr = avatar.split("--%%%%%%%%%%--");
            avatar = imgArr[0];
        }

        if (!Validate.validateName(name)) {
            alert = "Name is Invalid!";
            setAttributeRegisterRequest(request, alert, name, userName, email, password);
            showFormChangeProfile(request, response);
            return;
        }

        if (!Validate.validateUserName(userName)) {
            alert = "UserName is Invalid!";
            setAttributeRegisterRequest(request, alert, name, userName, email, password);
            showFormChangeProfile(request, response);
            return;
        }

        if (!Validate.validateEmail(email)) {
            alert = "Email is Invalid!";
            setAttributeRegisterRequest(request, alert, name, userName, email, password);
            showFormChangeProfile(request, response);
            return;
        }

        if (!password.equals(currentUser.getPassword())) {
            alert = "Password is not Exact!";
            setAttributeRegisterRequest(request, alert, name, userName, email, password);
            showFormChangeProfile(request, response);
            return;
        }

        if (!userName.equalsIgnoreCase(currentUser.getUserName())) {
            if (userService.existedByUserName(userName)) {
                alert = "UserName is existed!";
                setAttributeRegisterRequest(request, alert, name, userName, email, password);
                showFormChangeProfile(request, response);
                return;
            }
        }
        if (!email.equalsIgnoreCase(currentUser.getEmail())) {
            if (userService.existByEmail(email)) {
                alert = "Email is existed!";
                setAttributeRegisterRequest(request, alert, name, userName, email, password);
                showFormChangeProfile(request, response);
                return;
            }
        }

        currentUser.setName(name);
        currentUser.setUserName(userName);
        currentUser.setEmail(email);
        currentUser.setPassword(password);
        currentUser.setAvatar(avatar);
        userService.updateCurrentUser(currentUser);
        try {
            response.sendRedirect(URL.PATH_USER);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionChangePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User currentUser = checkLoginStatus(request, response);
        if (currentUser == null) return;
        if (invalidPermissionUser(request, response)) return;
        String password = request.getParameter(Constant.PASSWORD);
        String newPassword = request.getParameter(Constant.NEW_PASSWORD);
        String rePassword = request.getParameter(Constant.RE_PASSWORD);

        if (!password.equals(currentUser.getPassword())) {
            alert = "Current password not match!";
            setAttributeRegisterRequest(request, alert, currentUser.getName(), currentUser.getUserName(), currentUser.getEmail(), password);
            showFormPassword(request, response);
            return;
        }

        if (!Validate.validatePassword(newPassword)) {
            alert = "New Password is Invalid!";
            setAttributeRegisterRequest(request, alert, currentUser.getName(), currentUser.getUserName(), currentUser.getEmail(), password);
            showFormPassword(request, response);
            return;
        }

        if (!newPassword.equals(rePassword)) {
            alert = "Re-Password not match!";
            setAttributeRegisterRequest(request, alert, currentUser.getName(), currentUser.getUserName(), currentUser.getEmail(), password);
            showFormPassword(request, response);
            return;
        }

        currentUser.setPassword(newPassword);
        userService.updateCurrentUser(currentUser);
        try {
            response.sendRedirect(URL.PATH_USER);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void likePostInUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User currentUser = checkLoginStatus(request, response);
        if (currentUser == null) return;
        if (invalidPermissionUser(request, response)) return;
        int postId = Integer.parseInt(request.getParameter("postId"));
        postService.likePost(request, postId);
        try {
            response.sendRedirect(URL.PATH_USER);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionLogin(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter(Constant.USER_NAME);
        String password = request.getParameter(Constant.PASSWORD);

        User user = userService.userLogin(userName, password);
        if (user == null) {
            alert = "Login failed!!! Please try again";
            setAttributeLoginRequest(request, alert, userName, password);
            showFormLogin(request, response);
            return;
        }
        HttpSession session = request.getSession();
        session.setAttribute(Constant.LOGIN_USER, user);
        RoleName role = userService.redirectAction(user, response);
        try {
            switch (role) {
                case ADMIN:
                case PM:
                    response.sendRedirect(URL.PATH_ADMIN);
                    break;
                case USER:
                    response.sendRedirect(URL.PATH_POST);
                    break;
            }

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

    private void setAttributeRegisterRequest(HttpServletRequest request, String alert, String name, String userName, String email, String password) {
        request.setAttribute(Constant.VALIDATE, alert);
        request.setAttribute(Constant.NAME, name);
        request.setAttribute(Constant.USER_NAME, userName);
        request.setAttribute(Constant.EMAIL, email);
        request.setAttribute(Constant.PASSWORD, password);
    }

    private void setAttributeLoginRequest(HttpServletRequest request, String alert, String userName, String password) {
        request.setAttribute(Constant.VALIDATE, alert);
        request.setAttribute(Constant.USER_NAME, userName);
        request.setAttribute(Constant.PASSWORD, password);
    }

    private void showFormChangeProfile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User currentUser = checkLoginStatus(request, response);
        if (currentUser == null) return;
        if (invalidPermissionUser(request, response)) return;
        request.setAttribute(Constant.ACTION, Constant.PROFILE_CHANGE);
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.CHANGE_PROFILE);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (invalidPermissionUser(request, response)) return;
        request.setAttribute(Constant.ACTION, Constant.PASS_CHANGE);
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.CHANGE_PROFILE);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean invalidPermissionUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User currentUser = checkLoginStatus(request, response);
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
            if (!userRole) {
                response.sendRedirect(URL.PATH_ADMIN);
                return true;
            }
        }
        return false;
    }

    public static User checkLoginStatus(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser == null) {
            try {
                response.sendRedirect(URL.PATH_USER_LOGIN);
                return null;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        return currentUser;
    }
}
