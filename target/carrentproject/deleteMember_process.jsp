<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Member" %>
<%@ page import="dao.RemoveMember" %>
<%@ include file="nav.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String password = request.getParameter("password");

// nav.jsp의 isLogin 변수로 로그인 체크

RemoveMember removeMember = new RemoveMember();

// ❌ 기존: removeMember.getMemberById(id); -> id 변수가 없음 에러!
//  개선: nav.jsp에서 찾아놓은 'user_id' 변수를 사용합니다.
Member member = removeMember.getMemberById(user_id);

// 회원 존재 여부 확인
if(member == null){
%>
    <script>
        alert("회원 정보를 찾을 수 없습니다.");
        location.href="signup.jsp";
    </script>
<%
return;
}

// 비밀번호 확인
if (member.getPassword() == null || !member.getPassword().equals(password)){
%>
<script>
    alert("비밀번호가 일치하지 않습니다.");
    history.back();
</script>
<%
return;
}

// ❌ 기존: removeMember.deleteMember(id); -> 에러 발생 지점
//  개선: 'user_id' 변수로 교체
boolean isDeleted = removeMember.deleteMember(user_id);

if(isDeleted){
    // 탈퇴 성공 시 브라우저에 남아있는 로그인 쿠키 만료(삭제) 처리
    Cookie killCookie = new Cookie("userCookieId", null);
    killCookie.setMaxAge(0); 
    killCookie.setPath("/"); 
    response.addCookie(killCookie);
%>
<script>
    alert("회원 탈퇴가 완료되었습니다.");
    location.href="home.jsp";
</script>
<%
} else {
%>
<script>
    alert("회원 탈퇴에 실패했습니다.");
    history.back();
</script>
<%
}
%>