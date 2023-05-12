<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<a href="/user">User</a>
<a href="/chat">Chat</a>

</body>
<jsp:include page="./WEB-INF/bootstrap/footer.jsp">
    <jsp:param name="articleId" value=""/>
</jsp:include>
</html>