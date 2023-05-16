<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
<html>
<head>
    <title>Navbar</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

    * {
        padding: 0px;
        margin: 0px;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;

    }

    :root {
        --body-color: #efefef;
        --nav-color: #1876f2;
        --bg-color: #fff;
    }

    .dark-theme {
        --body-color: #0a0a0a;
        --nav-color: #000;
        --bg-color: #000;
    }

    body {
        background: var(--body-color);
        transition: background 0.3s;
    }

    nav.navbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background: var(--nav-color);
        padding: 5px 5%;
        position: sticky;
        top: 0px;
        z-index: 100;
    }


    /* nav left */

    img.logo {
        width: 160px;
        margin-right: 45px;
    }

    .nav-left,
    .nav-right {
        display: flex;
        align-items: center;
    }

    .nav-left ul li {
        display: inline-block;
        list-style: none;
    }

    ul.navlogo li img {
        width: 24px;
        margin: 0px 13px;
    }

    .profile-image img {
        width: 40px;
        height: 40px;
        border-radius: 100%;
    }


    /* nav right */


    .search-box {
        display: flex;
        background: var(--body-color);
        border-radius: 20px;
        align-items: center;
        padding: 0px 15px;
    }

    .search-box img {
        width: 16px;
    }

    .search-box input {
        width: 240px;
        background: transparent;
        border: none;
        outline: none;
        padding: 8px;
    }

    .profile-image {
        margin: 7px 0px 0px 18px;
        cursor: pointer;
    }

    .online {
        position: relative;
    }

    .online::after {
        content: '';
        position: absolute;
        width: 7px;
        height: 7px;
        border: 2px solid var(--bg-color);
        top: 0px;
        right: 0px;
        border-radius: 100%;
        background: #41db51
    }

    .container {
        display: flex;
        justify-content: space-between;
        padding: 13px 5%;
    }

    /* content-area */

    .left-sidebar {
        flex-basis: 25%;
        position: sticky;
        top: 70px;
        align-self: flex-start;
    }

    .right-sidebar {
        flex-basis: 25%;
        position: sticky;
        top: 70px;
        align-self: flex-start;
        background: var(--bg-color);
        border-radius: 4px;
        padding: 20px;
        color: #626262;
    }

    .content-area {
        flex-basis: 47%;
        position: sticky;
        top: 70px;
        align-self: flex-start;
    }

    .important-links a,
    .shortcut-links a {
        display: flex;
        align-items: center;
        text-decoration: none;
        margin-bottom: 30px;
        color: #626262;
        width: fit-content;
    }

    .important-links a img {
        width: 25px;
        margin-right: 15px;
    }

    .important-links a:last-child {
        color: #1876f2;
    }

    .important-links {
        border-bottom: 1px solid #ccc;
    }

    .shortcut-links a img {
        width: 40px;
        margin-right: 15px;
        border-radius: 4px;
    }

    .shortcut-links p {
        margin: 25px 0px;
        color: #626262;
        font-weight: 500;
    }

    .heading-link {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 18px;
    }

    .right-sidebar {
        font-weight: 500;
        font-size: 16px;
    }

    .heading-link a {
        text-decoration: none;
        color: var(--nav-color);
        font-size: 13px;
    }

    .events {
        display: flex;
        font-size: 14px;
        margin-bottom: 20px;
    }

    .left-event {
        box-shadow: 0 0 10px rgb(126 126 126 / 42%);
        margin-right: 15px;
        height: 65px;
        width: 65px;
        text-align: center;
        padding-top: 10px;
        border-radius: 10px;
        position: relative;
        overflow: hidden;
    }

    .events p {
        font-size: 12px;
    }

    .events a {
        text-decoration: none;
        color: #1876f2;
        font-size: 12px;
    }

    .left-event span {
        position: absolute;
        bottom: 0px;
        left: 0px;
        width: 100%;

        background: #1876f2;
        color: var(--bg-color);
        font-size: 10px;
        padding: 4px 0pc;
    }

    img.advertisement-image {
        width: 100%;
        margin-bottom: 20px;
        border-radius: 4px;
    }

    .online-list {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .online-list .online img {
        width: 50px;
        border-radius: 50%;
    }

    .online-list .online {
        width: 46px;
        border-radius: 50%;
        margin-right: 15px;
    }

    .online-list .online::after {
        top: unset;
        bottom: 5px;
    }

    .story-gallery {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }

    .story {
        flex-basis: 18%;
        padding-top: 32%;
        position: relative;
        border-radius: 10px;

    }

    .story img {
        position: absolute;
        top: 10px;
        left: 10px;
        width: 45px;
        border-radius: 50%;
        border: 5px solid var(--nav-color);

    }

    .story p {
        position: absolute;
        bottom: 10px;
        text-align: center;
        width: 100%;
        color: #c9c9c9;
        font-size: 18px;
    }

    .story.story1 {
        background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBuTAmZ-I3O4EvlDRDK1fy76FK0B0J0b6Mgw&usqp=CAU) no-repeat center center /cover;
    }

    .story.story2 {
        background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBuTAmZ-I3O4EvlDRDK1fy76FK0B0J0b6Mgw&usqp=CAU) no-repeat center center /cover;
    }

    .story.story3 {
        background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBuTAmZ-I3O4EvlDRDK1fy76FK0B0J0b6Mgw&usqp=CAU) no-repeat center center /cover;
    }

    .story.story4 {
        background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBuTAmZ-I3O4EvlDRDK1fy76FK0B0J0b6Mgw&usqp=CAU) no-repeat center center /cover;
    }

    .story.story5 {
        background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBuTAmZ-I3O4EvlDRDK1fy76FK0B0J0b6Mgw&usqp=CAU) no-repeat center center /cover;
    }

    .story.story1 img {
        top: unset;
        left: 50%;
        bottom: 40px;
        transform: translateX(-50%);
        border: 0;
        width: 35px;
    }

    .write-post-container {
        color: #626262;
        background-color: var(--bg-color);
        width: 100%;
        padding: 20px;
        border-radius: 6px;
    }

    .user-profile {
        display: flex;
        align-items: center;
    }

    .user-profile img {
        width: 45px;
        height: 45px;
        border-radius: 50%;
        margin-right: 10px;

    }

    .user-profile p {
        margin-bottom: -5px;
    }

    .user-profile small {
        font-size: 12px;
    }

    .post-upload-textarea {
        padding: 20px 0px 0px 55px;
    }

    .post-upload-textarea textarea {
        width: 100%;
        border: 0px;
        outline: none;
        border-bottom: 1px solid #ccc;
        background: transparent;
        resize: none;
    }

    .add-post-links {
        display: flex;
        justify-content: space-around;
        margin-top: 10px;
    }

    .add-post-links a {
        text-decoration: none;
        display: flex;
        align-items: center;
        color: #626262;
        font-size: 13px;
    }

    .add-post-links a img {
        width: 20px;
        margin-right: 13px;
    }

    .status-field-container {
        margin-top: 20px;
    }

    .status-field img {
        width: 100%;
        margin-top: 15px;
        border-radius: 6px;
    }

    .status-field p {
        font-size: 14px;
        margin: 20px 0px 5px 0px;
        text-transform: capitalize;
        color: #626262;
    }

    .status-field p a {
        color: var(--nav-color);
    }

    .activity-icons div {
        display: inline-flex;
        align-items: center;
        margin-right: 30px;
    }

    .activity-icons div img {
        width: 18px;
        margin-right: 10px;
    }

    .post-reaction {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin: 0px 10px;
    }

    .post-profile-picture img {
        width: 20px;
        border-radius: 50%;
        margin-right: 4px;

    }

    .post-profile-picture {
        display: flex;
        align-items: center;
    }

    .user-profile-box {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    button.btn-LoadMore {
        margin: 20px auto;
        display: flex;
        cursor: pointer;
        padding: 5px 10px;
        border: 1px solid #9a9a9a;
        color: #626262;
        background: transparent;
        border-radius: 4px;
    }

    footer#footer {
        text-align: center;
        background: var(--nav-color);
        color: var(--bg-color);
        padding: 15px 0px;
        font-size: 13px;
    }

    .user-settings {
        position: absolute;
        right: 5%;
        background: var(--bg-color);
        top: 110%;
        max-width: 350px;
        width: 90%;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
        border-radius: 4px;
        overflow: hidden;
        max-height: 0px;
        transition: max-height 0.3s;
    }

    .user-setting-showup-toggle {
        max-height: 439px;
    }

    .user-settings .user-profile {
        padding: 20px;
    }

    .user-profile div p {
        color: #6a6a6a;
        font-weight: 600;
    }

    .user-settings .user-profile a {
        font-size: 13px;
        text-decoration: none;
        color: #626262;
    }


    .user-settings hr {
        width: 90%;
        margin: auto;
        background: #dbdbdb;
        border: 0px;
        height: 1px;
    }

    .settings-links {
        display: flex;
        align-items: center;
        margin: 15px 20px 25px 20px;
    }

    .settings-links img {
        width: 38px;
        margin-right: 10px;
    }

    .settings-links a img {
        width: 7px;
    }

    .settings-links a {
        color: #626262;
        flex: 1;
        text-decoration: none;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .profile-darkButton {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    div#dark-button {
        background: #ccc;
        margin-right: 20px;
        padding: 2px 3px;
        border-radius: 15px;
        width: 45px;
        cursor: pointer;
    }

    div#dark-button span {
        background: var(--bg-color);
        border-radius: 50%;
        width: 18px;
        height: 18px;
        display: block;
    }

    div#dark-button.dark-mode-on {
        background: #464545;
        padding: 2px 22px;
    }

    .btn-LoadMore.loadMoreToggle {
        background: red;
        color: white;
    }

    /* --------------profile-page-------------- */

    img.coverImage {
        overflow: hidden;
        width: 100%;
        border-radius: 6px;
        margin-bottom: 20px;
    }

    .profile-container {
        padding: 20px 15%;
        color: #626262;
    }

    .left-dashboard {
        display: flex;
        align-items: center;
    }

    .left-dashboard .dashboard-img {
        width: 100px;
        margin-right: 15px;
        border-radius: 10px;
    }

    .dashboard {
        padding: 15px;
        background: var(--bg-color);
        justify-content: space-between;
        display: flex;
        border-radius: 5px;
    }

    .mutual-friend-images img {
        width: 25px;
        border-radius: 50%;
    }

    .left-dashboard-info h3 {
        font-size: 25px;
    }

    .left-dashboard-info p {
        font-size: 13px;
        margin-bottom: 12px;
    }

    .right-dashboard-info-top {
        display: flex;
        align-items: center;
    }

    .right-dashboard-info-top button,
    .right-div-single-logo {
        padding: 5px;
        border-radius: 5px;
        margin-left: 8px;
        font-size: 15px;
        border: none;
        cursor: pointer;
    }

    .right-dashboard-info-top button:nth-child(2) {
        background: #1876f2;
        color: white;
    }

    .right-div-single-logo {
        align-self: end;
        font-size: 18px;
        margin-top: 16px;
        padding: 2px 16px;
        background: #EFEFEF;
    }

    .right-dashboard-info {
        display: flex;
        flex-direction: column;
    }

    .container.content-profile-container {
        padding: 25px 0px;
    }

    .left-sidebar.profile-left-sidebar {
        flex-basis: 32%;
    }

    .content-area.profile-content-area {
        flex-basis: 65%;
    }

    .left-profile-sidebar-top {
        background: var(--bg-color);
        padding: 15px 15px 30px 15px;
        border-radius: 5px;
    }

    .intro-bio h4 {
        font-weight: 600;
        font-size: 18px;
    }

    .intro-bio p {
        font-size: 16px;
        text-align: center;
        margin: 5px;
    }

    .intro-bio i {
        color: rgb(255, 196, 0);
    }

    .intro-bio hr {
        border: 0px;
        margin: 20px auto;
        height: 1px;
        background: #ccc;
    }

    .background-details a {
        display: flex;
        color: #636362;
        text-decoration: none;
        font-size: 15px;
        align-items: center;
        margin-top: 20px;
    }

    .background-details a i {
        margin-right: 10px;
    }

    .left-profile-sidebar-top.gallery {
        margin-top: 18px
    }

    .gallery-photos-rowFirst {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        grid-gap: 10px;
    }

    .gallery-photos-rowFirst img {
        width: 100%;
        border-radius: 10px;
    }

    .gallery-photos-rowFirst div p {
        font-size: 14px;
    }</style>
<body>
<nav class="navbar">
    <div class="nav-left"><a href="/"><img class="logo" src="../../images/logo.png" alt=""></a>
        <ul class="navlogo">
            <li><img src="../../images/notification.png" ></li>
            <li><img src="../../images/inbox.png"></li>
            <li><img src="../../images/video.png"></li>
        </ul>
    </div>
    <div class="nav-right">
        <div class="search-box">
            <img src="../../images/search.png" alt="">
            <input type="text" placeholder="Search">
        </div>
        <div class="profile-image online flex">
            <a href="/user"><img src="${sessionScope["loginUser"].getAvatar()}" alt=""></a>
            <a href="/user?action=logout" class="btn btn-secondary"><i style="font-size:40px" class="fa">&#xf08b;</i>
                <span></span></a>
<%--            <li class="nav-item dropdown">--%>
<%--                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                    <img src="${sessionScope["loginUser"].getAvatar()}" alt="">--%>
<%--                </a>--%>
<%--                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--                    <li><a class="dropdown-item" href="/user">My Profile</a></li>--%>
<%--                    <li><a class="dropdown-item" href="/user?action=logout">Log out</a></li>--%>
<%--                </ul>--%>
<%--            </li>--%>

        </div>
    </div>
    <div class="user-settings">
        <div class="profile-darkButton">
            <div class="user-profile">
                <img src="../../images/profile-pic.png" alt="">
                <div>
                    <p> Alex Carry</p>
                    <a href="#">See your profile</a>
                </div>
            </div>
            <div id="dark-button" onclick="darkModeON()">
                <span></span>
            </div>
        </div>
        <hr>
        <div class="user-profile">
            <img src="../../images/feedback.png" alt="">
            <div>
                <p> Give Feedback</p>
                <a href="#">Help us to improve</a>
            </div>
        </div>
        <hr>
        <div class="settings-links">
            <img src="../../images/setting.png" alt="" class="settings-icon">
            <a href="#">Settings & Privary <img src="../../images/arrow.png" alt=""></a>
        </div>

        <div class="settings-links">
            <img src="../../images/help.png" alt="" class="settings-icon">
            <a href="#">Help & Support <img src="../../images/arrow.png" alt=""></a>
        </div>

        <div class="settings-links">
            <img src="../../images/Display.png" alt="" class="settings-icon">
            <a href="#">Display & Accessibility <img src="../../images/arrow.png" alt=""></a>
        </div>

        <div class="settings-links">
            <img src="../../images/logout.png" alt="" class="settings-icon">
            <a href="#">Logout <img src="../../images/arrow.png" alt=""></a>
        </div>

    </div>
</nav>
</body>
</html>
