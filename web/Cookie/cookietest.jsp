<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2019. 12. 5.
  Time: 오후 5:47
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
        if(cookies != null){
            for (int i=0; i<cookies.length; i++) {
                out.println("cookie [" + i + "] name : " + cookies[i].getName() + "</br>");
                out.println("cookie [" + i + "] value : " + cookies[i].getValue() + "</br>");
            }
        }
        else{
            out.println("cookie is deleted.");
        }
    %>
</body>
</html>
