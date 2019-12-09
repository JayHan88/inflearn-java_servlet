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

        if(age > 19){
            response.sendRedirect("pass.jsp?age=" + age);
        }
        else {
            response.sendRedirect("fail.jsp?age=" + age);
        }
    %>
</body>
</html>
