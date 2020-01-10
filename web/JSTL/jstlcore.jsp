<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title> JSTL </title>
</head>
<body>
    <c:set var="varName" value="varValue"/>
    varName : <c:out value = "${varName}"/>

    <br/>

    <c:remove var="varName"/>
    varName : <c:out value="${varName}"/>

    <hr/>

    <c:catch var="error">
        <%= 2/0 %>
    </c:catch>
    <c:out value="${error}"/>

    <hr/>

    <c:if test="${1+2 == 3}">
        1 + 2 = 3
    </c:if>

    <c:if test="${1+2 != 3}">
        1 + 2 != 3
    </c:if>

    <hr/>

    <c:forEach var="forEach" begin="0" end="30" step="3">
        ${forEach} </br>
    </c:forEach>
</body>
</html>
