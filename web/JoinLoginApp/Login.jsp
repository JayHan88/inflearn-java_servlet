<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- session에 valid member 라는 값이 yes로 찍혀있으면 추가 로그인 없이 바로 main page로 보내주는 기능 --%>
<% if(session.getAttribute("ValidMember") == "yes") { %>
    <jsp:forward page="Main.jsp"></jsp:forward>
<% } %>

<html>
<head>
    <title> Login Page </title>
</head>
<body>
    <form action="LoginCheck.jsp" method="post">
        </br>
        아이디 : <input type="text" name="id" size="20"
                     <%-- JoinCheck.jsp에서 회원가입 + DB 데이터 입력 성공 시 dto.id의 값을 session에 저장하고 바로 가져와서 ID 칸에 미리 입력해서 보여주는 기능 --%>
                     value="<% if(session.getAttribute("id") != null) out.println(session.getAttribute("id")); %>"></br></br>
        패스워드 : <input type="password" name="pw" size="20"></br></br>
        <input type="submit" value="로그인"> &nbsp;&nbsp; <input type="button" value="회원가입" onclick="window.location='Join.jsp'">
    </form>
</body>
</html>
