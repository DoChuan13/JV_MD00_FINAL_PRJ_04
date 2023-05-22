<%@ page import="module04.projectmd04.service.user.UserServiceIMPL" %>
<%@ page import="module04.projectmd04.service.friend.FriendServiceIMPL" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../bootstrap/nav-bar.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
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
                <p>${requestScope["friendCount"].size()} Friends</p>
                <div class="mutual-friend-images">
                    <img src="../../images/member-1.png" alt="">
                    <img src="../../images/member-2.png" alt="">
                    <img src="../../images/member-3.png" alt="">
                    <img src="../../images/member-5.png" alt="">
                </div>
            </div>
        </div>
    </div>


    <div class="container content-profile-container">
        <div class="left-sidebar profile-left-sidebar">
            <div class="left-profile-sidebar-top">
                <div class="intro-bio">
                    <a href="/friend">
                        <button style=" border: none;background-color: #1876f2;font-size: 17px;margin-top: 20px;border-radius: 10px;padding: 6px;    color: white; "">List Friend</button>
                    </a>
                    <br/>
                    <a href="/friend?action=showSentRequest">
                        <button style=" border: none;background-color: #1876f2;font-size: 17px;margin-top: 20px;border-radius: 10px;padding: 6px;    color: white; "">Sent Request</button>
                    </a>
                    <br/>
                    <a href="/friend?action=showRequestFriend">
                        <button style=" border: none;background-color: #1876f2;font-size: 17px;margin-top: 20px;border-radius: 10px;padding: 6px;    color: white; "">Friend Request</button>
                    </a>
                    <hr>
                </div>
            </div>
        </div>

        <!-- main-content------- -->

        <div class="content-area profile-content-area">
            <div class="status-field-container write-post-container">
                <form method="get">
                    <input type="text" name="action" value="find" readonly hidden
                           style="position: absolute">
                    <input name="name" placeholder="Input name to find..."
                           style="width: 100%; height: 40px;border-radius:10px;border: none;background-color: rgb(245, 242, 242);">

                    <button type="submit" style=" border: none;background-color: #1876f2;font-size: 17px;margin-top: 20px;border-radius: 10px;padding: 6px;    color: white; ">Search</button>
                </form>
            </div>
            <c:if test='${requestScope["friendList"].size()==0}'>
                <div class="status-field-container write-post-container">
                    <div class="user-profile-box">
                        <div class="user-profile-box">
                            <p>You have no any friend</p>
                        </div>
                        <div class="status-field">
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test='${requestScope["friendList"].size()!=0}'>
                <c:forEach items='${requestScope["friendList"]}' var="friend">
                    <c:if test='${friend.getFriend2().getUserId()!= sessionScope["loginUser"].getUserId()}'>
                        <div class="status-field-container write-post-container">
                            <div class="user-profile-box">
                                <div class="user-profile-box">
                                    <div class="user-profile">
                                        <img src="${friend.getFriend2().getAvatar()}" alt="Avatar">
                                        <div>
                                            <p>${friend.getFriend2().getName()}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="status-field">
                                    <c:if test='${friend.getStatus() == "none"||friend.getStatus() == "rejected"}'>
                                        <div>
                                            <a href="/friend?action=sendRequest&userId=${friend.getFriend2().getUserId()}">
                                                <button type="button">Add Friend</button>
                                            </a></div>
                                    </c:if>
                                    <c:if test='${friend.getStatus() == "accepted"}'>
                                        <div>
                                            <a href="/friend?action=cancelFriend&userId=${friend.getFriend2().getUserId()}">
                                                <button type="button">Friends</button>
                                            </a></div>
                                    </c:if>
                                    <c:if test='${friend.getStatus() == "requested"}'>
                                        <div>
                                            <a href="/friend?action=confirmRequest&userId=${friend.getFriend2().getUserId()}">
                                                <button type="button">Confirm</button>
                                            </a>
                                            <a href="/friend?action=rejectRequest&userId=${friend.getFriend2().getUserId()}">
                                                <button type="button">Reject</button>
                                            </a>
                                        </div>
                                    </c:if>
                                    <c:if test='${friend.getStatus() == "pending"}'>
                                        <div>
                                            <a href="/friend?action=cancelRequest&userId=${friend.getFriend2().getUserId()}">
                                                <button type="button">Cancel Sent Request</button>
                                            </a></div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test='${friend.getFriend1().getUserId()!= sessionScope["loginUser"].getUserId()}'>
                        <div class="status-field-container write-post-container">
                            <div class="user-profile-box">
                                <div class="user-profile-box">
                                    <div class="user-profile">
                                        <img src="${friend.getFriend1().getAvatar()}" alt="Avatar">
                                        <div>
                                            <p>${friend.getFriend1().getName()}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="status-field">
                                    <c:if test='${friend.getStatus() == "none"||friend.getStatus() == "rejected"}'>
                                        <div>
                                            <a href="/friend?action=sendRequest&userId=${friend.getFriend1().getUserId()}">
                                                <button type="button">Add Friend</button>
                                            </a></div>
                                    </c:if>
                                    <c:if test='${friend.getStatus() == "accepted"}'>
                                        <div>
                                            <a href="/friend?action=cancelFriend&userId=${friend.getFriend1().getUserId()}">
                                                <button type="button">Friends</button>
                                            </a></div>
                                    </c:if>
                                    <c:if test='${friend.getStatus() == "requested"}'>
                                        <div>
                                            <a href="/friend?action=confirmRequest&userId=${friend.getFriend1().getUserId()}">
                                                <button type="button">Confirm</button>
                                            </a>
                                            <a href="/friend?action=rejectRequest&userId=${friend.getFriend1().getUserId()}">
                                                <button type="button">Reject</button>
                                            </a>
                                        </div>
                                    </c:if>
                                    <c:if test='${friend.getStatus() == "pending"}'>
                                        <div>
                                            <a href="/friend?action=cancelRequest&userId=${friend.getFriend1().getUserId()}">
                                                <button type="button">Cancel Sent Request</button>
                                            </a></div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
<%--<jsp:include page="../bootstrap/footer.jsp">--%>
<%--    <jsp:param name="articleId" value=""/>--%>
<%--</jsp:include>--%>
