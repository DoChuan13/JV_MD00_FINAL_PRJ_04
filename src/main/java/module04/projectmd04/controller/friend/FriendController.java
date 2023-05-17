package module04.projectmd04.controller.friend;

import module04.projectmd04.config.detail.Constant;
import module04.projectmd04.config.detail.JSPLink;
import module04.projectmd04.config.detail.URL;
import module04.projectmd04.model.Friend;
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
import java.util.ArrayList;
import java.util.List;

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
        User currentUser = userService.getCurrentUser(request);
        if (currentUser != null) {
            List<Friend> acceptedFriend = friendService.getAcceptFriendList(currentUser);
            request.setAttribute("friendCount", acceptedFriend);
        }

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "find":
                findFriendToAdd(request, response);
                break;
            case "sendRequest":
                sendAddFriendRequest(request, response);
                break;
            case "cancelFriend":
                cancelFriendStatus(request, response);
                break;
            case "confirmRequest":
                confirmFriendRequest(request, response);
                break;
            case "rejectRequest":
                rejectFriendRequest(request, response);
                break;
            case "cancelRequest":
                cancelSentRequest(request, response);
                break;
            case "showSentRequest":
                showSentRequest(request, response);
                break;
            case "showRequestFriend":
                showRequestFriend(request, response);
                break;
            default:
                showFriendPage(request, response);
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
        String action = request.getParameter("action");
        if (action == null) {
            List<Friend> friendList = friendService.getAcceptFriendList(currentUser);
            request.setAttribute(Constant.FRIEND_LIST, friendList);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_USER_FRIEND);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void findFriendToAdd(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser == null) {
            try {
                response.sendRedirect(URL.PATH_USER_LOGIN);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        String name = request.getParameter("name");
        List<User> userList = userService.findUserByName(request, name);
        List<Friend> friendList = friendService.getFriendStatus(currentUser, userList);
        request.setAttribute(Constant.FRIEND_LIST, friendList);
        showFriendPage(request, response);
    }

    private void sendAddFriendRequest(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser == null) {
            try {
                response.sendRedirect(URL.PATH_USER_LOGIN);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        int userId = Integer.parseInt(request.getParameter(Constant.USER_ID));
        friendService.sendAddFriendRequest(currentUser, userId);
        try {
            response.sendRedirect(URL.PATH_FRIEND);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void cancelFriendStatus(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser == null) {
            try {
                response.sendRedirect(URL.PATH_USER_LOGIN);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        int userId = Integer.parseInt(request.getParameter(Constant.USER_ID));
        friendService.cancelFriendStatus(currentUser, userId);
        try {
            response.sendRedirect(URL.PATH_FRIEND);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void confirmFriendRequest(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser == null) {
            try {
                response.sendRedirect(URL.PATH_USER_LOGIN);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        int userId = Integer.parseInt(request.getParameter(Constant.USER_ID));
        friendService.confirmFriendRequest(currentUser, userId);
        try {
            response.sendRedirect(URL.PATH_FRIEND);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void rejectFriendRequest(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser == null) {
            try {
                response.sendRedirect(URL.PATH_USER_LOGIN);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        int userId = Integer.parseInt(request.getParameter(Constant.USER_ID));
        friendService.rejectFriendRequest(currentUser, userId);
        try {
            response.sendRedirect(URL.PATH_FRIEND);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void cancelSentRequest(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser == null) {
            try {
                response.sendRedirect(URL.PATH_USER_LOGIN);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        int userId = Integer.parseInt(request.getParameter(Constant.USER_ID));
        friendService.cancelSentRequest(currentUser, userId);
        try {
            response.sendRedirect(URL.PATH_FRIEND);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showSentRequest(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser == null) {
            try {
                response.sendRedirect(URL.PATH_USER_LOGIN);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        List<Friend> friendList = friendService.getSentFriendList(currentUser);
        request.setAttribute(Constant.FRIEND_LIST, friendList);
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_USER_FRIEND);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showRequestFriend(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser == null) {
            try {
                response.sendRedirect(URL.PATH_USER_LOGIN);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        List<Friend> friendList = friendService.getRequestedFriendList(currentUser);
        request.setAttribute(Constant.FRIEND_LIST, friendList);
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_USER_FRIEND);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
