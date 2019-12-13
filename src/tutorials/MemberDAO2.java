package tutorials;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MemberDAO2 {

    private DataSource dataSource;

    public MemberDAO2() throws SQLException {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<MemberDTO> memberSelect() {
        ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            con = dataSource.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from MEMBER");

            while (rs.next()) {
                String name = rs.getString("name");
                String id = rs.getString("id");
                String pw = rs.getString("pw");
                String phone1 = rs.getString("phone1");
                String phone2 = rs.getString("phone2");
                String phone3 = rs.getString("phone3");
                String gender = rs.getString("gender" );

                MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);
                dtos.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) con.close();
                if (stmt != null) stmt.close();
                if (rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dtos;
    }





}
