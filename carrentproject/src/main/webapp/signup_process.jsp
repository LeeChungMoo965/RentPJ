<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Member" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");

    Member member = new Member();

    // Member 객체에 값 저장
    member.setId(request.getParameter("id"));
    member.setPassword(request.getParameter("password"));
    member.setName(request.getParameter("name"));
    member.setGender(request.getParameter("gender"));
    member.setBirth(request.getParameter("birth"));
    member.setPhone(request.getParameter("phone"));
    member.setEmail(request.getParameter("email"));
    member.setAddress(request.getParameter("address"));
    
    PreparedStatement pstmt = null;

    try {
        String sql = "INSERT INTO member VALUES(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";

        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, member.getId());
        pstmt.setString(2, member.getPassword());
        pstmt.setString(3, member.getName());
        pstmt.setString(4, member.getGender());
        pstmt.setString(5, member.getBirth());
        pstmt.setString(6, member.getPhone());
        pstmt.setString(7, member.getEmail());
        pstmt.setString(8, member.getAddress());

        pstmt.executeUpdate();

        // 회원가입 성공 코드 중에 3번째 줄 코드 AI 도움
        out.println("<script>");
        out.println("alert('회원가입이 완료되었습니다.');");
        out.println("location.href='login.jsp';");
        out.println("</script>");

    } catch (Exception e) {
        e.printStackTrace();

        // // 회원가입 실패 코드 중에 3번째 줄 코드 AI 도움
        out.println("<script>");
        out.println("alert('회원가입 실패');");
        out.println("history.back();");
        out.println("</script>");
    } finally {
        // 자원 최종 반납
        if (pstmt != null) { try { pstmt.close(); } catch (SQLException e) {} }
        if (conn != null) { try { conn.close(); } catch (SQLException e) {} }
    }
%>
