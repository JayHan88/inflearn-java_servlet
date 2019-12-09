<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Login Test Page </title>
</head>
<body>
    <%
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        if (id.equals("han5517") && pw.equals("1234")) {
            Cookie cookie = new Cookie("id", id);
            cookie.setMaxAge(60*60);
            response.addCookie(cookie);
            response.sendRedirect("/LoginApp2/welcome.jsp");
        }
        else {
            response.sendRedirect("/LoginApp2/login.html");
        }
    %>
</body>
</html>
