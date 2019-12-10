<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2019. 12. 5.
  Time: 오후 1:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Expression </title>
</head>
<body>
    <h1> Let's learn how to use expression! </h1>
    <%!
        int age = 28;
        String name = "Jay";

        public int sum (int a, int b) {
            return a+b;
        }
    %>
    <%= age %> </br>
    <%= name %> </br>
    <%= sum(1,5) %> </br>


</body>
</html>
