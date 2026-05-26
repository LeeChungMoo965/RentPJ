package dao;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public class Login {
    public boolean checkLogin(String id, String password) {

        // 팩토리 개체 생성
        ConnectionFactory factory = new ConnectionFactory();
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // 사용자가 유효한 사용자인지 먼저 체크 (초기값: false)
        boolean isValidUser = false;

        try {
            // 팩토리 객체를 사용하여 자원 연결
            factory.setconnect();
            conn = factory.getconnect();

            // 실행할 sql 쿼리
            String sql = "SELECT * FROM member WHERE id=? AND password=?";
    
            // 쿼리를 안전하게 실행하기 위해 PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql);
    
            pstmt.setString(1, id);
            pstmt.setString(2, password);
    
            // 데이터베이스에 쿼리를 전송하여 실행하고, 그 결과 데이터를 rs(ResultSet)에 저장
            rs = pstmt.executeQuery();

            // 사용자가 입력한 id와 password가 일치하는 회원 정보가 DB에 존재하는지 검사
            if (rs.next()) {
                isValidUser = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 자원 최종 반납
            if (rs != null) { try { rs.close(); } catch (SQLException e) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException e) {} }
        }
        // 최종 결과 반환 (성공 true, 실패 false)
        return isValidUser;
    }
}
