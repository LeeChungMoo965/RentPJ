package dao;

import dto.Posts;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Post {

    // 팩토리 개체 생성
    ConnectionFactory factory = new ConnectionFactory();

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    public List<Posts> findAll() {

        List<Posts> list = new ArrayList<>();

        try {

            // 팩토리 객체를 사용하여 자원 연결
            factory.setconnect();
            conn = factory.getconnect();

            String sql = "SELECT * " + "FROM posts " + "ORDER BY post_id DESC"; 
           
            // 쿼리를 안전하게 실행하기 위해 PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql);

            // SQL문 실행 후, ResultSet을 통해 데이터 읽기
            rs = pstmt.executeQuery();

            while(rs.next()) {
                // 회원 id 존재 시 Member 객체 생성
                Posts posts = new Posts();
                posts.setPostId(rs.getInt("post_id"));
                posts.setTitle(rs.getString("title"));
                posts.setContent(rs.getString("content"));
                posts.setWriter(rs.getString("writer"));
                posts.setCreatedDate(rs.getDate("created_date"));
                posts.setUpdatedDate(rs.getDate("updated_date"));

                // 리스트에 추가 
                list.add(posts);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 자원 최종 반납
            if (rs != null) { try { rs.close(); } catch (SQLException e) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException e) {} }
        }
        return list;
    }

    // 게시글 상세조회
    public Posts findById(int postId) {

        Posts posts = null;

        try{
            // 팩토리 객체를 사용하여 자원 연결
            factory.setconnect();
            conn = factory.getconnect();

            // 실행할 sql 쿼리
            String sql = "SELECT * FROM posts WHERE post_id = ?";

            // 쿼리를 안전하게 실행하기 위해 PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, postId);

            // SQL문 실행 후, ResultSet을 통해 데이터 읽기
            rs = pstmt.executeQuery();

            if(rs.next()) {
                posts = new Posts();

                posts.setPostId(rs.getInt("post_id"));
                posts.setTitle(rs.getString("title"));
                posts.setContent(rs.getString("content"));
                posts.setWriter(rs.getString("writer"));
                posts.setCreatedDate(rs.getDate("created_date"));
                posts.setUpdatedDate(rs.getDate("updated_date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 자원 최종 반납
            if (rs != null) { try { rs.close(); } catch (SQLException e) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException e) {} }
        }
        
        // 회원 정보 조회가 성공하면 posts 객체, 없다면 null를 반환
        return posts;
    }

    // 게시글 작성 
    public int insert(Posts posts) 
    { 
        int result = 0; 
        
        try { 
            // DB 연결 
            factory.setconnect(); 
            conn = factory.getconnect(); 
            
            // 실행할 SQL 쿼리 
            String sql = "INSERT INTO posts (title, content, writer, created_date) " 
                        + "VALUES (?, ?, ?, SYSDATE)"; 
            
            pstmt = conn.prepareStatement(sql); 
            pstmt.setString(1, posts.getTitle()); 
            pstmt.setString(2, posts.getContent()); 
            pstmt.setString(3, posts.getWriter()); 
            
            // SQL 실행 
            result = pstmt.executeUpdate(); 
        } catch (Exception e) { 
            e.printStackTrace(); 
        } finally { 
            
            // 자원 반납 
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} } 
            if (conn != null) { try { conn.close(); } catch (SQLException e) {} } 
        } 
        return result; 
    }
}
