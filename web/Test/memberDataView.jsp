<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Connection connection;
    Statement stmt;
    ResultSet rs;

    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String uid = "han5517";
    String upw = "ehfkdpahd92";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        try {
            String query = "select * from MEMBERFORPRE";

            Class.forName(driver);
            connection = DriverManager.getConnection(url, uid, upw);
            stmt = connection.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()){
                String id = rs.getString("id");
                String pw = rs.getString("pw");
                String name = rs.getString("name");
                String phone = rs.getString("phone");

                out.println("아이디 : " + id + ", 패스워드 : " + pw + ", 이름 : " + name + ", 전화번호 : " +phone + "</br>");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(connection != null) connection.close();
                if(stmt != null) stmt.close();
                if(rs != null) rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
