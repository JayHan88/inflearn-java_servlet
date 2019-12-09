<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Login Success! </title>
</head>
<body>
    <%
        String name = session.getAttribute("name").toString();
        String id = session.getAttribute("id").toString();
        String pw = session.getAttribute("pw").toString();
    %>

    <%= name %>님, 안녕하세요. </br>
    <a href="modify.jsp"> 회원 정보 수정 </a>
</body>
</html>
