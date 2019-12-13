<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Join Page </title>
    <script language="JavaScript" src="members.js"></script>
</head>
<body>
    <form action="JoinCheck.jsp" method="post" name="reg_form">
        아이디 : <input type="text" name="id" size="20"></br></br>
        패스워드 : <input type="password" name="pw" size="20"></br></br>
        패스워드 확인 : <input type="password" name="pw_check" size="20"></br></br>
        이름 : <input type="text" name="name" size="20"></br></br>
        이메일 주소 : <input type="text" name="email" size="20"></br></br>
        주소 : <input type="text" name="address" size="20"></br></br>
        <input type="button" value="가입하기" onclick="infoConfirm()"> &nbsp;&nbsp;&nbsp; <input type="reset" value="돌아가기" onclick="window.location='/JoinLoginApp/Login.jsp'">
    </form>
</body>
</html>

<%--
    0. <script language="JavaScript" src="members.js"></script> 해야 javasript function을 사용할 수 있음.
    1. 가입하기 button 클릭 : infoConfirm에 있는 js method를 거친 뒤에 form action에서 정의된 jsp로 이동한다.
    2. form action 태그에 name을 지정하고, js 파일에서 document.name 형식으로 jsp 문서 전체를 이용할 수 있다.
        ex) document.reg_form.pw.value : reg_form이라는 form action 태그 내 pw 이름을 가진 변수의 입력 value를 의미함.
--%>