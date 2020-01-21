<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String usreId = request.getAttribute("userId").toString();
%>
<html>
<head>
    <title> List </title>
</head>
<body>
    <%= usreId %>님, 어서오세요. <br/><br/>
    <form action="write_view.bo" method="post">
        <table width="1000" cellpadding="0" cellspacing="0" border="1">
            <tr bgcolor="#87cefa">
                <th> 번호 </th>
                <th> 아이디 </th>
                <th> 이름 </th>
                <th> 제목 </th>
                <th> 날짜 </th>
                <th> 조회 </th>
            </tr>

            <c:forEach items="${list}" var="dto">
                <!-- request 객체 안에 list 속성에 dtos arraylist가 담겨 있음 !-->
                <!-- list 속성의 하나 하나를 dto라는 var로 정의하고 가져오는 것 !-->
                <tr>
                    <td align="center"> ${dto.bId} </td>
                    <td align="center"> ${dto.userId} </td>
                    <td align="center"> ${dto.bName} </td>
                    <td>
                        <c:forEach begin="1" end="${dto.bIndent}">-</c:forEach> <!-- 답변 쓸 때 들여쓰기 !-->
                        <a href="content_view.bo?bId=${dto.bId}"> ${dto.bTitle} </a>
                    </td>
                    <td align="center"> ${dto.bDate} </td>
                    <td align="center"> ${dto.bHit} </td>
                </tr>
            </c:forEach>

            <tr>
                <td colspan="5" align="center" valign="middle">
                    <input type="hidden" name="userId" value="<%= usreId %>">
                    <input type="submit" value="글 작성">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
