<%--
  Created by IntelliJ IDEA.
  User: chuan
  Date: 15/05/2023
  Time: 09:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
            background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(images/status-1.png) no-repeat center center /cover;
        }

        .story.story2 {
            background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(images/status-2.png) no-repeat center center /cover;
        }

        .story.story3 {
            background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(images/status-3.png) no-repeat center center /cover;
        }

        .story.story4 {
            background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(images/status-4.png) no-repeat center center /cover;
        }

        .story.story5 {
            background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(images/status-5.png) no-repeat center center /cover;
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

    </style>
</head>
<body>
<nav class="navbar">
    <div class="nav-left"><img class="logo" src="images/logo.png" alt="">
        <ul class="navlogo">
            <li><img src="images/notification.png"></li>
            <li><img src="images/inbox.png"></li>
            <li><img src="images/video.png"></li>
        </ul>
    </div>
    <div class="nav-right">
        <div class="search-box">
            <img src="images/search.png" alt="">
            <input type="text" placeholder="Search">
        </div>
        <div class="profile-image online" onclick="UserSettingToggle()">
            <img src="images/profile-pic.png" alt="">
        </div>

    </div>
    <div class="user-settings">
        <div class="profile-darkButton">
            <div class="user-profile">
                <img src="images/profile-pic.png" alt="">
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
            <img src="images/feedback.png" alt="">
            <div>
                <p> Give Feedback</p>
                <a href="#">Help us to improve</a>
            </div>
        </div>
        <hr>
        <div class="settings-links">
            <img src="images/setting.png" alt="" class="settings-icon">
            <a href="#">Settings & Privary <img src="images/arrow.png" alt=""></a>
        </div>

        <div class="settings-links">
            <img src="images/help.png" alt="" class="settings-icon">
            <a href="#">Help & Support <img src="images/arrow.png" alt=""></a>
        </div>

        <div class="settings-links">
            <img src="images/Display.png" alt="" class="settings-icon">
            <a href="#">Display & Accessibility <img src="images/arrow.png" alt=""></a>
        </div>

        <div class="settings-links">
            <img src="images/logout.png" alt="" class="settings-icon">
            <a href="#">Logout <img src="images/arrow.png" alt=""></a>
        </div>

    </div>
</nav>

<!-- content-area------------ -->

<div class="container">
    <div class="left-sidebar">
        <div class="important-links">
            <a href="#"><img src="images/news.png" alt="">Latest News</a>
            <a href="#"><img src="images/friends.png" alt="">Friends</a>
            <a href="#"><img src="images/group.png" alt="">Groups</a>
            <a href="#"><img src="images/marketplace.png" alt="">marketplace</a>
            <a href="#"><img src="images/watch.png" alt="">Watch</a>
            <a href="#">See More</a>
        </div>

        <div class="shortcut-links">
            <p>Your Shortcuts</p>
            <a href="#"> <img src="images/shortcut-1.png" alt="">Web Developers</a>
            <a href="#"> <img src="images/shortcut-2.png" alt="">Web Design Course</a>
            <a href="#"> <img src="images/shortcut-3.png" alt="">Full Stack Development</a>
            <a href="#"> <img src="images/shortcut-4.png" alt="">Website Experts</a>
        </div>
    </div>

    <!-- main-content------- -->

    <div class="content-area">
        <div class="story-gallery">
            <div class="story story1">
                <img src="images/upload.png" alt="">
                <p>Post Story</p>
            </div>
            <div class="story story2">
                <img src="images/member-1.png" alt="">
                <p>Alison</p>
            </div>
            <div class="story story3">
                <img src="images/member-2.png" alt="">
                <p>Jackson</p>
            </div>
            <div class="story story4">
                <img src="images/member-3.png" alt="">
                <p>Samona</p>
            </div>
            <div class="story story5">
                <img src="images/member-4.png" alt="">
                <p>John</p>
            </div>
        </div>

        <div class="write-post-container">
            <div class="user-profile">
                <img src="images/profile-pic.png" alt="">
                <div>
                    <p> Alex Carry</p>
                    <small>Public <i class="fas fa-caret-down"></i></small>
                </div>
            </div>

            <div class="post-upload-textarea">
                <textarea name="" placeholder="What's on your mind, Alex?" id="" cols="30" rows="3"></textarea>
                <div class="add-post-links">
                    <a href="#"><img src="images/live-video.png" alt="">Live Video</a>
                    <a href="#"><img src="images/photo.png" alt="">Photo/Video</a>
                    <a href="#"><img src="images/feeling.png" alt="">Feeling Activity</a>
                </div>
            </div>
        </div>

        <div class="status-field-container write-post-container">
            <div class="user-profile-box">
                <div class="user-profile">
                    <img src="images/profile-pic.png" alt="">
                    <div>
                        <p> Alex Carry</p>
                        <small>August 13 1999, 09.18 pm</small>
                    </div>
                </div>
                <div>
                    <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                </div>
            </div>
            <div class="status-field">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta
                    laborum nihil accusantium odit laboriosam, sed sit autem! <a
                            href="#">#This_Post_is_Better!!!!</a> </p>
                <img src="images/feed-image-1.png" alt="">

            </div>
            <div class="post-reaction">
                <div class="activity-icons">
                    <div><img src="images/like-blue.png" alt="">120</div>
                    <div><img src="images/comments.png" alt="">52</div>
                    <div><img src="images/share.png" alt="">35</div>
                </div>
                <div class="post-profile-picture">
                    <img src="images/profile-pic.png " alt=""> <i class=" fas fa-caret-down"></i>
                </div>
            </div>
        </div>
        <div class="status-field-container write-post-container">
            <div class="user-profile-box">
                <div class="user-profile">
                    <img src="images/profile-pic.png" alt="">
                    <div>
                        <p> Alex Carry</p>
                        <small>August 13 1999, 09.18 pm</small>
                    </div>
                </div>
                <div>
                    <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                </div>
            </div>
            <div class="status-field">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta
                    laborum nihil accusantium odit laboriosam, sed sit autem! <a
                            href="#">#This_Post_is_Bigger!!!!</a> </p>
                <img src="images/feed-image-2.png" alt="">

            </div>
            <div class="post-reaction">
                <div class="activity-icons">
                    <div><img src="images/like-blue.png" alt="">120</div>
                    <div><img src="images/comments.png" alt="">52</div>
                    <div><img src="images/share.png" alt="">35</div>
                </div>
                <div class="post-profile-picture">
                    <img src="images/profile-pic.png " alt=""> <i class=" fas fa-caret-down"></i>
                </div>
            </div>
        </div>
        <div class="status-field-container write-post-container">
            <div class="user-profile-box">
                <div class="user-profile">
                    <img src="images/profile-pic.png" alt="">
                    <div>
                        <p> Alex Carry</p>
                        <small>August 13 1999, 09.18 pm</small>
                    </div>
                </div>
                <div>
                    <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                </div>
            </div>
            <div class="status-field">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta
                    laborum nihil accusantium odit laboriosam, sed sit autem! <a
                            href="#">#This_Post_is_faster!!!!</a> </p>
                <img src="images/feed-image-3.png" alt="">

            </div>
            <div class="post-reaction">
                <div class="activity-icons">
                    <div><img src="images/like-blue.png" alt="">120</div>
                    <div><img src="images/comments.png" alt="">52</div>
                    <div><img src="images/share.png" alt="">35</div>
                </div>
                <div class="post-profile-picture">
                    <img src="images/profile-pic.png " alt=""> <i class=" fas fa-caret-down"></i>
                </div>
            </div>
        </div>
        <div class="status-field-container write-post-container">
            <div class="user-profile-box">
                <div class="user-profile">
                    <img src="images/profile-pic.png" alt="">
                    <div>
                        <p> Alex Carry</p>
                        <small>August 13 1999, 09.18 pm</small>
                    </div>
                </div>
                <div>
                    <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                </div>
            </div>
            <div class="status-field">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta
                    laborum nihil accusantium odit laboriosam, sed sit autem! <a
                            href="#">#This_Post_is_perfect!!!!</a> </p>
                <img src="images/feed-image-4.png" alt="">

            </div>
            <div class="post-reaction">
                <div class="activity-icons">
                    <div><img src="images/like-blue.png" alt="">120</div>
                    <div><img src="images/comments.png" alt="">52</div>
                    <div><img src="images/share.png" alt="">35</div>
                </div>
                <div class="post-profile-picture">
                    <img src="images/profile-pic.png " alt=""> <i class=" fas fa-caret-down"></i>
                </div>
            </div>
        </div>
        <button type="button" class="btn-LoadMore" onclick="LoadMoreToggle()">Load More</button>
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
                <p> <i class="fas fa-map-marker-alt"></i> wisdom em Park</p>
                <a href="#">More Info</a>
            </div>
        </div>
        <div class="events">
            <div class="left-event">
                <h4>18</h4>
                <span>January</span>
            </div>
            <div class="right-event">
                <h4>Mobile Marketing</h4>
                <p><i class="fas fa-map-marker-alt"></i> wisdom em Park</p>
                <a href="#">More Info</a>
            </div>
        </div>

        <div class="heading-link">
            <h4>Advertisement</h4>
            <a href="">Close</a>
        </div>
        <div class="advertisement">
            <img src="images/advertisement.png" class="advertisement-image" alt="">
        </div>

        <div class="heading-link">
            <h4>Conversation</h4>
            <a href="">Hide Chat</a>
        </div>

        <div class="online-list">
            <div class="online">
                <img src="images/member-1.png" alt="">
            </div>
            <p>Alison Mina</p>
        </div>

        <div class="online-list">
            <div class="online">
                <img src="images/member-2.png" alt="">
            </div>
            <p>Jackson Aston</p>
        </div>
        <div class="online-list">
            <div class="online">
                <img src="images/member-3.png" alt="">
            </div>
            <p>Samona Rose</p>
        </div>
    </div>
</div>
<footer id="footer">
    <p>&copy; Copyright 2021 - Socialbook All Rights Reserved</p>
</footer>
</body>
</html>
