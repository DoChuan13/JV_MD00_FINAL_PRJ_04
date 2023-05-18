<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../bootstrap/nav-bar.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<head>
    <title>Title</title>
</head>
<style>
    .avatar-upload {
        /*position: absolute;*/
    }
    /*.dropbtn {*/
    /*    background-color: #3498DB;*/
    /*    color: white;*/
    /*    padding: 16px;*/
    /*    font-size: 16px;*/
    /*    border: none;*/
    /*    cursor: pointer;*/
    /*}*/

    /*.dropbtn:hover, .dropbtn:focus {*/
    /*    background-color: #2980B9;*/
    /*}*/

    /*.dropdown {*/
    /*    position: relative;*/
    /*    display: inline-block;*/
    /*}*/

    /*.dropdown-content {*/
    /*    display: none;*/
    /*    position: absolute;*/
    /*    background-color: #f1f1f1;*/
    /*    min-width: 160px;*/
    /*    overflow: auto;*/
    /*    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);*/
    /*    z-index: 1;*/
    /*}*/

    /*.dropdown-content a {*/
    /*    color: black;*/
    /*    padding: 12px 16px;*/
    /*    text-decoration: none;*/
    /*    display: block;*/
    /*}*/

    /*.dropdown a:hover {background-color: #ddd;}*/

    /*.show {display: block;}*/
</style>
<body>
<div class="profile-container">
    <img src="../../images/cover.png" class="coverImage" alt="">
    <div class="dashboard">
        <div class="left-dashboard">
            <a href="/user?action=changeProfile"><img src="${sessionScope["loginUser"].getAvatar()}"
                                                      class="dashboard-img" alt=""></a>
            <div class="avatar-upload">
            </div>
            <div class="left-dashboard-info">
                <h3>${sessionScope["loginUser"].getName()}</h3>
                <p>${requestScope["friendCount"].size()} Friends</p>
                <div class="mutual-friend-images">
                    <img src="../../images/member-1.png" alt="">
                    <img src="../../images/member-2.png" alt="">
                    <img src="../../images/member-3.png" alt="">
                    <img src="../../images/member-5.png" alt="">
                </div>
            </div>
        </div>
        <div class="right-dashboard-info">
            <div class="right-dashboard-info-top">
                <a href="/friend">
                    <button type="button"><i class="fas fa-user-plus"></i> Friends</button>
                </a>
                <a href="/chat">
                    <button type="button"><i class="far fa-envelope"></i> messages</button>
                </a>
            </div>
            <div class="right-div-single-logo"><a href="#"> <i class="fas fa-ellipsis-h"></i></a></div>
        </div>
    </div>


    <div class="container content-profile-container">
        <div class="left-sidebar profile-left-sidebar">
            <div class="left-profile-sidebar-top">
                <div class="intro-bio">
                    <h4>intro</h4>
                    <p>Belive in yourself and you do unbelievable things <i class="far fa-smile-beam"></i></p>
                    <hr>
                </div>
                <div class="background-details">
                    <a href="#"><i class="fas fa-briefcase"></i>
                        <p>Freelancer on Fiverr</p>
                    </a>
                    <a href="#"><i class="fas fa-graduation-cap"></i>
                        <p>Studied bsc at Choumuhoni Collage</p>
                    </a>
                    <a href="#"><i class="fas fa-user-graduate"></i>
                        <p>Went to Technical School & Collage</p>
                    </a>
                    <a href="#"><i class="fas fa-home"></i>
                        <p>Lives in Noakhali, Chittagong</p>
                    </a>
                    <a href="#"><i class="fas fa-map-marker-alt"></i>
                        <p>From Chittagong, Bangladesh</p>
                    </a>
                </div>
            </div>

            <div class="left-profile-sidebar-top gallery">
                <div class="heading-link profile-heading-link">
                    <h4>Photos</h4>
                    <a href="">All Photos</a>
                </div>

                <div class="gallery-photos">
                    <div class="gallery-photos-rowFirst">
                        <img src="../../images/photo1.png" alt="">
                        <img src="../../images/photo2.png" alt="">
                        <img src="../../images/photo3.png" alt="">

                        <img src="../../images/photo4.png" alt="">
                        <img src="../../images/photo5.png" alt="">
                        <img src="../../images/photo6.png" alt="">
                    </div>
                </div>
            </div>

            <div class="left-profile-sidebar-top gallery">
                <div class="heading-link profile-heading-link">
                    <h4>Friends</h4>
                    <a href="">All Friends</a>
                </div>

                <div class="gallery-photos">
                    <div class="gallery-photos-rowFirst">
                        <div class="first-friend">
                            <img src="../../images/member-1.png" alt="">
                            <p>Nathan M</p>
                        </div>
                        <div class="second-friend">
                            <img src="../../images/member-2.png" alt="">
                            <p>Joseph N</p>
                        </div>
                        <div class="third-friend">
                            <img src="../../images/member-3.png" alt="">
                            <p>Blondie K</p>
                        </div>
                        <div class="forth-friend">
                            <img src="../../images/member-4.png" alt="">
                            <p>Jonathon J</p>
                        </div>
                        <div class="fifth-friend">
                            <img src="../../images/member-5.png" alt="">
                            <p>Mark K</p>
                        </div>
                        <div class="sixth-friend">
                            <img src="../../images/member-6.png" alt="">
                            <p>Emilia M</p>
                        </div>
                        <div class="seventh-friend">
                            <img src="../../images/member-7.png" alt="">
                            <p>Max P</p>
                        </div>
                        <div class="eighth-friend">
                            <img src="../../images/member-8.png" alt="">
                            <p>Layla M</p>
                        </div>
                        <div class="ninth-friend">
                            <img src="../../images/member-9.png" alt="">
                            <p>Edward M</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- main-content------- -->

        <div class="content-area profile-content-area">
            <form method="post">
                <div class="write-post-container">
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
                        <jsp:include page="../upload/upload-image.jsp">
                            <jsp:param name="articleId" value=""/>
                        </jsp:include>
                        <div class="add-post-links">
                            <a href="#"><img src="../../images/live-video.png" alt="">Live Video</a>
                            <a href="#"><img src="../../images/photo.png" alt="">Photo/Video</a>
                            <a href="#"><img src="../../images/feeling.png" alt="">Feeling Activity</a>
                            <button type="submit" style="font-size: 15px">Post</button>
                        </div>
                    </div>
                </div>
            </form>

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
                        <c:if test='${post.getOwnUser().getUserId()==sessionScope["loginUser"].getUserId()}'>
                            <div><a href="/user?action=deletePost&postId=${post.getPostId()}">
                                <button type="button">Delete</button>
                            </a></div>
                        </c:if>
                    </div>
                    <div class="status-field" style="padding: 10px; background-color: aliceblue; border-radius: 20px;">
                        <p>${post.getPostContent()}</p>
                        <c:if test="${post.getImageList().size()!=0}">
                            <c:forEach items="${post.getImageList()}" var="image">
                                <img src="${image}" alt="">
                            </c:forEach>
                        </c:if>
                    </div>
                    <div class="post-reaction">
                        <div class="activity-icons">
                            <div><a href="/user?action=like&postId=${post.getPostId()}"
                                    style="text-decoration: none"><img
                                    src="../../images/like-blue.png" alt="">${post.getLikeList().size()}</a></div>
                            <div><img src="../../images/comments.png" alt="">${post.getCommentList().size()}</div>
                        </div>
                    </div>
                    <c:if test='${post.getCommentList().size()!=0}'>
                        <c:forEach items="${post.getCommentList()}" var="comment">
                            <div class="row"
                                <%--                                 style="margin-bottom: 10px;background: #b2b2b2; border-radius: 20px; padding: 10px;">--%>
                                 style="position: relative; height:70px;margin-bottom: 10px;background-color: rgb(242, 242, 242); border-radius: 30px; padding: 10px; width: 88%;margin-left: 59px;">
                                <ul id="list_comment" class="col-md-12">
                                    <li class="box_result row" style="list-style: none;">
                                        <div class="avatar_comment col-md-1">
                                            <img src="${comment.getCommentUser().getAvatar()}"
                                                 alt="avatar"
                                                 style="position: absolute;margin-top: -22px;margin-left: -62px"/>
                                        </div>
                                        <div class="result_comment col-md-11">
                                            <a href="/user?action=deleteComment&postId=${post.getPostId()}&commentId=${comment.getCommentId()}" type="submit" style="position: absolute; right: 19px; margin-top: -2px; background: inherit; border: none">
                                                <i class="bi bi-reception-0" style="position: relative; right: -1px;color: rgb(166, 160, 160);"></i>
                                            </a>                                            <h4>${comment.getCommentUser().getName()}</h4>
                                            <p>${comment.getComment()}</p>

                                            <ul class="child_replay">
                                                <li class="box_reply row">
                                                    <div class="avatar_comment col-md-1">
                                                    </div>
                                                    <div class="result_comment col-md-11">
                                                        <div class="tools_comment">

                                                        </div>
                                                        <ul class="child_replay"></ul>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </c:forEach>
                    </c:if>
                    <div class="body_comment">
                        <div class="row">
                            <div class="avatar_comment col-md-1">
                                <img src="${sessionScope["loginUser"].getAvatar()}" alt="avatar"/>
                            </div>
                            <form method="post">
                                <div class="box_comment col-md-11">
                                    <input type="text" name="action" value="comment" readonly hidden
                                           style="position: absolute">
                                    <input type="text" name="postId" value="${post.getPostId()}" readonly hidden
                                           style="position: absolute">
                                    <input name="comment" placeholder="Add a comment..."
                                           style="width: 90%; height: 50px;border-radius:20px;border: none;background-color: rgb(245, 242, 242);margin-left: 55px;">
                                    <div class="box_post">
                                        <div class="pull-left">
                                        </div>
                                        <div class="pull-right">
                                            <button type="submit" value="1" style="background: none">
                                                <i class="bi bi-send"
                                                   style="position:absolute;z-index: 10; margin-left: 37px; font-size: 19px; color: rgb(171, 167, 167);"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</div>
</body>
</html>
<%--<jsp:include page="../bootstrap/footer.jsp">--%>
<%--    <jsp:param name="articleId" value=""/>--%>
<%--</jsp:include>--%>
