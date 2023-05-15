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
</body>
<jsp:include page="./WEB-INF/bootstrap/footer.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
</html>