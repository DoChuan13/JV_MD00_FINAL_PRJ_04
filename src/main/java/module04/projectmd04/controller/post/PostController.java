package module04.projectmd04.controller.post;

import module04.projectmd04.config.detail.Constant;
import module04.projectmd04.config.detail.JSPLink;
import module04.projectmd04.config.detail.URL;
import module04.projectmd04.controller.user.UserController;
import module04.projectmd04.model.Post;
import module04.projectmd04.model.User;
import module04.projectmd04.service.Services;
import module04.projectmd04.service.post.IPostService;
import module04.projectmd04.service.user.IUserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet("/post")
public class PostController extends HttpServlet {
    private static final IUserService userService = Services.getInstance().getUserService();
    private static final IPostService postService = Services.getInstance().getPostService();

    public PostController() {
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User currentUser = UserController.checkLoginStatus(request, response);
        if (currentUser == null) return;
        if (UserController.invalidPermissionUser(request,response))return;

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter(Constant.ACTION);
        System.out.printf("Do Get in Post ==> %s%n", action);

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "deletePost":
                deleteCurrentPost(request, response);
                break;
            case "like":
                likePost(request, response);
                break;
            case "deleteComment":
                deleteCurrentComment(request,response);
                break;
            default:
                showPostInfo(request, response);
        }
    }

    private void deleteCurrentComment(HttpServletRequest request, HttpServletResponse response) {
        int postId = Integer.parseInt(request.getParameter(Constant.POST_ID));
        int commentId = Integer.parseInt(request.getParameter(Constant.COMMENT_ID));
        postService.deleteCurrentComment(postId,commentId);
        try {
            response.sendRedirect(URL.PATH_POST);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void likePost(HttpServletRequest request, HttpServletResponse response) {
        int postId = Integer.parseInt(request.getParameter("postId"));
        postService.likePost(request, postId);
        try {
            response.sendRedirect(URL.PATH_POST);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User currentUser = UserController.checkLoginStatus(request, response);
        if (currentUser == null) return;
        if (UserController.invalidPermissionUser(request,response))return;

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter(Constant.ACTION);
        System.out.printf("Do Post in Post ==> %s%n", action);

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                actionCreateNewPost(request, response);
                break;
            case "edit":
                actionEditCurrentPost(request, response);
                break;
            case "comment":
                actionCreateComment(request, response);
                break;
            case "editComment":
                actionEditComment(request,response);
                break;
        }
    }

    private void actionEditComment(HttpServletRequest request, HttpServletResponse response) {
        int commentId = Integer.parseInt(request.getParameter(Constant.COMMENT_ID));
        String comment = request.getParameter(Constant.COMMENT);
        postService.updateComment(commentId,comment);
        try {
            response.sendRedirect(URL.PATH_POST);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void deleteCurrentPost(HttpServletRequest request, HttpServletResponse response) {
        int postId = Integer.parseInt(request.getParameter(Constant.POST_ID));
        postService.deleteCurrentPost(postId);
        try {
            response.sendRedirect(URL.PATH_POST);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showPostInfo(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        List<Post> postList = postService.showAllPostListRelativeUser(currentUser);
        request.setAttribute(Constant.POST_LIST, postList);
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_POST_INFO);
        postService.showAllPostList(currentUser);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void actionCreateNewPost(HttpServletRequest request, HttpServletResponse response) {
        String content = request.getParameter(Constant.POST_CONTENT);
        String status = request.getParameter(Constant.POST_STATUS);
        String images = request.getParameter(Constant.AVATAR);
        if (content.equals("") || status.equals("")) {
            setAttributePostRequest(request, response, content, status);
            return;
        }
        List<String> imgList = new ArrayList<>();
        if (!images.equalsIgnoreCase("")) {
            String[] imgArr = images.split("--%%%%%%%%%%--");
            Collections.addAll(imgList, imgArr);
        }
        User currentUser = userService.getCurrentUser(request);
        Post post = new Post(content, status, currentUser, imgList);
        postService.createNewPost(post);
        try {
            response.sendRedirect(URL.PATH_POST);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void actionEditCurrentPost(HttpServletRequest request, HttpServletResponse response) {
        int postID= Integer.parseInt(request.getParameter("postId"));
        String content = request.getParameter(Constant.POST_CONTENT);
        String status = request.getParameter(Constant.POST_STATUS);
        if (content.equals("") || status.equals("")) {
            setAttributePostRequest(request, response, content, status);
            return;
        }
        User currentUser = userService.getCurrentUser(request);
        Post post = new Post(postID,content, status, currentUser);
        postService.updateCurrentPost(post);
        try {
            response.sendRedirect(URL.PATH_POST);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void setAttributePostRequest(HttpServletRequest request, HttpServletResponse response, String content,
                                        String status) {
        String alert = "Do not leave Empty Field";
        request.setAttribute(Constant.VALIDATE, alert);
        request.setAttribute(Constant.POST_CONTENT, content);
        request.setAttribute(Constant.POST_STATUS, status);
        showPostInfo(request, response);
    }

    private void actionCreateComment(HttpServletRequest request, HttpServletResponse response) {
        int postId = Integer.parseInt(request.getParameter(Constant.POST_ID));
        String comment = request.getParameter(Constant.COMMENT);
        if (comment.equals("")) {
            showPostInfo(request, response);
            return;
        }
        postService.createComment(comment, request, postId);
        try {
            response.sendRedirect(URL.PATH_POST);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
