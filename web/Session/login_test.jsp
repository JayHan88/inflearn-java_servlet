<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2019. 12. 6.
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Login Test </title>
</head>
<body>
    <%
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        if (id.equals("han5517") && pw.equals("1234")) {
            session.setAttribute("id", id);
            response.sendRedirect("welcome.jsp");
        }
        else {
            response.sendRedirect("login.html");
        }
    %>
</body>
</html>
