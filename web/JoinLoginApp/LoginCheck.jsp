<%@ page import="JoinLoginApp.MemberDao" %>
<%@ page import="JoinLoginApp.MemberDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Login Check </title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id"); // Login.jsp에서 입력한 id와 pw를 request 객체의 getParameter method 통해서 받음
        String pw = request.getParameter("pw");
        MemberDao dao = MemberDao.getInstance(); // MemberDao 객체의 instance인 dao 생성
        int userCheckLogic = dao.userCheck(id, pw); // dao의 userCheck method 실행하여 userChecklogic에 테스트 결과 int 값 반환

        if (userCheckLogic == -1) {
    %>
            <script language="JavaScript">
                alert("존재하지 않는 아이디입니다.");
                history.back();
            </script>
    <%
        } else if(userCheckLogic == 0) {
    %>
            <script language="JavaScript">
                alert("비밀번호가 다릅니다.");
                history.back();
            </script>
    <%
        } else if(userCheckLogic == 1) {
            // 로그인을 성공하는 경우 : dao의 getMemberInfo method를 실행하여 dto 객체 반환받고 이를 dto 객체에 저장
            MemberDto dto = dao.getMemberInfo(id);
            // Login 정보 (getMemberInfo 정보)를 나중에 활용하기 위해 session에 값을 저장
            session.setAttribute("id", dto.getId());
            session.setAttribute("name", dto.getName());
            session.setAttribute("email", dto.getEmail());
            session.setAttribute("address", dto.getAddress());
            session.setAttribute("ValidMember", "yes"); // Login.jsp에서 활용
            response.sendRedirect("Main.jsp"); // Login 검사가 정상 완료되었으므로 Main.jsp로 이동
        }
    %>
</body>
</html>

<%--
// DB 검색 시 id에 매칭되는 데이터가 없어 dto가 null인 경우
if(dto == null) {
%>
<script language="JavaScript">
    alert("존재하지 않는 회원입니다. 회원가입 후 로그인 가능합니다.");
    history.back();
</script>
<%
        // DB 검색 시 id 매쳉되는 데이터가 dto에 존재하는 경우
        } else {
    session.setAttribute("id", dto.getId()); // Login 유지를 위해 session의 id 값 set
    session.setAttribute("name", dto.getName()); // Login 유지를 위해 session의 name 값
    session.setAttribute("ValidMember", "yes"); // Login.jsp에서 활용
    response.sendRedirect("Main.jsp"); // Login 검사가 정상 완료되었으므로 Main.jsp로 이동
        }--%>
