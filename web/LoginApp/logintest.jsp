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
            Cookie cookie = new Cookie("id", id);
            cookie.setMaxAge(60*60);
            response.addCookie(cookie);
            response.sendRedirect("welcome.jsp");
        }
        else{
            response.sendRedirect("login.html");
        }
    %>
</body>
</html>
