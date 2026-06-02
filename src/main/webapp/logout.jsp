<%@ page contentType="text/html; charset=utf-8" %>

<%
    // 세션 삭제
    session.invalidate();

    // 쿠키 삭제
    Cookie cookie = new Cookie("userCookieId", "");
    cookie.setMaxAge(0);
    cookie.setPath("/");

    response.addCookie(cookie);

    // 메인페이지 이동
    response.sendRedirect("home.jsp");
%>