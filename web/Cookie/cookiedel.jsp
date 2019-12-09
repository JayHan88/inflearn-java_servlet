<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2019. 12. 5.
  Time: 오후 5:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Cookie[] cookies = request.getCookies();

        for (int i=0; i<cookies.length; i++){
            String str = cookies[i].getName();
            if (str.equals("cookieName")){
                out.println("cookie [" + i + "] name : " + cookies[i].getName() + "</br>");
                cookies[i].setMaxAge(0);
                response.addCookie(cookies[i]);
            }
        }
    %>
    <a href="cookietest.jsp"> cookie test </a>
</body>
</html>
