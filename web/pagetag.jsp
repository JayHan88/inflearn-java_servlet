<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Page Tag</title>
</head>
<body>
    <h1> Let's learn how to use page tag!</h1>
    <%
        int [] list = {10, 20, 30, 40, 50};
        out.println(Arrays.toString(list));
    %>
</body>
</html>
