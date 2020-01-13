<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Dispathcer </title>
</head>
<body>
    dispatcher.jsp
    <hr/>

    id : <%= request.getAttribute("id")%> <br/>
    pw : <%= request.getAttribute("pw")%> <br/>

    <%
        RequestDispatcher dispatcher = request.getRequestDispatcher("");
        dispatcher.forward(request, response);
    %>
</body>
</html>
