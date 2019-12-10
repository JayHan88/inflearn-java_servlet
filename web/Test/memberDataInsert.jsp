<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Connection connection;
    PreparedStatement preparedStatement;

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
            Class.forName(driver);
            connection = DriverManager.getConnection(url, uid, upw);
            int n;
            String query = "insert into memberforpre (id, pw, name, phone) values (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, "abc");
            preparedStatement.setString(2, "123");
            preparedStatement.setString(3, "홍길동");
            preparedStatement.setString(4, "010-8821-9391");
            n = preparedStatement.executeUpdate();

            preparedStatement.setString(1, "sdfx213");
            preparedStatement.setString(2, "123");
            preparedStatement.setString(3, "최민지");
            preparedStatement.setString(4, "010-8121-1111");
            n = preparedStatement.executeUpdate();

            preparedStatement.setString(1, "kdik30");
            preparedStatement.setString(2, "123");
            preparedStatement.setString(3, "박민수");
            preparedStatement.setString(4, "010-8111-9213");
            n = preparedStatement.executeUpdate();

            preparedStatement.setString(1, "adervv");
            preparedStatement.setString(2, "123");
            preparedStatement.setString(3, "김또치");
            preparedStatement.setString(4, "010-1123-9310");
            n = preparedStatement.executeUpdate();

            if (n == 1) {
                out.println("Insert Success!</br>");
            } else {
                out.println("Insert Fail!");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>

    <a href="memberDataView.jsp"> 회원정보보기 </a>
</body>
</html>
