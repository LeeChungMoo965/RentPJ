<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Member" %>
<%@ page import="dao.RemoveMember" %>
<%@ include file="nav.jsp"  %>

<%
request.setCharacterEncoding("utf-8");

/* Member 객체의 id값을 가져와 회원탈퇴 코드 실행했을 때 탈퇴하기를 수행한 결과 
자꾸 회원의 정보가 없다는 팝업창이 뜨면서 탈퇴가 이루어지지 않아 해당 부분을
AI의 도움을 받아 섹션에 저장된 아이디를 가져오는 형태로 코드르 작성함*/
String id = (String)session.getAttribute("user_id");
String password = request.getParameter("password");

// 로그인 여부 확인
if(id == null){
%>
    <script>
    alert("로그인 정보가 없습니다.");
    location.href="login.jsp";
    </script>
<%
return;
}

RemoveMember removeMember = new RemoveMember();

Member member = removeMember.getMemberById(id);

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
if(!member.getPassword().equals(password)){

%>

<script>
    alert("비밀번호가 일치하지 않습니다.");
    history.back();
</script>

<%
return;
}

// 회원 삭제 실행
boolean isDeleted = removeMember.deleteMember(id);

if(isDeleted){
    session.invalidate();
%>

<script>
    alert("회원 탈퇴가 완료되었습니다.");
    location.href="mainpage.jsp";
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
