<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2019. 12. 5.
  Time: 오후 5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Forward </title>
</head>
<body>
    <h1> This is Forward Page. </h1>
    <jsp:forward page="forward_param.jsp">
        <jsp:param name="id" value="han5517"/>
        <jsp:param name="pw" value="1234"/>
    </jsp:forward>
</body>
</html>
