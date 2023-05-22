<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
<%@ page import="module04.projectmd04.model.Role" %>
<%@ page import="module04.projectmd04.model.User" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }

        .table-responsive {
            margin: 30px 0;
        }

        .table-wrapper {
            min-width: 1000px;
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 15px;
            background: #299be4;
            color: #fff;
            padding: 16px 30px;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .table-title .btn {
            color: #566787;
            float: right;
            font-size: 13px;
            background: #fff;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }

        .table-title .btn:hover,
        .table-title .btn:focus {
            color: #566787;
            background: #f2f2f2;
        }

        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }

        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }

        table.table tr th,
        table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }

        table.table tr th:first-child {
            width: 60px;
        }

        table.table tr th:last-child {
            width: 100px;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }

        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
        }

        table.table td a:hover {
            color: #2196F3;
        }

        table.table td a.settings {
            color: #2196F3;
        }

        table.table td a.delete {
            color: #F44336;
        }

        table.table td i {
            font-size: 19px;
        }

        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        .status {
            font-size: 30px;
            margin: 2px 2px 0 0;
            display: inline-block;
            vertical-align: middle;
            line-height: 10px;
        }

        .text-success {
            color: #10c469;
        }

        .text-info {
            color: #62c9e8;
        }

        .text-warning {
            color: #FFC107;
        }

        .text-danger {
            color: #ff5b5b;
        }

        .pagination {
            float: right;
            margin: 0 0 5px;
        }

        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }

        .pagination li a:hover {
            color: #666;
        }

        .pagination li.active a,
        .pagination li.active a.page-link {
            background: #03A9F4;
        }

        .pagination li.active a:hover {
            background: #0397d6;
        }

        .pagination li.disabled i {
            color: #ccc;
        }

        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }

        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</head>
<body>
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-5">
                        <h2>User <b>Management</b></h2>
                    </div>
                    <div class="col-sm-7">
                        <a href="/admin?action=logout" class="btn btn-secondary"><i style="font-size:24px" class="fa">&#xf08b;</i>
                            <span>Logout</span></a>
                    </div>
                </div>

            </div>
            <div>
                <c:if test='${requestScope["validate"]!=null}'>
                    <p style="color: red; height: 22px">${requestScope["validate"]}</p>
                </c:if>
                <c:if test='${requestScope["validate"]==null}'>
                    <p style="color: red; height: 22px"></p>
                </c:if>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                <tr style="height: 80px;">
                    <th>UserId</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th style="min-width: 150px;">Status</th>
                    <th style="min-width: 150px;">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:if test='${requestScope["userList"]!=null}'>
                    <c:forEach items='${requestScope["userList"]}' var="user">
                        <tr style="height: 80px;">
                            <td>${user.getUserId()}</td>
                            <td><a href="#"><img src="${user.getAvatar()}" class="avatar" alt="Avatar"
                                                 style="width: 20px">
                                    ${user.getName()}</a></td>
                            <td>${user.getEmail()}</td>
                            <td>
                                    <%--${user.getRoleSet()}--%>
                                <c:forEach items="${user.getRoleSet()}" var="role">
                                    ${role.getName()}
                                </c:forEach>
                            </td>
                            <td>
                                <c:if test="${user.isStatus()==false}">
                                    <span class="status text-success">&bull;</span> Active
                                </c:if>
                                <c:if test="${user.isStatus()==true}">
                                    <span class="status text-warning">&bull;</span> Blocked
                                </c:if>
                            </td>
                            </td>
                            <td>
                                <a href="/admin?page=${requestScope['currentPage']}&action=changeRole&id=${user.getUserId()}"
                                   class="settings"
                                   title="Change Role" data-toggle="tooltip">
                                    <i class="material-icons">&#xE8B8;</i></a>
                                <c:if test="${user.isStatus()==false}">
                                    <a href="/admin?page=${requestScope['currentPage']}&action=blockUser&id=${user.getUserId()}"
                                       class="band"
                                       title="Block" data-toggle="tooltip"><i class="material-icons">&#xe1b6;</i></a>
                                </c:if>
                                <c:if test="${user.isStatus()==true}">
                                    <a href="/admin?page=${requestScope['currentPage']}&action=unblockUser&id=${user.getUserId()}"
                                       class="band"
                                       title="Unblock" data-toggle="tooltip"><i class="material-icons">&#xe1b7;</i></a>
                                </c:if>

                                <a href="/admin?page=${requestScope['currentPage']}&action=delete&id=${user.getUserId()}" class="delete" title="Delete"
                                   data-toggle="tooltip">
                                    <i class="material-icons">&#xE5C9;</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
            <div class="clearfix">
                <div class="hint-text">Showing <b>${requestScope["currentPage"]*5}</b> out of
                    <b>${requestScope["maxElement"]}</b> entries
                </div>
                <ul class="pagination">
                    <c:if test='${requestScope["currentPage"]!=1}'>
                        <li class="page-item disabled"><a
                                href="/admin?page=${requestScope['currentPage']-1}">Previous</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${requestScope['maxPage']}" var="i">
                        <c:if test='${i!=requestScope["currentPage"]}'>
                            <li class="page-item"><a href="/admin?page=${i}" class="page-link">${i}</a></li>
                        </c:if>
                        <c:if test='${i==requestScope["currentPage"]}'>
                            <li class="page-item active"><a href="/admin?page=${i}" class="page-link">${i}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test='${requestScope["currentPage"]<requestScope["maxPage"]}'>
                        <li class="page-item"><a href="/admin?page=${requestScope["currentPage"]+1}" class="page-link">Next</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
