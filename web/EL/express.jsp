<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="member" class="tutorials.MemberInfo" scope="page"/>

<jsp:setProperty name="member" property="name" value="Jay"/>
<jsp:setProperty name="member" property="phone" value="abc"/>
<jsp:setProperty name="member" property="age" value="tt"/>

<html>
<head>
    <title> </title>
</head>
<body>
    이름 : <jsp:getProperty name="member" property="name"/><br/>
    번호 : <jsp:getProperty name="member" property="phone"/><br/>
    나이 : <jsp:getProperty name="member" property="age"/><br/>

    <hr/>

    이름 : ${member.name}<br/>
    번호 : ${member.phone}<br/>
    나이 : ${member.age}<br/>
</body>
</html>
