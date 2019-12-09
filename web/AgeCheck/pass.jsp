<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Age Check System </title>
</head>
<body>
    <%!
        int age;
    %>

    <%
        String str = request.getParameter("age");
        age = Integer.parseInt(str);
    %>
    You are adult so you can buy drinks. </br>
    <a href="request_agecheck.html"> Go back to first page. </a>

</body>
</html>
