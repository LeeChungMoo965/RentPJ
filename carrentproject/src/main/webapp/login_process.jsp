<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dao.Login" %> 
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String saveID = request.getParameter("saveID");

    // 자바 클래스(DAO) 객체 생성 후 메소드 호출
    Login login = new Login();
    boolean isloginSuccess = login.checkLogin(id, password);

    if (isloginSuccess) {
        // 로그인 성공
        session.setAttribute("sessionId", id);

        Cookie cookie = new Cookie("userCookieId", id);
        cookie.setMaxAge(60 * 60);  // 쿠키 유효 기간: 1시간 (초 단위)
        cookie.setPath("/");
        response.addCookie(cookie); // 브라우저로 쿠키 전송
        
        response.sendRedirect("mainpage.jsp");
    } else {
        // 로그인 실패
        out.println("<script>");
        out.println("alert('아이디 또는 비밀번호가 틀렸습니다.');");
        out.println("location.href='login.jsp';");
        out.println("</script>");
    }
%>
