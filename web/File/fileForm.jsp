<%--
  Created by IntelliJ IDEA.
  User: jay
  Date: 2020. 1. 9.
  Time: 오후 3:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> File Form</title>
</head>
<body>
    <form action="fileFormCheck.jsp" method="post" enctype="multipart/form-data">
        파일 : <input type="file" name="file"></br>
        <input type="submit" value="File Upload">
    </form>
</body>
</html>
