<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2019. 12. 5.
  Time: 오후 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Include 01 </title>
</head>
<body>
    <h1> This is Include 01 Page. </h1>
    =====================================</br>
    <jsp:include page="include02.jsp" flush="true"></jsp:include>
    =====================================</br>
    <h1> Again! This is Include 01 Page. </h1>
</body>
</html>
