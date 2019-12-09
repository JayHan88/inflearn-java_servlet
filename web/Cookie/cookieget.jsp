<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2019. 12. 5.
  Time: 오후 5:32
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
        for (int i = 0; i < cookies.length; i++){
            String str = cookies[i].getName();
            if (str.equals("cookieName")){
                out.println("Cookie[" + i + "] name : " + cookies[i].getName() + "</br>");
                out.println("Cookie[" + i + "] value : " + cookies[i].getValue() + "</br>");
                out.println("=======================================================</br>");
            }
        }
    %>

    <a href="cookiedel.jsp"> cookie delete </a>
</body>
</html>
