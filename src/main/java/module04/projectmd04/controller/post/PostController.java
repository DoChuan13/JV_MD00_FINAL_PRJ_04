package module04.projectmd04.controller.post;

import module04.projectmd04.config.detail.Constant;
import module04.projectmd04.config.detail.JSPLink;
import module04.projectmd04.config.detail.URL;
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

@WebServlet("/post")
public class PostController extends HttpServlet {
    private static final IUserService userService = Services.getInstance().getUserService();
    private static final IPostService postService = Services.getInstance().getPostService();

    public PostController() {
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter(Constant.ACTION);
        System.out.printf("Do Get in Post ==> %s%n", action);

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreateNewPost(request, response);
                break;
            case "edit":
                showFormEditCurrentPost(request, response);
                break;
            case "delete":
                deleteCurrentPost(request, response);
                break;
            case "like":
                likePost(request,response);
                break;
            default:
                showPostInfo(request, response);
        }
    }

    private void likePost(HttpServletRequest request, HttpServletResponse response) {
        int postId = Integer.parseInt(request.getParameter("postId"));
        postService.likePost(request,postId);
        try {
            response.sendRedirect(URL.PATH_POST);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
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
        }
    }

    private void showFormCreateNewPost(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_USER_POST);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormEditCurrentPost(HttpServletRequest request, HttpServletResponse response) {
    }

    private void deleteCurrentPost(HttpServletRequest request, HttpServletResponse response) {
        int postId = Integer.parseInt(request.getParameter("postID"));
        postService.deleteCurrentPost(postId);
        try {
            response.sendRedirect(URL.PATH_POST);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showPostInfo(HttpServletRequest request, HttpServletResponse response) {
        User currentUser = userService.getCurrentUser(request);
        if (currentUser == null) {
            try {
                response.sendRedirect(URL.PATH_USER_LOGIN);
                return;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(JSPLink.PATH_POST_INFO);
        postService.showAllPostList(currentUser);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionCreateNewPost(HttpServletRequest request, HttpServletResponse response) {
        String content = request.getParameter(Constant.POST_CONTENT);
        String status = request.getParameter(Constant.POST_STATUS);
        if (content.equals("") || status.equals("")) {
            setAttributePostRequest(request, response, content, status);
            return;
        }
        User user = userService.getCurrentUser(request);
        Post post = new Post(content, status, user);
        postService.createNewPost(post);
    }


    private void actionEditCurrentPost(HttpServletRequest request, HttpServletResponse response) {
        String content = request.getParameter(Constant.POST_CONTENT);
        String status = request.getParameter(Constant.POST_STATUS);
        if (content.equals("") || status.equals("")) {
            setAttributePostRequest(request, response, content, status);
            return;
        }
        User user = userService.getCurrentUser(request);
        Post post = new Post(content, status, user);
        postService.updateCurrentPost(post);
    }

    private void setAttributePostRequest(HttpServletRequest request, HttpServletResponse response, String content,
                                         String status) {
        String alert = "Do not leave Empty Field";
        request.setAttribute(Constant.VALIDATE, alert);
        request.setAttribute(Constant.POST_CONTENT, content);
        request.setAttribute(Constant.POST_STATUS, status);
        showFormCreateNewPost(request, response);
    }
    private void actionCreateComment(HttpServletRequest request,HttpServletResponse response){

    }
}
