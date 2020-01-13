package JoinLoginApp;

import javax.management.remote.rmi._RMIConnection_Stub;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDao {
    // for Connection
    private DataSource dataSource;
    public Connection connection = null;
    public PreparedStatement preparedStatement = null;
    public ResultSet resultSet = null;

    // for confirmId method
    public static final int MEMBER_NO_EXIST = 0;
    public static final int MEMBER_EXIST = 1;

    // for insertMember method
    public static final int MEMBER_JOIN_SUCCESS = 1;
    public static final int MEMBER_JOIN_FAIL = 0;

    // for userCheck method
    public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
    public static final int MEMBER_LOGIN_SUCCESS = 1;
    public static final int MEMBER_LOGIN_NO_ID = -1;

    // for updateMember method
    public static final int MEMBER_UPDATE_SUCCESS = 1;
    public static final int MEMBER_UPDATE_FAIL = 0;

    // Singleton Pattern : instance 사용 시 동일 instance를 여러 개 만드는 것이 아니라, 동일 instance를 사용하게 하는 전략
    // private Constructor : MemberDao instance = new MemberDao 방법을 통한 instance 생성 불가
    // private 접근제어자 : MemberDao.instance 로의 접근 불가, static : 1개만 존재
    private static MemberDao instance = new MemberDao();
    private MemberDao() {
        // for Datasource
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
        } catch (NamingException e) { e.printStackTrace(); }
    }
    public static MemberDao getInstance() { return instance; } // MemberDao instance 생성의 유일한 방법 : getInstance method 활용


    // id와 pw를 parameter로 받아, DB로 query하여 pw가 일치하는지 확인하고 login 가능 여부를 판단하여 int logic을 return하는 method
    public int userCheck (String id, String pw) {
        int logic = 0;
        String dbPw; // id parameter로 검색한 DB에서의 password
        String query = "select pw from MEMBERAPP where id = ?";

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();

            // resultSet 객체에 query 결과 존재, next()로 데이터가 있는지 판단함
            if(resultSet.next()){
                dbPw = resultSet.getString("pw"); // DB에서 get한 password
                // DB에서 get한 password와 사람이 Login.jsp에서 입력하여 parameter로 입력된 password 간의 비교
                if(dbPw.equals(pw)) {
                    logic = MemberDao.MEMBER_LOGIN_SUCCESS; // value 1, 일치 = 로그인 가능
                } else {
                    logic = MemberDao.MEMBER_LOGIN_PW_NO_GOOD; // value 0, 불일치 = 로그인 불가
                }
            } else {
                logic = MemberDao.MEMBER_LOGIN_NO_ID; // value -1, query 결과 데이터 없음 = 매칭되는 id 없음
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


    // 로그인 성공 시 id를 parameter로 받아, DB를 query하여 해당 user의 회원 정보를 가져와 dto 객체에 set하고 dto 객체를 return하는 method
    public MemberDto getMemberInfo(String id) {
        // MemberDto 객체 dto 선언
        MemberDto dto = new MemberDto();
        String query = "select * from MEMBERAPP where id = ?";

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, id);
            resultSet = preparedStatement.executeQuery();

            // DB query 결과를 dto 객체에 set
            if(resultSet.next()){
                dto.setId(resultSet.getString("id"));
                dto.setPw(resultSet.getString("pw"));
                dto.setName(resultSet.getString("name"));
                dto.setEmail(resultSet.getString("email"));
                dto.setRdate(resultSet.getTimestamp("rdate"));
                dto.setAddress(resultSet.getString("address"));
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
        return dto;
    }


    // 회원가입 시 입력한 id를 받아 DB를 검색하고 중복되는 ID가 있는지 확인한 후 int logic을 return하는 method
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


    // dto 객체에 저장된 데이터들을 DB에 삽입한 후 그 결과를 int logic에 담아 return하는 method
    public int insertMember (MemberDto dto) {
        int logic = 0;
        int check;
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
           check = preparedStatement.executeUpdate();
           if (check == 1){
               logic = MemberDao.MEMBER_JOIN_SUCCESS;
           } else {
               logic = MemberDao.MEMBER_JOIN_FAIL;
           }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (preparedStatement != null) preparedStatement.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return logic;
    }

    public int updateMember(MemberDto dto) {
        int logic = 0;
        int check;
        String query = "update memberapp set pw = ?, name = ?, email = ?, address = ? where id = ?";

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, dto.getPw());
                preparedStatement.setString(2, dto.getName());
                preparedStatement.setString(3, dto.getEmail());
                preparedStatement.setString(4, dto.getAddress());
                preparedStatement.setString(5, dto.getId());
            check = preparedStatement.executeUpdate();
            if (check == 1){
                logic = MemberDao.MEMBER_UPDATE_SUCCESS;
            } else {
                logic = MemberDao.MEMBER_UPDATE_FAIL;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (preparedStatement != null) preparedStatement.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return logic;
    }

    public ArrayList<MemberDto> memberAll() {
        ArrayList<MemberDto> dtos = new ArrayList();
        String query = "select * from MEMBERAPP";

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            System.out.println("==================");
            while (resultSet.next()) {
                MemberDto dto = new MemberDto();
                dto.setId(resultSet.getString("id"));
                dto.setPw(resultSet.getString("pw"));
                dto.setName(resultSet.getString("name"));
                dto.setEmail(resultSet.getString("email"));
                dto.setRdate(resultSet.getTimestamp("rDate"));
                dto.setAddress(resultSet.getString("address"));
                dtos.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (preparedStatement != null) preparedStatement.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dtos;
    }
}
