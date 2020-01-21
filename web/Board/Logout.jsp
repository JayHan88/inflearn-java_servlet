<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    session.invalidate();
    response.sendRedirect("/Board/Login.jsp");
%>
<html>
<head>
    <title> Logout Page </title>
</head>
<body>

</body>
</html>
