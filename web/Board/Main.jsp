<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- LoginCheck.jsp에서 session 값 미리 설정 !-->
<% if(session.getAttribute("ValidMember") != "yes") { %>
    <jsp:forward page="/Board/Login.jsp"></jsp:forward>
<%
    }
    String id = session.getAttribute("id").toString();
    String name = session.getAttribute("name").toString();
    String email = session.getAttribute("email").toString();
    String address = session.getAttribute("address").toString();
%>

<html>
<head>
    <title> Main Page </title>
</head>
<body>
    <form action = "/Board/Logout.jsp" method="get">
        <h1> <%=name%>님, 안녕하세요! </h1>
        <h1> <%=id%>님, 안녕하세요! </h1>
        <h1> <%=email%>님, 안녕하세요! </h1>
        <h1> <%=address%>님, 안녕하세요! </h1>
        <input type="submit" value="로그아웃"> &nbsp;&nbsp;
        <input type="button" value="회원정보 수정" onclick="window.location='/Board/Modify.jsp'">  &nbsp;&nbsp;
    </form>
    <form action="/Board/list.bo" method="post">
        <input type="hidden" name="userId" value="<%= id %>">
        <input type="hidden" name="bName" value="<%= name %>">
        <input type="submit" value="게시판">
    </form>
</body>
</html>
