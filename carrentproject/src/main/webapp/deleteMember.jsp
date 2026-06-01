<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Member" %>
<%@ page import="dao.RemoveMember" %>
<%@ page import="java.net.URLDecoder" %>

<html>
<head>
    <title>회원 탈퇴</title>
</head>
<body style='font-family: "Jua", sans-serif; font-weight: 100; font-style: normal;'>
<%@ include file="nav.jsp" %>
<%
    // 로그인 여부 확인 
    if (user_id == null || user_id.equals("")) {
        response.sendRedirect("login.jsp");
        return; 
    }

    RemoveMember removeMember = new RemoveMember();
    Member member = removeMember.getMemberById(user_id);

   // DB에 세션 ID에 해당하는 회원 정보가 없을 경우의 예외 처리 작업 (AI 도움)
    if (member == null) {
        out.println("<script>alert('회원 정보를 찾을 수 없습니다.'); location.href='login.jsp';</script>");
        return;
    }
%>
<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">회원 탈퇴</h1>
            <p class="fs-5">회원 탈퇴 시 모든 정보가 삭제됩니다.</p>
        </div>
    </div>
    <form action="deleteMember_process.jsp" method="post">
        <table class="table table-bordered">
            <tr>
                <th>아이디</th>
                <td><%=member.getId()%></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>********</td>
            </tr>
            <tr>
                <th>이름</th>
                <td><%=member.getName()%></td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><%=member.getPhone()%></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><%=member.getMail()%></td>
            </tr>
            <tr>
                <th>가입일</th>
                <td><%=member.getRegist_day()%></td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td><input type="password" name="password" class="form-control" required></td>
            </tr>
        </table>
        <div class="text-center mt-3">
            <button type="submit" class="btn btn-danger" onclick="return confirm('정말로 탈퇴하시겠습니까?')">회원탈퇴</button>
            <a href="mainpage.jsp" class="btn btn-secondary" onclick="return confirm('탈퇴를 취소하시겠습니까?')">취소</a>
        </div>
    </form>
</div>
</body>
</html>
