<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Redirect </title>
</head>
<body>
    <%
        request.setAttribute("id", "abcde");
        request.setAttribute("pw", "12345");

        response.sendRedirect("/RequestObj2");
    %>
</body>
</html>
