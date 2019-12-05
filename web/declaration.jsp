<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2019. 12. 5.
  Time: 오후 1:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Declaration </title>
</head>
<body>
    <h1> Let's learn how to declare scriptlet! </h1>
    <%!
        int age = 28;
        String name = "Jay";

        public int sum (int a, int b) {
            return a+b;
        }
    %>

    <%
        out.println("My age is " + age + ".</br>");
        out.println("My name is " + name + ".</br>");
        out.println("one plus five is " + sum(1,5) + ".");
    %>
</body>
</html>
