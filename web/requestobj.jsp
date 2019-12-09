<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title> Request Object </title>
</head>
<body>
    <h1> Let's learn about Request Object! </h1>

    <%
        out.println("서버 이름 : " + request.getServerName() + "</br>");
        out.println("포트 번호 : " + request.getServerPort() + "</br>");
        out.println("서버 경로 : " + request.getServletPath() + "</br>");
        out.println("요청 방식 : " + request.getMethod() + "</br>");
        out.println("프로토콜 : " + request.getProtocol() + "</br>");
        out.println("URL : " + request.getRequestURL() + "</br>");
        out.println("URI : " + request.getRequestURI());

    %>
</body>
</html>
