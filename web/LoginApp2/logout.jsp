<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Logout Test Page </title>
</head>
<body>
    <%
        Cookie[] cookies = request.getCookies();

        if (cookies != null){
            for (int i = 0; i < cookies.length; i++){
                String id = cookies[i].getValue();
                if (id.equals("han5517")){
                    cookies[i].setMaxAge(0);
                    response.addCookie(cookies[i]);
                    response.sendRedirect("login.html");
                }
            }
        }
    %>
</body>
</html>
