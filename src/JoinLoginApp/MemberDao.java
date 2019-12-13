package JoinLoginApp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
    // for Connection
    private DataSource dataSource;
    public Connection connection = null;
    public PreparedStatement preparedStatement = null;
    public ResultSet resultSet = null;

    // 상수형으로 logic 정해놓기
    public static final int MEMBER_NO_EXIST = 0;
    public static final int MEMBER_EXIST = 1;
    public static final int MEMBER_JOIN_FAIL = 0;
    public static final int MEMBER_JOIN_SUCCESS = 1;
    public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
    public static final int MEMBER_LOGIN_SUCCESS = 1;
    public static final int MEMBER_LOGIN_NO_ID = -1;

    // Singleton Pattern : instance 사용 시 동일 instance를 여러 개 만드는 것이 아니라, 동일 instance를 사용하게 하는 전략
    private static MemberDao instance = new MemberDao(); // private 접근제어자 : MemberDao.instance 로의 접근 불가, static : 1개만 존
    // private Constructor : MemberDao instance = new MemberDao 방법을 통한 instance 생성 불가
    private MemberDao() {
        // for Datasource
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
    // MemberDao instance 생성의 유일한 방법 : getInstance method 활용
    public static MemberDao getInstance() { return instance; }

    // 회원가입 시 중복되는 ID가 있는지 확인하는 logic
    public int confirmId (String id){
        int logic = 0;
        String query = "select id from memberapp where id = ?";

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();

            if(resultSet.next()) {
                logic = MemberDao.MEMBER_EXIST;
            } else {
                logic =  MemberDao.MEMBER_NO_EXIST;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return logic;
    }



    // 회원가입 시 DB에 회원정보를 입력하는 logic
    public int insertMember (MemberDto dto) {
        int logic = 0;
        String query = "insert into memberapp values (?, ?, ?, ?, ?, ?)";

        try {
           connection = dataSource.getConnection();
           preparedStatement = connection.prepareStatement(query);
               preparedStatement.setString(1, dto.getId());
               preparedStatement.setString(2, dto.getPw());
               preparedStatement.setString(3, dto.getName());
               preparedStatement.setString(4, dto.getEmail());
               preparedStatement.setTimestamp(5, dto.getRdate());
               preparedStatement.setString(6, dto.getAddress());
           preparedStatement.executeUpdate();
           logic = MemberDao.MEMBER_JOIN_SUCCESS;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return logic;
    }

    public int updateMember(MemberDto dto) {
        int logic = 0;
        String query = "update memberapp set name = ?, email = ?, address = ? where id = ?";

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, dto.getName());
                preparedStatement.setString(2, dto.getEmail());
                preparedStatement.setString(3, dto.getAddress());
                preparedStatement.setString(4, dto.getId());
            logic = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return logic;
    }

    public int userCheck (String id, String pw) {
        int logic = 0;
        String dbPw;
        String query = "select pw from MEMBERAPP where id = ?";

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                dbPw = resultSet.getString("pw");
                if(dbPw.equals(pw)) {
                    logic = MemberDao.MEMBER_LOGIN_SUCCESS;
                } else {
                    logic = MemberDao.MEMBER_LOGIN_PW_NO_GOOD;
                }
            } else {
                logic = MemberDao.MEMBER_LOGIN_NO_ID;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (preparedStatement != null) preparedStatement.close();
                if (resultSet != null) resultSet.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return logic;
    }

    // 로그인 성공 시 회원정보를 가져오는 method
    public MemberDto getMember(String id) {
        MemberDto dto = null;
        String query = "select * from MEMBERAPP where id = ?";

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                dto = new MemberDto();
                dto.setId(resultSet.getString("id"));
                dto.setPw(resultSet.getString("pw"));
                dto.setName(resultSet.getString("name"));
                dto.setEmail(resultSet.getString("email"));
                dto.setRdate(resultSet.getTimestamp("rdate"));
                dto.setAddress(resultSet.getString("address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dto;
    }
}
