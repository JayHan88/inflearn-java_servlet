<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2019. 12. 5.
  Time: 오후 1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Include </title>
</head>
<body>
    <h1> Let's learn how to use include page! </h1>
    ======================================================================</br>
    <h2> This is "include.jsp" page. </h2>
    <h2> This is "scriptlet.jsp" page. </h2>
    <%@ include file="scriptlet.jsp"%>
    <h2> This is "include.jsp" page again.</h2>

    <!--
        여기는 HTML 주석입니다.
    -->
    <%--
        여기는 JSP 주석입니다.
    --%>

</body>
</html>
