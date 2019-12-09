<jsp:useBean id="student" class="tutorials.Student" scope="page" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Bean Example</title>
</head>
<body>
    <jsp:setProperty name="student" property="name" value="Jay" />
    <jsp:setProperty name="student" property="age" value="28" />
    <jsp:setProperty name="student" property="grade" value="3" />
    <jsp:setProperty name="student" property="studentNum" value="1111255" />

    이름 : <jsp:getProperty name="student" property="name"/></br>
    나이 : <jsp:getProperty name="student" property="age"/></br>
    연차 : <jsp:getProperty name="student" property="grade"/></br>
    사번 : <jsp:getProperty name="student" property="studentNum"/></br>

</body>
</html>
