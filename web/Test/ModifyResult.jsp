<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Modify Result </title>
</head>
<body>
    <%
        String name = session.getAttribute("name").toString();
    %>
    <%= name%>님의, 회원정보가 정상 수정되었습니다. </br>
    <a href="logout.jsp"> 로그아웃 </a>&nbsp;&nbsp;<a href="modify.jsp"> 정보수정 </a>
</body>
</html>