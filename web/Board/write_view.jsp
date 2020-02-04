<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = request.getParameter("userId");
    String bName = request.getParameter("bName");
%>
<html>
<head>
    <title> Write </title>
</head>
<body>
    <table width="500" cellpadding="0" cellspacing="0" border="3">
        <form action="write.bo" method="post">
            <input type="hidden" name="userId" value="<%= userId %>">
            <input type="hidden" name="bName" value="<%= bName %>">
            <tr>
                <td align="center"> 아이디 </td>
                <td> <%= userId %> </td>
            </tr>
            <tr>
                <td align="center"> 이름 </td>
                <td> <%= bName %> </td>
            </tr>
            <tr>
                <td align="center" width="100"> 제목 </td>
                <td> <input type="text" name="bTitle" value="${write_view.bTitle}"> </td>
            </tr>
            <tr>
                <td align="center" valign="middle" width="100" height="300"> 내용 </td>
                <td> <textarea rows="22" cols="60" name="bContent"> ${write_view.bContent} </textarea> </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="글 쓰기"> &nbsp;&nbsp;
                    <input type="button" value="목록 보기" onclick="window.location='list.bo'">
                </td>
            </tr>
        </form>
    </table>
</body>
</html>
