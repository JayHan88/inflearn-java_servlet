<%@ page import="board.dao.MemberDao" %>
<%@ page import="board.dto.MemberDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
    <title> Modify Check </title>
</head>
<body>
    <%
        String id = session.getAttribute("id").toString();
        MemberDao dao = MemberDao.getInstance();
        MemberDto dto = dao.getMemberInfo(id);

        dto.setPw(request.getParameter("pw"));
        dto.setName(request.getParameter("name"));
        dto.setEmail(request.getParameter("email"));
        dto.setAddress(request.getParameter("address"));

        int logic = dao.updateMember(dto);
        if (logic == MemberDao.MEMBER_UPDATE_SUCCESS) {
            session.setAttribute("name", dto.getName());
    %>
            <script language="JavaScript">
                alert("회원정보 수정이 완료되었습니다.");
                document.location.href = "/Board/Main.jsp";
            </script>
    <%
        } else {
    %>
            <script language="JavaScript">
                alert("회원정보 수정에 실패하였습니다.");
                document.location.href = "/Board/Modify.jsp";
            </script>
    <%
        }
    %>
</body>
</html>
