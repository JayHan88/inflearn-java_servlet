<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
    %>
    <%-- jsp expresssion --%>
    아이디 : <%= id %> <br/>
    패스워드 : <%= pw %>

    <hr/>

    <%-- EL expresssion --%>

    <%-- param이라는 내장 객체 바로 활용 --%>
    아이디: ${param.id} <br/>
    패스워드: ${param.pw} <br/>

    아이디: ${param["id"]} <br/>
    패스워드: ${param["pw"]}

    <hr/>

    applicationScope : ${applicationScope.application_name} <br/>
    sessionScope : ${sessionScope.session_name} <br/>
    pageScope : ${pageScope.page_name} <br/>
    requestScope : ${requestScope.request_name} <br/>

    <hr/>

    context 초기화 파라미터 <br/>
    ${initParam.con_name} <br/>
    ${initParam.con_id} <br/>
    ${initParam.con_pw} <br/>

</body>
</html>
