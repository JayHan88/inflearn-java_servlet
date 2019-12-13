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

        MemberDao dao = MemberDao.getInstance();
        int userCheckLogic = dao.userCheck(id, pw);
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
                history.go(-1);
            </script>
    <%
        } else if(userCheckLogic == 1) {
            MemberDto dto = dao.getMember(id);
            if(dto == null) {
    %>
            <script language="JavaScript">
                alert("존재하지 않는 회원입니다.");
                history.go(-1);
            </script>
    <%
            } else {
                String name = dto.getName();
                session.setAttribute("id", id);
                session.setAttribute("name", name);
                session.setAttribute("ValidMem", "yes");
                response.sendRedirect("Main.jsp");
            }
        }
    %>
</body>
</html>
