<%@ page import="JoinLoginApp.MemberDao" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8"); // 반드시 먼저 선언되어야 함.
%>
<jsp:useBean id="dto" class="JoinLoginApp.MemberDto" /> <%-- MemberDto java bean을 dto라는 이름으로 사용하겠다는 선언 --%>
<jsp:setProperty name="dto" property="*" /> <%-- dto라는 java bean의 property 값을 지정, * : property의 값을 같은 이름을 갖는 parameter 값으로 설정 --%>

<html>
<head>
    <title> Join Check </title>
</head>
<body>
    <%
        dto.setRdate(new Timestamp(System.currentTimeMillis())); // rdate 값에 JoinCheck 접속 시간을 받아와서 입력
        MemberDao dao = MemberDao.getInstance();  // MemberDao 객체의 instance인 dao 생성

        // MemberDao 객체 dao에 dto 객체의 id 값(사용자가 회원가입하기 위해 입력한 id)을 parameter로 전달하여 중복된 ID가 있는지 confirmId mehtod를 통해 체크
        if(dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXIST) {
    %>
            <script language="JavaScript">
                alert("이미 존재하는 아이디입니다.");
                history.back();
            </script>
    <%
        } else {
            // 회원가입 성공 : DB에 dto 객체에 담긴 값들은 insertMember method를 통해 입력해줘야 함
            int logic = dao.insertMember(dto);
            if(logic == MemberDao.MEMBER_JOIN_SUCCESS) {
                // DB 데이터 입력 성공 : Login.jsp에서 ID 입력 칸에 본인 ID가 바로 뜰 수 있도록 session에 id 값 set
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
                    alert("회원가입을 실패했습니다. (DB 데이터 입력 실패, 관리자에게 문의)");
                    document.location.href = "Login.jsp";
                </script>
    <%
            }
        }
    %>
</body>
</html>