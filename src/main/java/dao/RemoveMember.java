package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import dto.Member;
import java.sql.ResultSet;

public class RemoveMember {

    ConnectionFactory factory = new ConnectionFactory(); 
    Connection conn = null; 
    PreparedStatement pstmt = null; 
    ResultSet rs = null; 
    Member member = null;

    // 기존 회원 정보 출력 
    public Member getMemberById(String id) { 
       
        try { 
            factory.setconnect(); 
            conn = factory.getconnect(); 

            String sql = "SELECT * FROM member WHERE id=?";

            pstmt = conn.prepareStatement(sql); 
            pstmt.setString(1, id);
            rs = pstmt.executeQuery(); 
            
            if(rs.next()){ 
                member = new Member(); 
                member.setId(rs.getString("id")); 
                member.setPassword(rs.getString("password")); 
                member.setName(rs.getString("name")); 
                member.setMail(rs.getString("mail")); 
                member.setPhone(rs.getString("phone"));
                member.setAddress(rs.getString("address"));
                member.setRegist_day(rs.getString("regist_day"));  
            } 
        } catch(Exception e) { 
            e.printStackTrace(); 
        } finally { 
            if(rs != null){ try{ rs.close(); } catch(SQLException e){} } 
            if(pstmt != null){ try{ pstmt.close(); } catch(SQLException e){} } 
            if(conn != null){ try{ conn.close(); } catch(SQLException e){} } } 

            return member; 
        }

    // 회원 삭제
    public boolean deleteMember(String id) {

        boolean isSuccess = false;

        try {
            // DB 연결
            factory.setconnect();
            conn = factory.getconnect();

            // 수동 커밋 모드로 전환하여 두 삭제 작업을 하나의 묶음(트랜잭션)으로 처리 (AI 도움)
            conn.setAutoCommit(false);

            /* 해당 회원이 작성한 모든 예약 내역(활동 데이터) 삭제 */
            // SQL

            String sql_delete_reservation = "DELETE FROM reservation WHERE id=?";

            pstmt = conn.prepareStatement(sql_delete_reservation);
            pstmt.setString(1, id);

            // 실행
            pstmt.executeUpdate();

            // 다음 쿼리 실행을 위해 pstmt 자원 정리
            pstmt.close();
            String sql_delete_pay_info = "DELETE FROM PAY_INFO WHERE id=?";

            pstmt = conn.prepareStatement(sql_delete_pay_info);
            pstmt.setString(1, id);

            // 실행
            pstmt.executeUpdate();

            // 다음 쿼리 실행을 위해 pstmt 자원 정리
            pstmt.close();

            /* 해당 회원이 작성한 모든 게시글(활동 데이터) 삭제 */
            // SQL

            String sql_deleteposts = "DELETE FROM posts WHERE writer=?";

            pstmt = conn.prepareStatement(sql_deleteposts);
            pstmt.setString(1, id);

            // 실행
            pstmt.executeUpdate();

            // 다음 쿼리 실행을 위해 pstmt 자원 정리
            pstmt.close();

            /* 회원 테이블에서 회원 정보 삭제 */
            // SQL
            String sql_deletemember = "DELETE FROM member WHERE id =?";

            pstmt = conn.prepareStatement(sql_deletemember);
            pstmt.setString(1, id);

            // 실행
            int result = pstmt.executeUpdate();

            // 삭제 성공 여부
            if (result > 0) {
                conn.commit();
                isSuccess = true;
            } else {
                conn.rollback();
            }

        } catch (Exception e) {
            try {
                if (conn != null) {
                    conn.rollback(); 
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            // 자원 반납
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException e) {} }
        }

        return isSuccess;
    }
}
