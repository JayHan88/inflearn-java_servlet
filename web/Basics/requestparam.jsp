<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Request Parameters </title>
</head>
<body>
    <h1> Let's learn about Request Parameters! </h1>

    <%!
        String name, id, pw, major, protocol;
        String [] hobby;
    %>
    <%
        request.setCharacterEncoding("UTF-8");
        name = request.getParameter("name");
        id = request.getParameter("id");
        pw = request.getParameter("pw");
        major = request.getParameter("major");
        protocol = request.getParameter("protocol");
        hobby = request.getParameterValues("hobby");
    %>

    이름 : <%= name %></br>
    아이디 : <%= id %></br>
    패스워드 : <%= pw %></br>
    전공 : <%= major %></br>
    프로토콜 : <%= protocol %></br>
    취미 : <%= Arrays.toString(hobby) %></br>

</body>
</html>
