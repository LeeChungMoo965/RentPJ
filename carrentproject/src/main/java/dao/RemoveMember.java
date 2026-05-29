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

        ConnectionFactory factory = new ConnectionFactory();

        boolean isSuccess = false;

        try {
            // DB 연결
            factory.setconnect();
            conn = factory.getconnect();

            // SQL
            String sql = "DELETE FROM member WHERE id=?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);

            // 실행
            int result = pstmt.executeUpdate();

            // 삭제 성공 여부
            if (result > 0) {
                isSuccess = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 자원 반납
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException e) {} }
        }

        return isSuccess;
    }
}
