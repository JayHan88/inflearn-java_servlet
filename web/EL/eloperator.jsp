<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    ${1+2} </br>
    ${2-1} </br>
    ${1*2} </br>
    ${1/2} </br>
    ${1>2} </br>
    ${1<2} </br>
    ${1==2} </br>
    ${(1>2) ? 1 : 2} </br>
    <%--
        a? b : c a가 true이면 b의 값을 취하고, false이면 c의 값을 취하라.
    --%>
    ${(1>2) || (1<2)} </br>
</body>
</html>
