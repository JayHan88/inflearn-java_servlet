<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2019. 12. 6.
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Welcome </title>
</head>
<body>
    <%
        Enumeration enumeration = session.getAttributeNames();
        while (enumeration.hasMoreElements()) {
            String sName = enumeration.nextElement().toString();
            String sValue = session.getAttribute(sName).toString();
            if (sValue.equals("han5517")) {
                out.println("Welcome to Jay's world, " + sValue + "! </br></br>");
            }
        }
    %>
    <a href="logout.jsp"> Logout </a>
</body>
</html>
