<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%!
    private Connection connection;
    private Statement stmt;
    private String name, pw, phone1, phone2, phone3, gender;
    private ResultSet resultSet;
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Modify </title>
</head>
<body>
    <%
        String id = session.getAttribute("id").toString();
        String query = "select * from member where id = '" +id+"'";

        Class.forName("oracle.jdbc.driver.OracleDriver");
        connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "han5517", "ehfkdpahd92");
        stmt = connection.createStatement();
        resultSet = stmt.executeQuery(query);

        while(resultSet.next()) {
            name = resultSet.getString("name");
            pw = resultSet.getString("pw");
            phone1 = resultSet.getString("phone1");
            phone2 = resultSet.getString("phone2");
            phone3 = resultSet.getString("phone3");
            gender = resultSet.getString("gender");
        }
    %>

    <form action="/MO" method="post">
        이름 : <input type="text" name="name" size="20" value=<%=name%>></br>
        아이디 : <%=id%> </br>
        패스워드 : <input type="password" name="pw" size="20"></br>
        전화번호 : <select name="phone1">
        <option value="010"> 010 </option>
        <option value="010"> 016 </option>
        <option value="010"> 017 </option>
        <option value="010"> 018 </option>
        <option value="010"> 019 </option>
        <option value="010"> 011 </option>
        </select> - <input type="text" name="phone2" size="5" value=<%=phone2%>> - <input type="text" name="phone3" size="5" value=<%=phone3%>></br>
        <%
            if(gender.equals("man")){
        %>
        성별 : <input type="radio" name="gender" value="man" checked="checked"> 남자&nbsp;<input type="radio" name="gender" value="woman"> 여자 </br>
        <%
            }else {
        %>
        성별 : <input type="radio" name="gender" value="man"> 남자&nbsp;<input type="radio" name="gender" value="woman" checked="checked"> 여자 </br>
        <%
            }
        %>
        <input type="submit" value="정보수정">  <input type="reset" value="취소">
    </form>
</body>
</html>
