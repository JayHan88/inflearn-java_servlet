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
    <title> Session Remove Test </title>
</head>
<body>
    <%
        Enumeration enumeration = session.getAttributeNames();
        int i = 0;
        while (enumeration.hasMoreElements()) {
            i++;
            String sName = enumeration.nextElement().toString();
            String sValue = session.getAttribute(sName).toString();

            out.println("sName : " + sName + "</br></br>");
            out.println("sValue : " + sValue + "</br></br>");
        }
        if (i==0) {
            out.println("Session is removed.");
        }
    %>
</body>
</html>
