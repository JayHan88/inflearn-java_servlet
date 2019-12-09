package tutorials;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(urlPatterns = {"/MO"}, name = "ModifyOk")
public class ModifyOk extends HttpServlet {

    private Connection connection;
    private Statement stmt;
    private String name, pw, phone1, phone2, phone3, gender;
    private HttpSession httpSession;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost");
        actionDo(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet");
        actionDo(request, response);
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        httpSession = request.getSession();
        String sessionId = httpSession.getAttribute("id").toString();

        name = request.getParameter("name");
        pw = request.getParameter("pw");
        phone1 = request.getParameter("phone1");
        phone2 = request.getParameter("phone2");
        phone3 = request.getParameter("phone3");
        gender = request.getParameter("gender");


        if (pwConfirm()) {
            String query = "update member set name = '" +name+ "', phone1 = '" +phone1+ "', phone2 = '" +phone2+ "', phone3 = '" +phone3+ "', gender = '" +gender+ "' where id ='" +sessionId+ "'";

            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "han5517", "ehfkdpahd92");
                stmt = connection.createStatement();
                int i = stmt.executeUpdate(query);

                if (i == 1) {
                    System.out.println("Update Success.");
                    httpSession.setAttribute("name", name);
                    response.sendRedirect("/Test/ModifyResult.jsp");
                } else {
                    System.out.println("Update Fail.");
                    response.sendRedirect("/Test/modify.jsp");
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            } finally {
                if (stmt != null) {
                    try {
                        stmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        else {
            System.out.println("NG");
            response.sendRedirect("/Test/modify.jsp");
        }
    }

    private boolean pwConfirm() {
        boolean rs;
        String sessionPw = httpSession.getAttribute("pw").toString();

        if (sessionPw.equals(pw)) {
            rs = true;
        } else {
            rs = false;
        }

        return rs;
    }
}
