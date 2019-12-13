<%@ page import="JoinLoginApp.MemberDao" %>
<%@ page import="JoinLoginApp.MemberDto" %>
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
        System.out.println(request.getParameter("name"));


        MemberDao dao = MemberDao.getInstance();
        MemberDto dto = dao.getMember(id);

        dto.setPw(request.getParameter("pw"));
        dto.setName(request.getParameter("name"));
        dto.setEmail(request.getParameter("email"));
        dto.setAddress(request.getParameter("address"));

        dao.updateMember(dto);
        session.setAttribute("name", dto.getName());
    %>
    <script language="JavaScript">
        alert("회원정보 수정이 완료되었습니다.");
        document.location.href = "Main.jsp";
    </script>
    %>
</body>
</html>
