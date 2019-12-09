<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2019. 12. 5.
  Time: 오후 5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Forward Parameter </title>
</head>
<body>
    <h1> This is Forward Parameter Page. </h1>
    <%
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
    %>
    아이디 : <%= id %></br>
    패스워드 : <%= pw%>

</body>
</html>
