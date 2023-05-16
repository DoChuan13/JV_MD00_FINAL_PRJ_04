<%@ page import="module04.projectmd04.model.User" %>
<%@ page import="module04.projectmd04.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="module04.projectmd04.model.RoleName" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="./WEB-INF/bootstrap/nav-bar.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
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
        boolean adminRole = false, pmRole = false;
        List<Role> roleList = new ArrayList<>(user.getRoleSet());
        for (Role role : roleList) {
            if (role.getName() == RoleName.ADMIN) {
                adminRole = true;
                continue;
            }
            if (role.getName() == RoleName.PM) {
                pmRole = true;
                continue;
            }
        }
        if (adminRole || pmRole) {
            response.sendRedirect("/admin");
            return;
        }
        response.sendRedirect("/post");
    %>
</c:if>
</body>
<jsp:include page="./WEB-INF/bootstrap/footer.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
</html>