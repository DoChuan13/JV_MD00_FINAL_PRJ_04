<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../bootstrap/nav-bar.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Title</title>
</head>
<body>
<div class="container">
    <div id="content" class="content p-0">
        <div class="profile-header">
            <div class="profile-header-cover"></div>

            <div class="profile-header-content">
                <div class="profile-header-img">
                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt=""/>
                </div>

                <div class="profile-header-info">
                    <h4 class="m-t-sm">John Doe</h4>
                    <p class="m-b-sm">UXUI + Frontend Developer</p>
                    <a href="#" class="btn btn-xs btn-info mb-4">Edit Profile</a>
                </div>
            </div>

            <ul class="profile-header-tab nav nav-tabs">
                <li class="nav-item"><a href="/post?action=show" target="__blank"
                                        class="nav-link_">POSTS</a></li>
                <li class="nav-item"><a href="/profile?action=show" target="__blank"
                                        class="nav-link_">FROFILE</a></li>
                <li class="nav-item"><a href="/photos?action=show" target="__blank"
                                        class="nav-link_">PHOTOS</a></li>
                <li class="nav-item"><a href="/video?action=show" target="__blank"
                                        class="nav-link_">VIDEOS</a></li>
                <li class="nav-item"><a href="/friend?action=show" target="__blank"
                                        class="nav-link_ active show">FRIENDS</a></li>
            </ul>
        </div>

        <div class="profile-container">
            <div class="row row-space-20">
                <div class="col-md-8">
                    <div class="tab-content p-0">
                        <div class="tab-pane active show" id="profile-videos">
                            <div class="m-b-10"><b>Videos (15)</b></div>

                            <div class="row row-space-2">
                                <div class="col-sm-8">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/3Kf-FlECN7M?showinfo=0"></iframe>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/izsjRpcgfmk?showinfo=0"></iframe>
                                    </div>
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/j876xgnTVUg?showinfo=0"></iframe>
                                    </div>
                                </div>
                            </div>

                            <div class="row row-space-2">
                                <div class="col-sm-4">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/wUqH_5memWY?showinfo=0"></iframe>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/wXmu-EYAmKU?showinfo=0"></iframe>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/xS1DghfzuMc?showinfo=0"></iframe>
                                    </div>
                                </div>
                            </div>

                            <div class="row row-space-2">
                                <div class="col-sm-4">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/v3ZkCLUFrys?showinfo=0"></iframe>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/toPm-L7Ib44?showinfo=0"></iframe>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/qD8OnPC1fLI?showinfo=0"></iframe>
                                    </div>
                                </div>
                            </div>

                            <div class="row row-space-2">
                                <div class="col-sm-4">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/Guo7gR0XyaU?showinfo=0"></iframe>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/ADfIlLfs5Bk?showinfo=0"></iframe>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/8Wg1MYjOguI?showinfo=0"></iframe>
                                    </div>
                                </div>
                            </div>

                            <div class="row row-space-2">
                                <div class="col-sm-4">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/LbpHB9wbDhY?showinfo=0"></iframe>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/oVWBFkaXMyw?showinfo=0"></iframe>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="embed-responsive embed-responsive-16by9 m-b-2">
                                        <iframe class="embed-responsive-item"
                                                src="https://www.youtube.com/embed/90PRvlhOLSk?showinfo=0"></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 hidden-xs hidden-sm">
                    <ul class="profile-info-list">
                        <li class="title">PERSONAL INFORMATION</li>
                        <li>
                            <div class="field">Occupation:</div>
                            <div class="value">UXUI / Frontend Developer</div>
                        </li>
                        <li>
                            <div class="field">Skills:</div>
                            <div class="value">C++, PHP, HTML5, CSS, jQuery, MYSQL, Ionic, Laravel, Phonegap,
                                Bootstrap,
                                Angular JS, Angular JS, Asp.net
                            </div>
                        </li>
                        <li>
                            <div class="field">Birth of Date:</div>
                            <div class="value">1989/11/04</div>
                        </li>
                        <li>
                            <div class="field">Country:</div>
                            <div class="value">San Francisco</div>
                        </li>
                        <li>
                            <div class="field">Address:</div>
                            <div class="value">
                                <address class="m-b-0">
                                    Twitter, Inc.<br/>
                                    1355 Market Street, Suite 900<br/>
                                    San Francisco, CA 94103
                                </address>
                            </div>
                        </li>
                        <li>
                            <div class="field">Phone No.:</div>
                            <div class="value">
                                (123) 456-7890
                            </div>
                        </li>
                        <li class="title">FRIEND LIST (9)</li>
                        <li class="img-list">
                            <a href="#" class="m-b-5"><img src="https://bootdey.com/img/Content/avatar/avatar2.png"
                                                           alt=""/></a>
                            <a href="#" class="m-b-5"><img src="https://bootdey.com/img/Content/avatar/avatar3.png"
                                                           alt=""/></a>
                            <a href="#" class="m-b-5"><img src="https://bootdey.com/img/Content/avatar/avatar4.png"
                                                           alt=""/></a>
                            <a href="#" class="m-b-5"><img src="https://bootdey.com/img/Content/avatar/avatar5.png"
                                                           alt=""/></a>
                            <a href="#" class="m-b-5"><img src="https://bootdey.com/img/Content/avatar/avatar6.png"
                                                           alt=""/></a>
                            <a href="#" class="m-b-5"><img src="https://bootdey.com/img/Content/avatar/avatar7.png"
                                                           alt=""/></a>
                            <a href="#" class="m-b-5"><img src="https://bootdey.com/img/Content/avatar/avatar8.png"
                                                           alt=""/></a>
                            <a href="#" class="m-b-5"><img src="https://bootdey.com/img/Content/avatar/avatar1.png"
                                                           alt=""/></a>
                            <a href="#" class="m-b-5"><img src="https://bootdey.com/img/Content/avatar/avatar2.png"
                                                           alt=""/></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<jsp:include page="../bootstrap/footer.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>