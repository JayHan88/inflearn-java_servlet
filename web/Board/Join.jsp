<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Join Page </title>
    <script language="JavaScript" src="/Board/members.js"></script>
</head>
<body>
    <form action="/Board/JoinCheck.jsp" method="post" name="regi_form">
        아이디 : <input type="text" name="id" size="20"></br></br>
        패스워드 : <input type="password" name="pw" size="20"></br></br>
        패스워드 확인 : <input type="password" name="pw_check" size="20"></br></br>
        이름 : <input type="text" name="name" size="20"></br></br>
        이메일 주소 : <input type="text" name="email" size="20"></br></br>
        주소 : <input type="text" name="address" size="20"></br></br>
        <input type="button" value="가입하기" onclick="infoConfirm()"> &nbsp;&nbsp; <input type="reset" value="돌아가기" onclick="window.location='/Board/Login.jsp'">
    </form>
</body>
</html>

<%--
    1. <script language="JavaScript" src="members.js"></script> : javasript 언어 사용 선언 + member.js의 변수, method를 사용 선언
    2. 가입하기 button 클릭 : member.js의 infoConfirm method를 거친 뒤에 form action에서 정의된 jsp로 submit 됨
    3. form action 태그에 name을 지정 : js 파일에서 document.name 형식으로 jsp 문서 이용 가능
        ex) document.reg_form.pw.value : reg_form이라는 form action 태그 내 pw 이름을 가진 변수의 입력 value를 의미함.
--%>