<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../bootstrap/nav-bar.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"z--%>
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="left-sidebar">
        <div class="important-links">
            <a href="#"><img src="../../images/news.png" alt="">Latest News</a>
            <a href="#"><img src="../../images/friends.png" alt="">Friends</a>
            <a href="#"><img src="../../images/group.png" alt="">Groups</a>
            <a href="#"><img src="../../images/marketplace.png" alt="">marketplace</a>
            <a href="#"><img src="../../images/watch.png" alt="">Watch</a>
            <a href="#">See More</a>
        </div>

        <div class="shortcut-links">
            <p>Your Shortcuts</p>
            <a href="#"> <img src="../../images/shortcut-1.png" alt="">Web Developers</a>
            <a href="#"> <img src="../../images/shortcut-2.png" alt="">Web Design Course</a>
            <a href="#"> <img src="../../images/shortcut-3.png" alt="">Full Stack Development</a>
            <a href="#"> <img src="../../images/shortcut-4.png" alt="">Website Experts</a>
        </div>
    </div>

    <!-- main-content------- -->

    <div class="content-area">
        <div class="story-gallery">
            <div class="story story1">
                <img src="../../images/upload.png" alt="">
                <p>Post Story</p>
            </div>
            <div class="story story2">
                <img src="../../images/member-1.png" alt="">
                <p>Alison</p>
            </div>
            <div class="story story3">
                <img src="../../images/member-2.png" alt="">
                <p>Jackson</p>
            </div>
            <div class="story story4">
                <img src="../../images/member-3.png" alt="">
                <p>Samona</p>
            </div>
            <div class="story story5">
                <img src="../../images/member-4.png" alt="">
                <p>John</p>
            </div>
        </div>

        <div class="write-post-container">
            <form method="post">
                <div class="user-profile">
                    <img src="${sessionScope["loginUser"].getAvatar()}" alt="">
                    <div>
                        <p> ${sessionScope["loginUser"].getName()}</p>
                        <small>
                            <label>
                                <input type="text" name="action" value="create" readonly hidden
                                       style="position: absolute"
                                >
                                <select name="status">
                                    <option value="public" name="status">Public</option>
                                    <option value="friend" name="status">Friend</option>
                                    <option value="private" name="status">Private</option>
                                </select>
                            </label>
                        </small>
                    </div>
                </div>
                <div class="post-upload-textarea">
                    <input name="content" placeholder="What's on your mind?"
                           style="width: 100%; height: 80px;border-radius:10px;border: none;background-color: rgb(245, 242, 242);">
<%--                    <button type="submit" class="btn btn-primary">Post</button>--%>
                    <div class="add-post-links">
                        <a href="#"><img src="../../images/live-video.png" alt="">Live Video</a>
                        <a href="#"><img src="../../images/photo.png" alt="">Photo/Video</a>
                        <a href="#"><img src="../../images/feeling.png" alt="">Feeling Activity</a>
                        <button type="submit" style="font-size: 15px">Post</button>
                    </div>
                </div>
            </form>
        </div>

        <c:forEach items='${requestScope["postList"]}' var="post">
            <div class="status-field-container write-post-container">
                <div class="user-profile-box">
                    <div class="user-profile">
                        <img src="${post.getOwnUser().getAvatar()}" alt="">
                        <div>
                            <p>${post.getOwnUser().getName()}</p>
                            <small>${post.getPostStatus()}</small>
                        </div>
                    </div>
                </div>
                <div class="status-field">
                    <p>${post.getPostContent()}</p>
                    <img src="../../images/feed-image-1.png" alt="">
                </div>
                <div class="post-reaction">
                    <div class="activity-icons">
                        <div><a href="/post?action=like&postId=${post.getPostId()}" style="text-decoration: none"><img
                                src="../../images/like-blue.png" alt="">${post.getLikeList().size()}</a></div>
                        <div><img src="../../images/comments.png" alt="">${post.getCommentList().size()}</div>
                    </div>
                </div>
            </div>

        </c:forEach>

    </div>

    <!-- sidebar------------ -->
    <div class="right-sidebar">
        <div class="heading-link">
            <h4>Events</h4>
            <a href="">See All</a>
        </div>

        <div class="events">
            <div class="left-event">
                <h4>13</h4>
                <span>august</span>
            </div>
            <div class="right-event">
                <h4>Social Media</h4>
                <p><i class="fas fa-map-marker-alt"></i> wisdom em Park</p>
                <a href="#">More Info</a>
            </div>
        </div>
        <%--        <div class="events">--%>
        <%--            <div class="left-event">--%>
        <%--                <h4>18</h4>--%>
        <%--                <span>January</span>--%>
        <%--            </div>--%>
        <%--        </div>--%>

        <%--        <div class="heading-link">--%>
        <%--            <h4>Advertisement</h4>--%>
        <%--            <a href="">Close</a>--%>
        <%--        </div>--%>
        <%--<div class="advertisement">--%>
        <%--<img src="../../images/advertisement.png" class="advertisement-image" alt="">--%>
        <%--</div>--%>

        <div class="heading-link">
            <h4>Conversation</h4>
            <a href="">Hide Chat</a>
        </div>

        <div class="online-list">
            <div class="online">
                <img src="../../images/member-1.png" alt="">
            </div>
            <p>Alison Mina</p>
        </div>
    </div>
</div>
</body>
</html>
<jsp:include page="../bootstrap/footer.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
