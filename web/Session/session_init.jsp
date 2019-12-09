<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Session Init </title>
</head>
<body>
    <%
        session.setAttribute("mySessionName", "mySessionData");
        session.setAttribute("myNum", 12345);
    %>
    <a href="session_get.jsp"> Session Get </a>
</body>
</html>
