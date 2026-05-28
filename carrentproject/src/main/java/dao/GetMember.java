package dao;
import java.sql.SQLException;
import dto.Member;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public class GetMember {
    /* Member 객체를 다 가져오려고 했으나 자원 공간 할당이 비효율적이라
        AI한테 방법을 물어봐서 String id만 받아오는 방식으로 변경하였음*/
    public Member selectMember(String id){
    
        // 팩토리 개체 생성
    ConnectionFactory factory = new ConnectionFactory();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // 회원 id가 없을 떄에는 Member 객체 값은 null 상태
    Member member = null;

    try {
        // 팩토리 객체를 사용하여 자원 연결
        factory.setconnect();
        conn = factory.getconnect();

        // 실행할 sql 쿼리
        String sql = "SELECT id, name, gender, birth, mail, phone, address, regist_day "
                    + "FROM member " 
                    + "WHERE id = ?";

        // 쿼리를 안전하게 실행하기 위해 PreparedStatement 객체 생성
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, id);

        // SQL문 실행 후, ResultSet을 통해 데이터 읽기
        rs = pstmt.executeQuery();

        if(rs.next()) {
            // 회원 id 존재 시 Member 객체 생성
            member = new Member();
            member.setId(rs.getString("id"));
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
        // 자원 최종 반납
        if (rs != null) { try { rs.close(); } catch (SQLException e) {} }
        if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} }
        if (conn != null) { try { conn.close(); } catch (SQLException e) {} }
    }
    
    // 회원 정보 조회가 성공하면 member 객체, 없다면 null를 반환
    return member;
    }
}
