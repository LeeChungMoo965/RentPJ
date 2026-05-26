<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");

    // 파라미터 받기 
    String id = request.getParameter("id"); 
    String password = request.getParameter("password");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT * FROM member WHERE id=? AND password=?";

        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, id);
        pstmt.setString(2, password);

        rs = pstmt.executeQuery();

        if(rs.next()){
            session.setAttribute("sessionId", id);
            response.sendRedirect("mainpage.jsp");
        }else{
            out.println("<script>");
            out.println("alert('아이디 또는 비밀번호가 틀렸습니다.');");
            out.println("location.href='login.jsp';");
            out.println("</script>");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 자원 최종 반납
        if (rs != null) { try { rs.close(); } catch (SQLException e) {} }
        if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} }
        if (conn != null) { try { conn.close(); } catch (SQLException e) {} }
    }
%>
