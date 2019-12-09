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
    <title> Logout </title>
</head>
<body>
    <%
        Enumeration enumeration = session.getAttributeNames();
        while (enumeration.hasMoreElements()) {
            String sName = enumeration.nextElement().toString();
            String sValue = session.getAttribute(sName).toString();
            if(sValue.equals("han5517")) {
                session.removeAttribute(sName);
                out.println("Logout is completed!</br></br>");
            }
        }
    %>
    <a href="session_test.jsp"> Session Remove Test </a>
</body>
</html>
