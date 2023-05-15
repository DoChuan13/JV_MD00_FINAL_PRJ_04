<%--
  Created by IntelliJ IDEA.
  User: chuan
  Date: 14/05/2023
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<section class="vh-100" style="background-color: #ffffff;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScGlw1Eu6UJgO82m46RE8CMJbOd597wxZEQw&usqp=CAU"
                                 alt="login form" class="img-fluid"
                                 style="border-radius: 1rem 0 0 1rem; height:100% ;"/>
                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">

                                <form method="post">

                                    <div class="d-flex align-items-center mb-3 pb-1">
                                        <i class="fas fa-cubes fa-2x me-3" style="color: #ffffff;"></i>
                                        <span class="h1 fw-bold mb-0">Login</span>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="text" id="form2Example17" class="form-control form-control-lg"
                                               name="userName"/>
                                        <label class="form-label" for="form2Example17">User Name</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="password" id="form2Example27"
                                               class="form-control form-control-lg" name="password"/>
                                        <label class="form-label" for="form2Example27">Password</label>
                                    </div>

                                    <div class="pt-1 mb-4">
                                        <button class="btn btn-dark btn-lg btn-block" type="submit"
                                                style="background-color: blue;">Login
                                        </button>
                                    </div>

                                    <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a
                                            href="/user?action=register"
                                            style="color: #393f81;">Register
                                        here</a></p>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
