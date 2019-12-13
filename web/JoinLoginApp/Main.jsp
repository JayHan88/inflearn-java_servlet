<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- LoginCheck.jsp에서 session 값 미리 설정 !-->
<% if(session.getAttribute("ValidMember") != "yes") { %>
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
    <form action = "Logout.jsp" method="post">
        <h1> <%=name%>님, 안녕하세요! </h1>
        <input type="submit" value="로그아웃"> &nbsp;&nbsp; <input type="button" value="회원정보 수정" onclick="window.location='Modify.jsp'">
    </form>
</body>
</html>
