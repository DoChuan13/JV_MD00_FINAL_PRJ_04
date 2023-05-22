<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 5/16/2023
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../bootstrap/nav-bar.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
<html>
<head>
    <title>Title</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <style>
        body {
            background-color: #f4f7f6;
            margin-top: 20px;
        }

        .card {
            background: #fff;
            transition: .5s;
            border: 0;
            margin-bottom: 30px;
            border-radius: .55rem;
            position: relative;
            width: 100%;
            box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
        }

        .chat-app .people-list {
            width: 280px;
            position: absolute;
            left: 0;
            top: 0;
            padding: 20px;
            z-index: 7
        }

        .chat-app .chat {
            margin-left: 280px;
            border-left: 1px solid #eaeaea
        }

        .people-list {
            -moz-transition: .5s;
            -o-transition: .5s;
            -webkit-transition: .5s;
            transition: .5s
        }

        .people-list .chat-list li {
            padding: 10px 15px;
            list-style: none;
            border-radius: 3px
        }

        .people-list .chat-list li:hover {
            background: #efefef;
            cursor: pointer
        }

        .people-list .chat-list li.active {
            background: #efefef
        }

        .people-list .chat-list li .name {
            font-size: 15px
        }

        .people-list .chat-list img {
            width: 45px;
            border-radius: 50%
        }

        .people-list img {
            float: left;
            border-radius: 50%
        }

        .people-list .about {
            float: left;
            padding-left: 8px
        }

        .people-list .status {
            color: #999;
            font-size: 13px
        }

        .chat .chat-header {
            padding: 15px 20px;
            border-bottom: 2px solid #f4f7f6
        }

        .chat .chat-header img {
            float: left;
            border-radius: 40px;
            width: 40px
        }

        .chat .chat-header .chat-about {
            float: left;
            padding-left: 10px
        }

        .chat .chat-history {
            padding: 20px;
            border-bottom: 2px solid #fff
        }

        .chat .chat-history ul {
            padding: 0
        }

        .chat .chat-history ul li {
            list-style: none;
            margin-bottom: 30px
        }

        .chat .chat-history ul li:last-child {
            margin-bottom: 0;
        }

        .chat .chat-history .message-data {
            margin-bottom: 15px
        }

        .chat .chat-history .message-data img {
            border-radius: 40px;
            width: 40px
        }

        .chat .chat-history .message-data-time {
            color: #434651;
            padding-left: 6px
        }

        .chat .chat-history .message {
            color: #444;
            padding: 18px 20px;
            line-height: 26px;
            font-size: 16px;
            border-radius: 7px;
            display: inline-block;
            position: relative
        }

        .chat .chat-history .message:after {
            bottom: 100%;
            left: 7%;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
            border-bottom-color: #fff;
            border-width: 10px;
            margin-left: -10px
        }

        .chat .chat-history .my-message {
            background: #efefef
        }

        .chat .chat-history .my-message:after {
            bottom: 100%;
            left: 30px;
            border: solid transparent;
            content: " ";
            height: 0;
            width: 0;
            position: absolute;
            pointer-events: none;
            border-bottom-color: #efefef;
            border-width: 10px;
            margin-left: -10px
        }

        .chat .chat-history .other-message {
            background: #e8f1f3;
            text-align: right
        }

        .chat .chat-history .other-message:after {
            border-bottom-color: #e8f1f3;
            left: 93%
        }

        .chat .chat-message {
            padding: 20px
        }

        .online,
        .offline,
        .me {
            margin-right: 2px;
            font-size: 8px;
            vertical-align: middle
        }

        .online {
            color: #86c541
        }

        .offline {
            color: #e47297
        }

        .me {
            color: #1d8ecd
        }

        .float-right {
            float: right
        }

        .clearfix:after {
            visibility: hidden;
            display: block;
            font-size: 0;
            content: " ";
            clear: both;
            height: 0
        }

        @media only screen and (max-width: 767px) {
            .chat-app .people-list {
                height: 465px;
                width: 100%;
                overflow-x: auto;
                background: #fff;
                left: -400px;
                display: none
            }

            .chat-app .people-list.open {
                left: 0
            }

            .chat-app .chat {
                margin: 0
            }

            .chat-app .chat .chat-header {
                border-radius: 0.55rem 0.55rem 0 0
            }

            .chat-app .chat-history {
                height: 300px;
                overflow-x: auto
            }
        }

        @media only screen and (min-width: 768px) and (max-width: 992px) {
            .chat-app .chat-list {
                height: 650px;
                overflow-x: auto
            }

            .chat-app .chat-history {
                height: 600px;
                overflow-x: auto
            }
        }

        @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: landscape) and (-webkit-min-device-pixel-ratio: 1) {
            .chat-app .chat-list {
                height: 480px;
                overflow-x: auto
            }

            .chat-app .chat-history {
                height: calc(100vh - 350px);
                overflow-x: auto
            }
        }</style>
</head>
<body>
<div class="container"
     style="margin: 0 auto;justify-content: center;width: 100%;
     padding: 20px;padding-left: 0;padding-right: 0;">
    <div class="row clearfix">
        <div class="col-lg-12">
            <div class="card chat-app">
                <%--Chat List Start--%>
                <div id="plist" class="people-list">
                    <form method="get" style="position:relative;">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa fa-search"></i></span>
                            <input name="action" value="findChat" hidden style="position: absolute;"/>
                            <input name="name" type="text" class="form-control" placeholder="Find chat..."
                                   style="width: 80%">
                        </div>
                        <div class="input-group">
                            <button type="submit" hidden>Search</button>
                        </div>
                        <a href="/chat?action=newChat" style="position: absolute; right: 8px;top: 5px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-cloud-plus" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                      d="M8 5.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 .5-.5z"/>
                                <path d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383zm.653.757c-.757.653-1.153 1.44-1.153 2.056v.448l-.445.049C2.064 6.805 1 7.952 1 9.318 1 10.785 2.23 12 3.781 12h8.906C13.98 12 15 10.988 15 9.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 4.825 10.328 3 8 3a4.53 4.53 0 0 0-2.941 1.1z"/>
                            </svg>
                        </a>
                    </form>
                    <ul class="list-unstyled chat-list mt-2 mb-0">
                        <c:if test='${requestScope["chatList"].size()==0}'>
                            <li class="clearfix">
                                <div class="message-data text-right">
                                    <span>Nothing Chat History</span>
                                </div>
                            </li>
                        </c:if>
                        <c:if test='${requestScope["chatList"].size()!=0}'>
                            <c:forEach items='${requestScope["chatList"]}' var="chat">
                                <li
                                        style="display: flex; align-items: center; justify-content: space-between;"
                                        class="clearfix active">
                                    <c:if test='${chat.getStartUser().getUserId()==sessionScope["loginUser"].getUserId()}'>
                                        <img style="height: 40px; width: 40px;"
                                             src="${chat.getTargetUser().getAvatar()}" alt="avatar">
                                        <div class="about">
                                            <div class="name">
                                                <a
                                                        style="text-decoration:none;"
                                                        href="/chat?action=chatSession&chatId=${chat.getChatId()}">
                                                        ${chat.getTargetUser().getName()}
                                                </a>
                                            </div>
                                        </div>
                                        <div style="float: right"><a
                                                style="text-decoration:none;"
                                                href="/chat?action=deleteChat&chatId=${chat.getChatId()}">Delete</a>
                                        </div>
                                    </c:if>
                                    <c:if test='${chat.getTargetUser().getUserId()==sessionScope["loginUser"].getUserId()}'>
                                        <img style="height: 40px; width: 40px;"
                                             src="${chat.getStartUser().getAvatar()}"
                                             alt="avatar">
                                        <div class="about">
                                            <div class="name">
                                                <a
                                                        style="text-decoration:none;"
                                                        href="/chat?action=chatSession&chatId=${chat.getChatId()}">
                                                        ${chat.getStartUser().getName()}
                                                </a>
                                            </div>
                                        </div>
                                        <div style="float: right"><a
                                                style="text-decoration:none;"
                                                href="/chat?action=deleteChat&chatId=${chat.getChatId()}">Delete</a>
                                        </div>
                                    </c:if>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
                <%--Chat List End--%>

                <div class="chat">
                    <%--<c:if test='${requestScope["newChat"]==null&&requestScope["resultFind"]==null}'>--%>
                    <c:if test='${requestScope["chatSession"]!=null}'>
                        <div class="chat-header clearfix">
                            <div class="row">
                                <div
                                        style="display:flex; align-items: center"
                                        class="col-lg-6">
                                    <c:if test='${chatSession.getStartUser().getUserId()==sessionScope["loginUser"].getUserId()}'>
                                        <a href="#" data-toggle="modal" data-target="#view_info">
                                            <img
                                                    style="height: 40px; width: 40px;"
                                                    src="${chatSession.getTargetUser().getAvatar()}" alt="avatar">
                                        </a>
                                        <a
                                                style="text-decoration:none;"
                                                href="/chat?action=chatSession&chatId=${chatSession.getChatId()}">
                                                ${chatSession.getTargetUser().getName()}
                                        </a>
                                    </c:if>
                                    <c:if test='${chatSession.getTargetUser().getUserId()==sessionScope["loginUser"].getUserId()}'>
                                        <a href="#" data-toggle="modal" data-target="#view_info">
                                            <img
                                                    style="height: 40px; width: 40px;"
                                                    src="${chatSession.getStartUser().getAvatar()}" alt="avatar">
                                        </a>
                                        <a
                                                style="text-decoration:none;"
                                                href="/chat?action=chatSession&chatId=${chatSession.getChatId()}">
                                                ${chatSession.getStartUser().getName()}
                                        </a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <form method="get">
                        <c:if test='${requestScope["newChat"]!=null||requestScope["resultFind"]!=null}'>
                            <div class="chat-header clearfix">
                                <c:if test='${requestScope["name"]==null}'>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <input type="text" name="action" value="findName" hidden>
                                            <input type="text" name="name" placeholder="Find Name to start..."
                                                   style="width: 100%; padding: 5px;background: lightgoldenrodyellow">
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test='${requestScope["resultFind"]!=null}'>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <input type="text" name="action" value="findName" hidden>
                                            <input type="text" name="name" placeholder="Find Name to start..."
                                                   value="${requestScope["name"]}"
                                                   style="width: 100%; padding: 5px;background: lightgoldenrodyellow">
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <button type="submit" style="display: none">Search</button>
                        </c:if>
                    </form>

                    <div class="chat-history" style="width: 800px;min-height: 500px">
                        <c:if test="${requestScope['findName']!=null}">
                            <c:if test="${requestScope['findName'].size()==0}">
                                <div class="message-data text-right">
                                    <span>Not Found Result</span>
                                </div>
                            </c:if>
                            <c:if test="${requestScope['findName'].size()!=0}">
                                <c:forEach items="${requestScope['findName']}" var="name">
                                    <div class="message-data text-right"
                                         style="display: flex;text-align: center;gap: 30px;align-items: center">
                                        <img src="${name.getAvatar()}" alt="avatar"/>
                                        <p style="width: 120px;">${name.getName()}</p>
                                        <a
                                                style="text-decoration:none;"
                                                href="/chat?action=startChat&userId=${name.getUserId()}">Start Chat</a>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:if>
                        <c:if test='${requestScope["chatSession"]!=null}'>
                            <%--<div class="message-data text-right">--%>
                            <%--<span>Nothing Chat History</span>--%>
                            <%--</div>--%>
                            <ul class="m-b-0">
                                <li class="clearfix">
                                </li>
                                <c:forEach items="${requestScope['chatSession'].getChatContent()}"
                                           var="chatDetail">
                                    <c:if test='${chatDetail.getUser().getUserId()==sessionScope["loginUser"].getUserId()}'>
                                        <li class="clearfix">
                                            <div class="message-data text-right">
                                                <span style="display: block;text-align: right"
                                                      class="message-data-time">${chatDetail.getSentTime()}</span>
                                            </div>
                                            <div class="message other-message float-right"> ${chatDetail.getContent()}
                                            </div>
                                        </li>
                                    </c:if>
                                    <c:if test='${chatDetail.getUser().getUserId()!=sessionScope["loginUser"].getUserId()}'>
                                        <li class="clearfix">
                                            <div class="message-data">
                                                <span class="message-data-time">${chatDetail.getSentTime()}</span>
                                            </div>
                                            <div class="message my-message">${chatDetail.getContent()}</div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </c:if>
                    </div>
                    <c:if test="${requestScope['chatSession']!=null}">
                        <form method="post" action="/chat?action=chatSession&chatId=${chatSession.getChatId()}">
                            <div class="chat-message clearfix">
                                <div class="input-group mb-0">
                                    <button type="submit" style="display: inline">
                                        <span class="input-group-text"><i class="fa fa-send"></i></span>
                                    </button>
                                    <input type="text"
                                           name="content"
                                           class="form-control" placeholder="Enter text here..."
                                           style="width: 90%;padding: 5px;">
                                </div>
                            </div>
                        </form>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
