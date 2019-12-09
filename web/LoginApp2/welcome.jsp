<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Welcome Page </title>
</head>
<body>
    <%
        Cookie[] cookies = request.getCookies();

        for(int i = 0; i < cookies.length; i++) {
            String id = cookies[i].getValue();
            if (id.equals("han5517")) {
                out.println("Welcome to Jay's world, " + id + "!</br></br>");
            }
        }
    %>
    <a href="logout.jsp"> Logout </a>
</body>
</html>
