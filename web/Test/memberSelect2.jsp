<%@ page import="java.util.ArrayList" %>
<%@ page import="tutorials.MemberDTO" %>
<%@ page import="tutorials.MemberDAO2" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Member Select 2 </title>
</head>
<body>
<%
    MemberDAO2 memberDAO2 = new MemberDAO2();
    ArrayList<MemberDTO> dtos2 = memberDAO2.memberSelect();

    for (int i=0; i<dtos2.size();i++) {
        MemberDTO dto = dtos2.get(i);
        String name = dto.getName();
        String id = dto.getId();
        String pw = dto.getPw();
        String phone = dto.getPhone1() + "-" + dto.getPhone2() + "-" + dto.getPhone3();
        String gender = dto.getGender();

        out.println("이름 : " +name+ ", 아이디 : " +id+ ", 비밀번호 : " +pw+ ", 연락처 : " +phone+ ", 성별 : " +gender+ "</br></br>");
    }
%>
</body>
</html>