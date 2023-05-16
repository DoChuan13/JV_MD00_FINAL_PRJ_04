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
<div id="content" class="container p-0">
  <div class="profile-header">
    <div class="profile-header-cover"></div>
    <div class="profile-header-content">
      <div class="profile-header-img">
        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="" />
      </div>
      <div class="profile-header-info">
        <h4 class="m-t-sm">Clyde Stanley</h4>
        <p class="m-b-sm">UXUI + Frontend Developer</p>
        <a href="#" class="btn btn-xs btn-primary mb-4">Edit Profile</a>
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
          <div class="tab-pane active show" id="profile-photos">
            <div class="m-b-10"><b>Photos (30)</b></div>
            <ul class="img-grid-list">
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/008B8B/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/6495ED/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/4169E1/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/FF7F50/000000"
                                 alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/FF0000/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/6495ED/000000"
                                 alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/B0E0E6/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/9932CC/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/DB7093/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/FF1493/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/191970/000000"
                                 alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/FF8C00/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/EEE8AA/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/1E90FF/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/3CB371/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/9932CC/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/B0C4DE/000000"
                                 alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/ADD8E6/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/008B8B/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/D3D3D3/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/008B8B/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/20B2AA/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/48D1CC/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/008B8B/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/6495ED/000000"
                                 alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/008B8B/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/FFC0CB/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/008B8B/000000" alt=""
                                 class="img-portrait" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/DDA0DD/000000"
                                 alt="" /></a>
              </li>
              <li>
                <a href="#"><img src="https://www.bootdey.com/image/150x150/008B8B/000000"
                                 alt="" /></a>
              </li>
            </ul>
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
            <div class="value">C++, PHP, HTML5, CSS, jQuery, MYSQL, Ionic, Laravel, Phonegap, Bootstrap,
              Angular JS, Angular JS, Asp.net</div>
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
                Twitter, Inc.<br />
                1355 Market Street, Suite 900<br />
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
            <a href="#" class="m-b-5"><img src="https://www.bootdey.com/image/150x150/008B8B/000000"
                                           alt="" /></a>
            <a href="#" class="m-b-5"><img src="https://www.bootdey.com/image/150x150/008B8B/000000"
                                           alt="" /></a>
            <a href="#" class="m-b-5"><img src="https://www.bootdey.com/image/150x150/008B8B/000000"
                                           alt="" /></a>
            <a href="#" class="m-b-5"><img src="https://www.bootdey.com/image/150x150/008B8B/000000"
                                           alt="" /></a>
            <a href="#" class="m-b-5"><img src="https://www.bootdey.com/image/150x150/008B8B/000000"
                                           alt="" /></a>
            <a href="#" class="m-b-5"><img src="https://www.bootdey.com/image/150x150/008B8B/000000"
                                           alt="" /></a>
            <a href="#" class="m-b-5"><img src="https://www.bootdey.com/image/150x150/008B8B/000000"
                                           alt="" /></a>
            <a href="#" class="m-b-5"><img src="https://www.bootdey.com/image/150x150/008B8B/000000"
                                           alt="" /></a>
            <a href="#" class="m-b-5"><img src="https://www.bootdey.com/image/150x150/008B8B/000000"
                                           alt="" /></a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
</body>
</html>
<jsp:include page="../bootstrap/footer.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
