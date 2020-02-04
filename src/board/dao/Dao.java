// DAO : Data Access Object, DB에 연결되어 필요한 logic을 수행

package board.dao;

import board.dto.Dto;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

public class Dao {

    private DataSource dataSource;
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    public Dao() {
        // DB Connection pool 이용
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
        } catch (Exception e) { e.printStackTrace(); }
    }

    // 게시판에 신규 글을 쓰는 경우
   public void write(String userId, String bTitle, String bName, String bContent) {
        System.out.println("Write에 들어오는 userId : " + userId);
        int logic = 0;
        String query = "insert into mvc_board (userId, bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent) values (?, mvc_board_seq.nextval, ?, ?, ?, 0, mvc_board_seq.currval, 0, 0)";
        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, userId);
                preparedStatement.setString(2, bName);
                preparedStatement.setString(3, bTitle);
                preparedStatement.setString(4, bContent);
            logic = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (preparedStatement != null) preparedStatement.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    // 게시판의 글 리스트를 불러올 때
    public ArrayList<Dto> list() {
        ArrayList<Dto> dtos = new ArrayList();
        String query = "select userId, bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent from mvc_board order by bGroup DESC, bStep ASC";

        try {
          connection = dataSource.getConnection();
          preparedStatement = connection.prepareStatement(query);
          resultSet = preparedStatement.executeQuery();

          while(resultSet.next()) {
              String userId = resultSet.getString("userId");
              int bId = resultSet.getInt("bId");
              String bName = resultSet.getString("bName");
              String bTitle = resultSet.getString("bTitle");
              String bContent = resultSet.getString("bContent");
              Timestamp bDate = resultSet.getTimestamp("bDate");
              int bHit = resultSet.getInt("bHit");
              int bGroup = resultSet.getInt("bGroup");
              int bStep = resultSet.getInt("bStep");
              int bIndent = resultSet.getInt("bIndent");

              Dto dto = new Dto(userId, bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
              dtos.add(dto);
          }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (preparedStatement != null) preparedStatement.close();
                if (resultSet != null) resultSet.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return dtos;
    }

    // 게시판 글을 조회할 때
    public Dto contentView(String str) {
        upHit(str);
        Dto dto = null;
        String query = "select * from mvc_board where bId = ?";

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, str);
            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
                String userId = resultSet.getString("userId");
                int bId = resultSet.getInt("bId");
                String bName = resultSet.getString("bName");
                String bTitle = resultSet.getString("bTitle");
                String bContent = resultSet.getString("bContent");
                Timestamp bDate = resultSet.getTimestamp("bDate");
                int bHit = resultSet.getInt("bHit");
                int bGroup = resultSet.getInt("bGroup");
                int bStep = resultSet.getInt("bStep");
                int bIndent = resultSet.getInt("bIndent");

                dto = new Dto(userId, bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (preparedStatement != null) preparedStatement.close();
                if (resultSet != null) resultSet.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return dto;
    }

    // 게시판 글을 수정할 때
    public void modify(String bId, String bName, String bTitle, String bContent) {
        int logic = 0;
        String query = "update MVC_BOARD set bName = ?, bTitle = ?, bContent = ? where BID = ?";
        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, bName);
                preparedStatement.setString(2, bTitle);
                preparedStatement.setString(3, bContent);
                preparedStatement.setString(4, bId);
            logic = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (preparedStatement != null) preparedStatement.close();
                if (resultSet != null) resultSet.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    public void delete(String bId) {
        int logic = 0;
        String query = "delete from mvc_board where bId = ?";
        System.out.println(bId);
        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, bId);
            logic = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (preparedStatement != null) preparedStatement.close();
                if (resultSet != null) resultSet.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    public Dto reply_view (String str) {
        Dto dto = null;
        String query = "select * from mvc_board where bid = ?";

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, str);
            resultSet = preparedStatement.executeQuery();

            if(resultSet.next()) {
                String userId = resultSet.getString("userId");
                int bId = resultSet.getInt("bId");
                String bName = resultSet.getString("bName");
                String bTitle = resultSet.getString("bTitle");
                String bContent = resultSet.getString("bContent");
                Timestamp bDate = resultSet.getTimestamp("bDate");
                int bHit = resultSet.getInt("bHit");
                int bGroup = resultSet.getInt("bGroup");
                int bStep = resultSet.getInt("bStep");
                int bIndent = resultSet.getInt("bIndent");

                dto = new Dto(userId, bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (preparedStatement != null) preparedStatement.close();
                if (resultSet != null) resultSet.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return dto;
    }

    public void reply(String bId, String bName, String bTitle, String bContent, String bGroup, String bStep, String bIndent, String userId) {
        replyShape(bGroup, bStep);
        int logic = 0;
        String query = "insert into mvc_board (bId, bName, bTitle, bContent, bGroup, bStep, bIndent, userId) values (MVC_BOARD_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?)";

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, bName);
                preparedStatement.setString(2, bTitle);
                preparedStatement.setString(3, bContent);
                preparedStatement.setInt(4, Integer.parseInt(bGroup));
                preparedStatement.setInt(5, Integer.parseInt(bStep) + 1 );
                preparedStatement.setInt(6, Integer.parseInt(bIndent) + 1 );
                preparedStatement.setString(7, userId);
            logic = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (preparedStatement != null) preparedStatement.close();
                if (resultSet != null) resultSet.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    public void replyShape(String strGroup, String strStep) {
        int logic = 0;
        String query = "update mvc_board set bStep = bStep + 1 where bGroup = ? and bStep > ?";

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, Integer.parseInt(strGroup));
                preparedStatement.setInt(2, Integer.parseInt(strStep));
            logic = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (preparedStatement != null) preparedStatement.close();
                if (resultSet != null) resultSet.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    private void upHit(String bId) {
        int logic = 0;
        String query = "update mvc_board set bHit = bHit + 1 where bId = ?";

        try {
            connection = dataSource.getConnection();
            preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, bId);
            logic = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (preparedStatement != null) preparedStatement.close();
                if (resultSet != null) resultSet.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
}

