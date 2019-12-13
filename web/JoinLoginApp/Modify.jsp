<%@ page import="JoinLoginApp.MemberDao" %>
<%@ page import="JoinLoginApp.MemberDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String id = session.getAttribute("id").toString();
    MemberDao dao = MemberDao.getInstance();
    MemberDto dto = dao.getMember(id);
%>
<html>
<head>
    <title> Modify Page </title>
    <script language="JavaScript" src="members.js"></script>
</head>
<body>
    이름, 이메일 주소, 주소를 변경할 수 있습니다. 패스워드를 입력해주세요! </br></br>
    <form action="ModifyCheck.jsp" method="post" name="mod_form">
        아이디 : <%= dto.getId() %> </br></br>
        패스워드 : <input type="password" name="pw" size="20"> </br></br>
        패스워드 확인 : <input type="password" name="pw_check" size="20"> </br></br>
        이름 : <input type="text" name="name" size="20" value="<%= dto.getName()%>"> </br></br>
        이메일 주소 : <input type="text" name="email" size="20" value="<%= dto.getEmail()%>"> </br></br>
        주소 : <input type="text" name="address" size="20" value="<%= dto.getAddress()%>"> </br></br>
        <input type="button" value="수정하기" onclick="updateInfoConfirm()"> &nbsp;&nbsp;&nbsp; <input type="reset" value="돌아가기" onclick="window.location='Login.jsp'">
    </form>
</body>
</html>
