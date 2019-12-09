<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2019. 12. 5.
  Time: 오후 5:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Cookie cookie = new Cookie("cookieName", "cookieValue");
        cookie.setMaxAge(60*60); // 1 hour
        response.addCookie(cookie);
    %>
    <a href="cookieget.jsp"> cookie get </a>
</body>
</html>
