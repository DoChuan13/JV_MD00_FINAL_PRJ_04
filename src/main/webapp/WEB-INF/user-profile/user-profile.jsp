<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../bootstrap/nav-bar.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<head>
    <title>Title</title>
</head>
<body>
<div class="profile-container">
    <img src="../../images/cover.png" class="coverImage" alt="">
    <div class="dashboard">
        <div class="left-dashboard">
            <img src="${sessionScope["loginUser"].getAvatar()}" class="dashboard-img" alt="">
            <div class="left-dashboard-info">
                <h3>${sessionScope["loginUser"].getName()}</h3>
                <p>120 Friends - 20 mutuals</p>
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
                <a href="#">
                    <button type="button"><i class="fas fa-user-plus"></i> Friends</button>
                </a>
                <a href="#">
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
            <div class="write-post-container">
                <div class="user-profile">
                    <img src="${sessionScope["loginUser"].getAvatar()}" alt="">
                    <div>
                        <p> ${sessionScope["loginUser"].getName()}</p>
                        <small>Public <i class="fas fa-caret-down"></i></small>
                    </div>
                </div>

                <div class="post-upload-textarea">
                    <textarea name="" placeholder="What's on your mind, Alex?" id="" cols="30" rows="3"></textarea>
                    <div class="add-post-links">
                        <a href="#"><img src="../../images/live-video.png" alt="">Live Video</a>
                        <a href="#"><img src="../../images/photo.png" alt="">Photo/Video</a>
                        <a href="#"><img src="../../images/feeling.png" alt="">Feeling Activity</a>
                    </div>
                </div>
            </div>

            <c:forEach items='${requestScope["postList"]}' var="post">
                <div class="status-field-container write-post-container">
                    <div class="user-profile-box">
                        <div class="user-profile">
                            <img src="${sessionScope["loginUser"].getAvatar()}" alt="">
                            <div>
                                <p> ${sessionScope["loginUser"].getName()}</p>
                                    <%--<small>August 13 1999, 09.18 pm</small>--%>
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
                    <div class="container">
                        <div class="col-md-12" id="fbcomment">
                            <div class="header_comment">
                                <div class="row">
                                    <div class="col-md-6 text-left">

                                    </div>

                                </div>
                            </div>


                            <div class="row">
                                <ul id="list_comment" class="col-md-12">
                                    <!-- Start List Comment 1 -->
                                    <li class="box_result row">
                                        <div class="avatar_comment col-md-1">
                                            <img src="https://static.xx.fbcdn.net/rsrc.php/v1/yi/r/odA9sNLrE86.jpg" alt="avatar"/>
                                        </div>
                                        <div class="result_comment col-md-11">
                                            <h4>Nath Ryuzaki</h4>
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p>

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

                                    <!-- Start List Comment 2 -->
                                    <li class="box_result row">
                                        <div class="avatar_comment col-md-1">
                                            <img src="https://static.xx.fbcdn.net/rsrc.php/v1/yi/r/odA9sNLrE86.jpg" alt="avatar"/>
                                        </div>
                                        <div class="result_comment col-md-11">
                                            <h4>Gung Wah</h4>
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.</p>

                                            <ul class="child_replay"></ul>
                                        </div>
                                    </li>
                                </ul>

                                <button class="show_less" type="button" style="display:none"><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Loading...</button>
                            </div>
                            <div class="body_comment">
                                <div class="row">
                                    <div class="avatar_comment col-md-1">
                                        <img src="https://static.xx.fbcdn.net/rsrc.php/v1/yi/r/odA9sNLrE86.jpg" alt="avatar"/>
                                    </div>
                                    <div class="box_comment col-md-11">
                                        <textarea class="commentar" placeholder="Add a comment..."></textarea>
                                        <div class="box_post">
                                            <div class="pull-left">

                                            </div>
                                            <div class="pull-right">
                                                <button onclick="submit_comment()" type="button" value="1">Post</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
<jsp:include page="../bootstrap/footer.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
