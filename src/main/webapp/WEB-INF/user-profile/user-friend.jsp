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
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div id="content" class="content content-full-width">
                <!-- begin profile -->
                <div class="profile">
                    <div class="profile-header">
                        <!-- BEGIN profile-header-cover -->
                        <div class="profile-header-cover"></div>
                        <!-- END profile-header-cover -->
                        <!-- BEGIN profile-header-content -->
                        <div class="profile-header-content">
                            <!-- BEGIN profile-header-img -->
                            <div class="profile-header-img">
                                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="">
                            </div>
                            <!-- END profile-header-img -->
                            <!-- BEGIN profile-header-info -->
                            <div class="profile-header-info">
                                <h4 class="m-t-10 m-b-5">Sean Ngu</h4>
                                <p class="m-b-10">UXUI + Frontend Developer</p>
                                <a href="#" class="btn btn-xs btn-yellow">Edit Profile</a>
                            </div>
                            <!-- END profile-header-info -->
                        </div>
                        <!-- END profile-header-content -->
                        <!-- BEGIN profile-header-tab -->
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
                        <!-- END profile-header-tab -->
                    </div>
                </div>
                <!-- end profile -->
                <!-- begin profile-content -->
                <div class="profile-content">
                    <!-- begin tab-content -->
                    <div class="tab-content p-0">
                        <!-- begin #profile-friends tab -->
                        <div class="tab-pane fade in active show" id="profile-friends">
                            <h4 class="m-t-0 m-b-20">Friend List (14)</h4>
                            <!-- begin row -->
                            <div class="row row-space-2">
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">James Pittman</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"
                                                       aria-expanded="false"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right"
                                                        x-placement="bottom-end"
                                                        style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(101px, 34px, 0px);">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">Mitchell Ashcroft</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">Ella Cabena</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"
                                                       aria-expanded="false"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right"
                                                        x-placement="top-end"
                                                        style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(101px, -2px, 0px);">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">Declan Dyson</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">George Seyler</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">Patrick Musgrove</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">Taj Connal</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">Laura Pollock</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">Dakota Mannix</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">Timothy Woolley</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">Benjamin Congreve</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">Mariam Maddock</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">Blake Gerrald</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <!-- end col-6 -->
                                <!-- begin col-6 -->
                                <div class="col-md-6 m-b-2">
                                    <div class="p-10 bg-white">
                                        <div class="media media-xs overflow-visible">
                                            <a class="media-left" href="javascript:;">
                                                <img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt=""
                                                     class="media-object img-circle">
                                            </a>
                                            <div class="media-body valign-middle">
                                                <b class="text-inverse">Gabrielle Bunton</b>
                                            </div>
                                            <div class="media-body valign-middle text-right overflow-visible">
                                                <div class="btn-group dropdown">
                                                    <a href="javascript:;" class="btn btn-default">Friends</a>
                                                    <a href="javascript:;" data-toggle="dropdown"
                                                       class="btn btn-default dropdown-toggle"></a>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li><a href="javascript:;">Action 1</a></li>
                                                        <li><a href="javascript:;">Action 2</a></li>
                                                        <li><a href="javascript:;">Action 3</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="javascript:;">Action 4</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col-6 -->
                            </div>
                            <!-- end row -->
                        </div>
                        <!-- end #profile-friends tab -->
                    </div>
                    <!-- end tab-content -->
                </div>
                <!-- end profile-content -->
            </div>
        </div>
    </div>
</div>
</body>
</html>
<jsp:include page="../bootstrap/footer.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
