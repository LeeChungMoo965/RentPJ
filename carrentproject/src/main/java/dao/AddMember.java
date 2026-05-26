package dao;
import java.sql.SQLException;
import dto.Member;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public class AddMember {
    public boolean insertMember(Member member) {

        // 팩토리 개체 생성
        ConnectionFactory factory = new ConnectionFactory();
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // 회원가입 데이터 저장의 성공 여부 체크 (초기값: false) - AI 도움을 받아 코드를 작성
        boolean isSuccess = false;

        try {
            // 팩토리 객체를 사용하여 자원 연결
            factory.setconnect();
            conn = factory.getconnect();

            // 실행할 sql 쿼리
            String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
    
            // 쿼리를 안전하게 실행하기 위해 PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql);
    
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getGender());
            pstmt.setString(5, member.getBirth());
            pstmt.setString(6, member.getPhone());
            pstmt.setString(7, member.getEmail());
            pstmt.setString(8, member.getAddress());
    
            // 데이터베이스에 INSERT 쿼리를 실행 (성공 시 1 이상의 행 수가 반환)
            int result = pstmt.executeUpdate();

            // 데이터가 성공적으로 삽입되면 result가 1로 바뀌고 isSuccess는 true
            if (result > 0) {
                isSuccess = true;
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
        return isSuccess;
    }
}
