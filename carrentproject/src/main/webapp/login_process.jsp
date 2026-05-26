<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dao.Login" %> 
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String password = request.getParameter("password");

    // 자바 클래스(DAO) 객체 생성 후 메소드 호출
    Login login = new Login();
    boolean isloginSuccess = login.checkLogin(id, password);

    if (isloginSuccess) {
        // 로그인 성공
        session.setAttribute("sessionId", id);
        response.sendRedirect("mainpage.jsp");
    } else {
        // 로그인 실패
        out.println("<script>");
        out.println("alert('아이디 또는 비밀번호가 틀렸습니다.');");
        out.println("location.href='login.jsp';");
        out.println("</script>");
    }
%>
