<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title> Content </title>
</head>
<body>
    <table width="500" cellpadding="0" cellspacing="0" border="7">
        <form action="modify.bo" method="post">
            <input type="hidden" name="bId" value="${content_view.bId}">
            <tr>
                <td align="center"> 번호 </td>
                <td> ${content_view.bId}</td>
            </tr>
            <tr>
                <td align="center"> 조회 </td>
                <td> ${content_view.bHit}</td>
            </tr>
            <tr>
                <td align="center"> 이름 </td>
                <td>
                    <input type="text" name="bName" value="${content_view.bName}">
                </td>
            </tr>
            <tr>
                <td align="center"> 제목 </td>
                <td>
                    <input type="text" name="bTitle" value="${content_view.bTitle}">
                </td>
            </tr>
            <tr>
                <td align="center"> 내용 </td>
                <td>
                    <input type="text" name="bContent" value="${content_view.bContent}">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a href="list.bo"> 목록보기 </a> &nbsp;&nbsp;
                    <input type="submit" value="수정하기"> &nbsp;&nbsp;
                    <a href="delete.bo?bId=${content_view.bId}"> 삭제하기 </a> &nbsp;&nbsp;
                    <a href="reply_view.bo?bId=${content_view.bId}"> 답글달기 </a>
                </td>
            </tr>
        </form>
    </table>
</body>
</html>
