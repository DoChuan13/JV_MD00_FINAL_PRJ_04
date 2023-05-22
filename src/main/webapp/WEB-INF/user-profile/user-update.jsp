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
<body onload="insertAvatar()">
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

            <div class="right-div-single-logo"><a href="#"> <i class="fas fa-ellipsis-h"></i></a></div>
        </div>
    </div>


    <div class="container content-profile-container">
        <div class="left-sidebar profile-left-sidebar">
            <div class="left-profile-sidebar-top">
                <div class="intro-bio">
                    <a href="/user?action=changeProfile">
                        <button style="    border: none;background-color: #1876f2;font-size: 17px;margin-top: 20px;border-radius: 10px;padding: 6px;    color: white; ">
                            Change Profile
                        </button>
                    </a>
                    <br/>
                    <a href="/user?action=changePassword">
                        <button style="    border: none;background-color: #1876f2;font-size: 17px;margin-top: 20px;border-radius: 10px;padding: 6px;    color: white; ">
                            Change Password
                        </button>
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

                    <div class="status-field-container write-post-container">
                        <jsp:include page="../upload/upload-avatar.jsp">
                            <jsp:param name="articleId" value=""/>
                        </jsp:include>
                        <div class="user-profile-box" style="display: block !important;">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>User Name</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="userName-field" type='text' name='userName'
                                           style="    width: 100%;height: 40px;border-radius: 10px;border: none;background-color: rgb(245, 242, 242);"
                                           value='     ${sessionScope['loginUser'].getUserName()}'/></div>
                            </div>
                        </div>
                        <div class="user-profile-box" style="display: block !important;">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>Name</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="name-field" type='text' name='name'
                                           style="    width: 100%;height: 40px;border-radius: 10px;border: none;background-color: rgb(245, 242, 242);"
                                           value='     ${sessionScope["loginUser"].getName()}'/>
                                </div>
                            </div>
                        </div>
                        <div class="user-profile-box" style="display: block !important;">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>Email</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="email-field" type='text' name='email'
                                           style="    width: 100%;height: 40px;border-radius: 10px;border: none;background-color: rgb(245, 242, 242);"
                                           value='     ${sessionScope["loginUser"].getEmail()}'/>
                                </div>
                            </div>
                        </div>
                        <div class="user-profile-box" style="display: block !important;">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>Password</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="password-field" type='password' name='password'
                                           style="    width: 100%;height: 40px;border-radius: 10px;border: none;background-color: rgb(245, 242, 242);"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button id="submit-field" type="submit"
                            style="  border: none;background-color: #1876f2;font-size: 17px;margin-top: 20px;border-radius: 10px;padding: 6px;     color: white;">
                        Update Info
                    </button>
                </form>
            </c:if>
            <c:if test='${requestScope["action"]=="changePassword"}'>
                <form method="post">
                    <input id="" type='text' name='action' hidden readonly
                           value="changePassword"/>
                    <div class="status-field-container write-post-container" id="curr-password-group">
                        <div class="user-profile-box" style="display: block !important;">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>Password</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="curr-password-field" type='password' name='password'
                                           style="    width: 100%;height: 40px;border-radius: 10px;border: none;background-color: rgb(245, 242, 242);"/>
                                </div>
                            </div>
                        </div>
                        <div class="user-profile-box " style="display: block !important;">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>New-Password</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="new-password-field" type='password' name='newPassword'
                                           style="    width: 100%;height: 40px;border-radius: 10px;border: none;background-color: rgb(245, 242, 242);"/>
                                </div>
                            </div>
                        </div>
                        <div class="user-profile-box" style="display: block !important;">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <h2>Re-Password</h2>
                                </div>
                            </div>
                            <div class="status-field">
                                <div>
                                    <input id="re-password-field" type='password' name='rePassword'
                                           style="    width: 100%;height: 40px;border-radius: 10px;border: none;background-color: rgb(245, 242, 242);"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button id="submit-pass-field" type="submit"
                            style="  border: none;background-color: #1876f2;font-size: 17px;margin-top: 20px;border-radius: 10px;padding: 6px;     color: white;">

                        Update
                        Password
                    </button>
                </form>
            </c:if>
        </div>
    </div>
</div>
</body>
<script>
    let avatar = '${sessionScope["loginUser"].getAvatar()}';
    console.log(avatar);

    function insertAvatar() {
        let divLocation = document.getElementById("imgDiv");
        let imgElement = document.createElement("img");
        divLocation.innerHTML = "";
        imgElement.src = avatar;
        imgElement.width = 100;
        imgElement.height = 100;
        divLocation.append(imgElement);
        document.getElementById("avatar").value = avatar;
    }
</script>
</html>
<%--<jsp:include page="../bootstrap/footer.jsp">--%>
<%--    <jsp:param name="articleId" value=""/>--%>
<%--</jsp:include>--%>
