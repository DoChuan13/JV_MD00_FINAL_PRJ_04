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
        margin: 50px ;
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
    }
    body{
        margin:20px;
        font-family: Helvetica, Arial, sans-serif;
    }
    .pull-right{
        float:right;
    }
    .pull-left{
        float:left;
    }
    #fbcomment{
        background:#fff;
        border: 1px solid #dddfe2;
        border-radius: 3px;
        color: #4b4f56;
        padding:50px;
    }
    .header_comment{
        font-size: 14px;
        overflow: hidden;
        border-bottom: 1px solid #e9ebee;
        line-height: 25px;
        margin-bottom: 24px;
        padding: 10px 0;
    }
    .sort_title{
        color: #4b4f56;
    }
    .sort_by{
        background-color: #f5f6f7;
        color: #4b4f56;
        line-height: 22px;
        cursor: pointer;
        vertical-align: top;
        font-size: 12px;
        font-weight: bold;
        vertical-align: middle;
        padding: 4px;
        justify-content: center;
        border-radius: 2px;
        border: 1px solid #ccd0d5;
    }
    .count_comment{
        font-weight: 600;
    }
    .body_comment{
        padding: 0 8px;
        font-size: 14px;
        display: block;
        line-height: 25px;
        word-break: break-word;
    }
    .avatar_comment{
        display: block;
    }
    .avatar_comment img{
        height: 48px;
        width: 48px;
        border-radius:20Px;
    }
    .box_comment{
        display: block;
        position: relative;
        line-height: 1.358;
        word-break: break-word;
        border: 1px solid #d3d6db;
        word-wrap: break-word;
        background: #fff;
        box-sizing: border-box;
        cursor: text;
        font-family: Helvetica, Arial, sans-serif;
        font-size: 16px;
        padding: 0;
    }
    .box_comment textarea{
        min-height: 40px;
        padding: 12px 8px;
        width: 100%;
        border: none;
        resize: none;
    }
    .box_comment textarea:focus{
        outline: none !important;
    }
    .box_comment .box_post{
        border-top: 1px solid #d3d6db;
        background: #f5f6f7;
        padding: 8px;
        display: block;
        overflow: hidden;
    }
    .box_comment label{
        display: inline-block;
        vertical-align: middle;
        font-size: 11px;
        color: #90949c;
        line-height: 22px;
    }
    .box_comment button{
        margin-left:8px;
        background-color: #4267b2;
        border: 1px solid #4267b2;
        color: #fff;
        text-decoration: none;
        line-height: 22px;
        border-radius: 2px;
        font-size: 14px;
        font-weight: bold;
        position: relative;
        text-align: center;
    }
    .box_comment button:hover{
        background-color: #29487d;
        border-color: #29487d;
    }
    .box_comment .cancel{
        margin-left:8px;
        background-color: #f5f6f7;
        color: #4b4f56;
        text-decoration: none;
        line-height: 22px;
        border-radius: 2px;
        font-size: 14px;
        font-weight: bold;
        position: relative;
        text-align: center;
        border-color: #ccd0d5;
    }
    .box_comment .cancel:hover{
        background-color: #d0d0d0;
        border-color: #ccd0d5;
    }
    .box_comment img{
        height:16px;
        width:16px;
    }
    .box_result{
        margin-top: 24px;
    }
    .box_result .result_comment h4{
        font-weight: 600;
        white-space: nowrap;
        color: #365899;
        cursor: pointer;
        text-decoration: none;
        font-size: 14px;
        line-height: 1.358;
        margin:0;
    }
    .box_result .result_comment{
        display:block;
        overflow:hidden;
        padding: 0;
    }
    .child_replay{
        border-left: 1px dotted #d3d6db;
        margin-top: 12px;
        list-style: none;
        padding:0 0 0 8px
    }
    .reply_comment{
        margin:12px 0;
    }
    .box_result .result_comment p{
        margin: 4px 0;
        text-align:justify;
    }
    .box_result .result_comment .tools_comment{
        font-size: 12px;
        line-height: 1.358;
    }
    .box_result .result_comment .tools_comment a{
        color: #4267b2;
        cursor: pointer;
        text-decoration: none;
    }
    .box_result .result_comment .tools_comment span{
        color: #90949c;
    }
    .body_comment .show_more, .body_comment .show_less{
        background: #3578e5;
        border: none;
        box-sizing: border-box;
        color: #fff;
        font-size: 14px;
        margin-top: 24px;
        padding: 12px;
        text-shadow: none;
        width: 100%;
        font-weight:bold;
        position: relative;
        text-align: center;
        vertical-align: middle;
        border-radius: 2px;
    }
</style>
<body>
<nav class="navbar">
    <div class="nav-left"><a href="/"><img class="logo" src="../../images/logo.png" alt=""></a>
        <ul class="navlogo">
            <li><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16" color="white">
                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
            </svg></li>
            <li><a href="/chat"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16" color="white">
                <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
            </svg></a></li>
            <li><a href="/friend"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16" color="white">
                <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8Zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022ZM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816ZM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275ZM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0Zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4Z"/>
            </svg></a></li>
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
