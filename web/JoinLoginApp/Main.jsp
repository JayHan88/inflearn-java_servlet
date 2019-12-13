<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    if(session.getAttribute("ValidMem") == null) {
%>
        <jsp:forward page="Login.jsp"></jsp:forward>
<%
    }
    String name = session.getAttribute("name").toString();
%>

<html>
<head>
    <title> Main Page </title>
</head>
<body>
    <h1> <%=name%>님, 안녕하세요! </h1>
    <form action = "Logout.jsp" method="post">
        <input type="submit" value="로그아웃"> &nbsp;&nbsp;&nbsp; <input type="button" value="회원정보 수정" onclick="window.location='Modify.jsp'">
    </form>
</body>
</html>
