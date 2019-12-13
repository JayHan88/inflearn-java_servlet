<%@ page import="JoinLoginApp.MemberDao" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%-- MemberDto java bean 사용 선언 --%>
<jsp:useBean id="dto" class="JoinLoginApp.MemberDto" />
<%-- MemberDto property 정의 --%>
<jsp:setProperty name="dto" property="*" />

<html>
<head>
    <title> Join Check </title>
</head>
<body>
    <%
        // rdate 값에 JoinCheck 접속 시간을 받아와서 입력
        dto.setRdate(new Timestamp(System.currentTimeMillis()));
        // MemberDao 객체 가져오기
        MemberDao dao = MemberDao.getInstance();
        // MemberDao 객체 dao를 통해 ID 중복 체크, dto 객체의 id 값을 parameter로 활용
        if(dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXIST) {
    %>
            <script language="JavaScript">
                alert("이미 존재하는 아이디입니다.");
                history.back();
            </script>
    <%
        } else {
            int logic = dao.insertMember(dto);
            if(logic == MemberDao.MEMBER_JOIN_SUCCESS) {
                session.setAttribute("id", dto.getId());
    %>
                <script language="JavaScript">
                    alert("회원가입을 축하합니다.");
                    document.location.href = "Login.jsp";
                </script>
    <%
            } else {
    %>
                <script language="JavaScript">
                    alert("회원가입을 실패했습니다.");
                    document.location.href = "Login.jsp";
                </script>
    <%
            }
        }
    %>
</body>
</html>