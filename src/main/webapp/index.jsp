<%@ page import="module04.projectmd04.model.User" %>
<%@ page import="module04.projectmd04.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="module04.projectmd04.model.RoleName" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<c:if test='${sessionScope["loginUser"]==null}'>
    <%
        response.sendRedirect("/user?action=login");
    %>
</c:if>
<c:if test='${sessionScope["loginUser"]!=null}'>
    <%
        User user = (User) request.getSession().getAttribute("loginUser");
        boolean userRole = true;
        List<Role> roleList = new ArrayList<>(user.getRoleSet());
        for (Role role : roleList) {
            if (role.getName() == RoleName.ADMIN || role.getName() == RoleName.PM) {
                userRole = false;
                break;
            }
        }
        if (userRole) {
            response.sendRedirect("/post");

        } else {
            response.sendRedirect("/admin");
            return;
        }
    %>
</c:if>
</body>
</html>