<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Connection connection;
    Statement statement;
    ResultSet resultSet;

    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String uid = "han5517";
    String upw = "ehfkdpahd92";
    String query = "SELECT * FROM test";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        try{
            out.println("하나");
            Class.forName(driver);
            out.println("둘");
            connection = DriverManager.getConnection(url, uid, upw);
            out.println("셋");
            statement = connection.createStatement();
            out.println("넷");
            resultSet = statement.executeQuery(query);
            while(resultSet.next()){
                out.println("hello.");
                String id = resultSet.getString("id");
                String pw = resultSet.getString("pw");
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                out.println("아이디 : " + id + ", 비밀번호 : " + pw + ", 이름 : " + name + ", 전화번호 : " + phone + "</br>");
            }
        }
        catch (Exception e){
            out.println("오류 발생 씨발!!!");
            e.getMessage();
        } finally {
            try{
                if(resultSet != null) resultSet.close();
                if(statement != null) statement.close();
                if(connection != null) connection.close();
            }
            catch (Exception e) {}
        }
    %>
</body>
</html>
