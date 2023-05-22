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
            <a href="/friend"><img src="../../images/friends.png" alt="">Friends</a>
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
                <img src="../../images/upload.png" alt="" style="width: 45px;height: 45px">
                <p>Post Story</p>
            </div>
            <div class="story story2">
                <img src="../../images/1.jpg" alt=""style="width: 45px;height: 45px">
                <p>Alison</p>
            </div>
            <div class="story story3">
                <img src="../../images/2.jpg" alt=""style="width: 45px;height: 45px">
                <p>Jackson</p>
            </div>
            <div class="story story4">
                <img src="../../images/3.jpg" alt=""style="width: 45px;height: 45px">
                <p>Samona</p>
            </div>
            <div class="story story5">
                <img src="../../images/member-4.png" alt=""style="width: 45px;height: 45px">
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
                                <select name="status" style="border: none">
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
                    <br>
                    <%--                    <button type="submit" class="btn btn-primary">Post</button>--%>
                    <jsp:include page="../upload/upload-image.jsp">
                        <jsp:param name="articleId" value=""/>
                    </jsp:include>
                    <div class="add-post-links">
                        <a href="#"><img src="../../images/live-video.png" alt="">Live Video</a>
                        <a href="#"><img src="../../images/photo.png" alt="">Photo/Video</a>
                        <a href="#"><img src="../../images/feeling.png" alt="">Feeling Activity</a>
                        <button type="submit" style="  border: none;background-color: #1876f2;font-size: 17px;margin-top: 20px;border-radius: 10px;padding: 6px;     color: white;">Post</button>
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
                    <c:if test='${post.getOwnUser().getUserId()==sessionScope["loginUser"].getUserId()}'>
                        <div>
                            <div class="dropdown">
                                <button class="dropbtn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                                    <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                                </svg></button>
                                <div class="dropdown-content">
                                    <a href="/user?action=deletePost&postId=${post.getPostId()}">
                                        <button type="button" style="border: none;background: none">Delete</button>
                                    </a>
                                    <a>
                                        <button type="button" style="border: none;background: none" onclick="activeEditForm(${post.getPostId()})">Edit</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
                <div class="status-field" style="padding: 10px;background-color: aliceblue; border-radius: 20px">
                    <form method="post">
                        <input name="action" value="edit" type="text" hidden/>
                        <input name="postId" value="${post.getPostId()}" type="text" hidden/>

                        <input name="content" id="post_content_${post.getPostId()}"
                               value="${post.getPostContent()}" readonly
                               style="width: 100%;border: none;background: none; font-size: 15px"/>
                        <select id="option_content_${post.getPostId()}" name="status" style="display: none;border: none">
                            <option value="public" name="status">Public</option>
                            <option value="friend" name="status">Friend</option>
                            <option value="private" name="status">Private</option>
                        </select>
                        <button hidden id="summit_content_${post.getPostId()}" type="submit" style="display: none">
                            update
                        </button>
                    </form>
                    <c:if test="${post.getImageList().size()!=0}">
                        <c:forEach items="${post.getImageList()}" var="image">
                            <img src="${image}" alt="">
                        </c:forEach>
                    </c:if>
                </div>
                <div class="post-reaction">
                    <div class="activity-icons">
                        <div><a href="/post?action=like&postId=${post.getPostId()}" style="text-decoration: none"><img
                                src="../../images/like-blue.png" alt="">${post.getLikeList().size()}</a></div>
                        <div><img src="../../images/comments.png" alt="">${post.getCommentList().size()}</div>
                    </div>
                </div>
                <c:if test='${post.getCommentList().size()!=0}'>
                    <c:forEach items="${post.getCommentList()}" var="comment">
                        <div class="row"
                             style="position: relative; height:70px;margin-bottom: 10px;background-color: rgb(242, 242, 242); border-radius: 30px; padding: 10px; width: 88%;margin-left: 59px;">
                            <ul id="list_comment" class="col-md-12">
                                <li class="box_result row" style="list-style: none;">
                                    <div class="avatar_comment col-md-1">
                                        <img src="${comment.getCommentUser().getAvatar()}"
                                             alt="avatar"
                                             style="position: absolute;margin-top: -22px;margin-left: -62px"/>
                                    </div>
                                    <div class="result_comment col-md-11">
                                        <c:if test='${sessionScope["loginUser"].getUserId()==comment.getCommentUser().getUserId()}'>
                                            <a href="/post?action=deleteComment&postId=${post.getPostId()}&commentId=${comment.getCommentId()}"
                                               type="submit"
                                               style="position: absolute; right: 19px; margin-top: 8px; background: inherit; border: none">
                                                <i class="bi bi-trash"
                                                   style="position: relative; right: -1px;color: rgb(166, 160, 160); font-size: 12px"></i>
                                            </a>
                                            <button type="button" onclick="activeEditComment(${comment.getCommentId()})"
                                                    style="position: absolute; right: 19px; margin-top: -18px; background: inherit; border: none">
                                                <i class="bi bi-pencil"
                                                   style="position: relative; right: -1px;color: rgb(166, 160, 160); font-size: 12px"></i>
                                            </button>

                                        </c:if>
                                        <h4>${comment.getCommentUser().getName()}</h4>
                                            <%--<p>${comment.getComment()}</p>--%>
                                        <form method="post">
                                            <input name="action" value="editComment" type="text" hidden/>
                                            <input name="postId" value="${post.getPostId()}" type="text" hidden/>
                                            <input name="commentId" value="${comment.getCommentId()}" type="text"
                                                   hidden="">

                                            <input name="comment" id="post_comment_${comment.getCommentId()}"
                                                   value="${comment.getComment()}" readonly
                                                   style="width: 95%;border: none;background: none"/>
                                            <button hidden id="summit_content_${comment.getCommentId()}" type="submit">
                                                update
                                            </button>
                                        </form>
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
                            <div class="box_comment col-md-11 ">
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
        <div class="heading-link">
            <h4>Conversation</h4>
            <button style="display: inline; border: none; background: none" onclick="hideChatList()" id="hideAction">
                Hide Chat
            </button>
        </div>

        <c:if test='${requestScope["chatList"]!=null}'>
            <c:forEach items='${requestScope["chatList"]}' var="chat">
                <c:if test='${chat.getStartUser().getUserId()==sessionScope["loginUser"].getUserId()}'>
                    <div class="online-list">
                        <div class="online">
                            <img style="height: 40px; width: 40px;"
                                 src="${chat.getTargetUser().getAvatar()}" alt="avatar">
                        </div>
                        <p><a
                                style="text-decoration:none;"
                                href="/chat?action=chatSession&chatId=${chat.getChatId()}">
                                ${chat.getTargetUser().getName()}
                        </a></p>
                    </div>
                </c:if>
                <c:if test='${chat.getTargetUser().getUserId()==sessionScope["loginUser"].getUserId()}'>
                    <div class="online-list">
                        <div class="online">
                            <img style="height: 40px; width: 40px;"
                                 src="${chat.getStartUser().getAvatar()}" alt="avatar">
                        </div>
                        <p><a
                                style="text-decoration:none;"
                                href="/chat?action=chatSession&chatId=${chat.getChatId()}">
                                ${chat.getStartUser().getName()}
                        </a></p>
                    </div>
                </c:if>
            </c:forEach>
        </c:if>
    </div>
</div>
</body>
</html>
<script>
    function activeEditForm(postId) {
        let post = document.getElementById("post_content_" + postId);
        post.removeAttribute("readonly");
        let summit = document.getElementById("summit_content_" + postId);
        post.style.background = "rgb(222, 214, 214)";
        let options = document.getElementById("option_content_" + postId);

        console.log(options);
        options.style.display = "block";
        // summit.style.display = "block";
    }

    function activeEditComment(commentId) {
        let comment = document.getElementById("post_comment_" + commentId);
        comment.removeAttribute("readonly");
        comment.style.background = "rgb(222, 214, 214)";

        let summit = document.getElementById("summit_content_" + commentId);
        // summit.style.display = "block";
    }

    let hide_show = document.getElementById("hideAction");

    function hideChatList() {
        let chatList = document.querySelectorAll(".online-list");
        console.log(chatList)
        for (let i = 0; i < chatList.length; i++) {
            chatList[i].style.display = "none";
        }
        hide_show.setAttribute("onclick", "showChatList()")
        hide_show.innerHTML = "Show Chat";
    }

    function showChatList() {
        let chatList = document.querySelectorAll(".online-list");
        console.log(chatList)
        for (let i = 0; i < chatList.length; i++) {
            chatList[i].style.display = "flex";
        }
        hide_show.setAttribute("onclick", "hideChatList()")
        hide_show.innerHTML = "Hide Chat";
    }
</script>
<%--<jsp:include page="../bootstrap/footer.jsp">--%>
<%--    <jsp:param name="articleId" value=""/>--%>
<%--</jsp:include>--%>