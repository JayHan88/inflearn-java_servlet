<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2019. 12. 5.
  Time: 오후 1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Scriptlet </title>
</head>
<body>
    <h1> Let's learn how to use scriptlet! </h1>
    <%
        int i = 1;
        while(true){
            out.println("2 X " + i + " = " + (2*i) + "</br>");
            i++;
    %>
    ===============</br>
    <%
            if(i >= 10)
                break;
        }
    %>
</body>
</html>

