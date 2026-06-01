<%@ page contentType="text/html; charset=utf-8" %>

<%
    // 세션 삭제
    session.invalidate();

    // 쿠키 삭제
    Cookie cookie = new Cookie("userCookieId", "");
    cookie.setMaxAge(0);
    cookie.setPath("/");

    response.addCookie(cookie);
%>

<script>
    alert("로그아웃이 성공하였습니다.");
    location.href="mainpage.jsp";
</script>
