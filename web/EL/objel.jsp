<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="objelcheck.jsp" method="get">
        아이디 : <input type="text" name="id"> <br/>
        패스워드 : <input type="password" name="pw"> <br/>
        <input type="submit" value="login">
    </form>

    <%
        application.setAttribute("application_name", "application_value");
        session.setAttribute("session_name", "session_value");
        pageContext.setAttribute("page_name", "page_value");
        request.setAttribute("request_name", "request_value");
    %>
</body>
</html>
