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
<style>
    /*#password-group, #rePassword-group, #newPassword-group, #curr-password-group {*/
    /*    display: none;*/
    /*}*/

    #password-group input, #rePassword-group input, #newPassword-group input {
        text-align: end;
    }
</style>
<body>
<div class="profile-container">
    <img src="../../images/cover.png" class="coverImage" alt="">
    <div class="dashboard">
        <div class="left-dashboard">
            <a href="/user?action=changeProfile"><img src="${sessionScope["loginUser"].getAvatar()}"
                                                      class="dashboard-img" alt=""></a>
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
                    <a href="/user?action=changeProfile">
                        <button>Change Profile</button>
                    </a>
                    <br/>
                    <a href="/user?action=changePassword">
                        <button>Change Password</button>
                    </a>
                    <hr>
                </div>
            </div>
        </div>

        <!-- main-content------- -->

        <div class="content-area profile-content-area">
            <c:if test='${requestScope["validate"]!=null}'>
                <p style="color: red;">${requestScope["validate"]}</p>
            </c:if>
            <c:if test='${requestScope["action"]=="changeProfile"}'>
                <form method="post">
                    <input id="action" type='text' name='action' hidden readonly
                           value="changeProfile"/>
                    <jsp:include page="../upload/upload-image.jsp">
                        <jsp:param name="articleId" value=""/>
                    </jsp:include>
                    <div class="status-field-container write-post-container">
                        <div class="user-profile-box">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>User Name</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="userName-field" type='text' name='userName'
                                           value='${sessionScope['loginUser'].getUserName()}'/></div>
                            </div>
                        </div>
                    </div>
                    <div class="status-field-container write-post-container">
                        <div class="user-profile-box">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>Name</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="name-field" type='text' name='name'
                                           value='${sessionScope["loginUser"].getName()}'/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="status-field-container write-post-container">
                        <div class="user-profile-box">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>Email</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="email-field" type='text' name='email'
                                           value='${sessionScope["loginUser"].getEmail()}'/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="status-field-container write-post-container" id="password-group">
                        <div class="user-profile-box">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>Password</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="password-field" type='password' name='password'/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button id="submit-field" type="submit">Update Info
                    </button>
                </form>
            </c:if>
            <c:if test='${requestScope["action"]=="changePassword"}'>
                <form method="post">
                    <input id="" type='text' name='action' hidden readonly
                           value="changePassword"/>
                    <div class="status-field-container write-post-container" id="curr-password-group">
                        <div class="user-profile-box">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>Password</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="curr-password-field" type='password' name='password'/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="status-field-container write-post-container " id="newPassword-group">
                        <div class="user-profile-box">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>New-Password</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="new-password-field" type='password' name='newPassword'/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="status-field-container write-post-container " id="rePassword-group">
                        <div class="user-profile-box">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>Re-Password</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="re-password-field" type='password' name='rePassword'/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button id="submit-pass-field" type="submit">Update
                        Password
                    </button>
                </form>
            </c:if>
        </div>
    </div>
</div>
</body>
<%--<script>--%>
<%--    let avatar = document.getElementById("avatar");--%>
<%--    let userName = document.getElementById("userName-field");--%>
<%--    let name = document.getElementById("name-field");--%>
<%--    let email = document.getElementById("email-field");--%>
<%--    let password = document.getElementById("password-group");--%>
<%--    let submitField = document.getElementById("submit-field");--%>

<%--    let currPassword = document.getElementById("curr-password-group");--%>
<%--    let newPassword = document.getElementById("newPassword-group");--%>
<%--    let rePassword = document.getElementById("rePassword-group");--%>
<%--    let submitPassField = document.getElementById("submit-pass-field");--%>
<%--    avatar.setAttribute("readonly", "true");--%>

<%--    function changeProfile() {--%>
<%--        avatar.removeAttribute("readonly");--%>
<%--        userName.removeAttribute("readonly");--%>
<%--        name.removeAttribute("readonly");--%>
<%--        email.removeAttribute("readonly");--%>
<%--        password.style.display = "block";--%>
<%--        submitField.style.display = "block";--%>

<%--        currPassword.style.display = "none";--%>
<%--        newPassword.style.display = "none";--%>
<%--        rePassword.style.display = "none";--%>
<%--        submitPassField.style.display = "none";--%>
<%--    }--%>

<%--    function changePassword() {--%>
<%--        avatar.setAttribute("readonly", "true");--%>
<%--        userName.setAttribute("readonly", "true");--%>
<%--        name.setAttribute("readonly", "true");--%>
<%--        email.setAttribute("readonly", "true");--%>
<%--        password.style.display = "none";--%>
<%--        submitField.style.display = "none";--%>

<%--        currPassword.style.display = "block";--%>
<%--        newPassword.style.display = "block";--%>
<%--        rePassword.style.display = "block";--%>
<%--        submitPassField.style.display = "block";--%>
<%--    }--%>

<%--    function saveInfo() {--%>
<%--        avatar.setAttribute("readonly", "true");--%>
<%--        userName.setAttribute("readonly", "true");--%>
<%--        name.setAttribute("readonly", "true");--%>
<%--        email.setAttribute("readonly", "true");--%>
<%--        password.style.display = "none";--%>

<%--        currPassword.style.display = "none";--%>
<%--        newPassword.style.display = "none";--%>
<%--        rePassword.style.display = "none";--%>
<%--        submitField.style.display = "none";--%>
<%--        submitPassField.style.display = "none";--%>
<%--    }--%>
<%--</script>--%>
</html>
<%--<jsp:include page="../bootstrap/footer.jsp">--%>
<%--    <jsp:param name="articleId" value=""/>--%>
<%--</jsp:include>--%>