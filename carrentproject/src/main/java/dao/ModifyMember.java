package dao;
import java.sql.SQLException;
import dto.Member;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public class ModifyMember {

    // 팩토리 개체 생성
    ConnectionFactory factory = new ConnectionFactory();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Member member = null;

    // 회원 정보 수정하기 전 기본 정보 출력
    public Member getMemberById(String id) {
        try {
            factory.setconnect();
            conn = factory.getconnect();

            String sql = "SELECT id, password, name, gender, birth, mail, phone, address, regist_day "
                       + "FROM member WHERE id = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                member = new Member();
                member.setId(rs.getString("id"));
                member.setPassword(rs.getString("password"));
                member.setName(rs.getString("name"));
                member.setGender(rs.getString("gender"));
                member.setBirth(rs.getString("birth"));
                member.setMail(rs.getString("mail")); 
                member.setPhone(rs.getString("phone"));
                member.setAddress(rs.getString("address"));
                member.setRegist_day(rs.getString("regist_day"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) { try { rs.close(); } catch (SQLException e) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException e) {} }
        }
        return member;
    }

    public boolean updateMember(Member member){
    
    boolean isSuccess = false;

    try {
        // 팩토리 객체를 사용하여 자원 연결
        factory.setconnect();
        conn = factory.getconnect();

        // 실행할 sql 쿼리
        String sql = "UPDATE member SET name=?, password=?, mail=?, phone=?, address=? "
                    + "WHERE id=?";

        // 쿼리를 안전하게 실행하기 위해 PreparedStatement 객체 생성
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, member.getName());
        pstmt.setString(2, member.getPassword());
        pstmt.setString(3, member.getMail());
        pstmt.setString(4, member.getPhone());
        pstmt.setString(5, member.getAddress());
        pstmt.setString(6, member.getId());
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
        if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} }
        if (conn != null) { try { conn.close(); } catch (SQLException e) {} }
    }
    // 최종 결과 반환 (성공 true, 실패 false)
    return isSuccess;
    }
}
