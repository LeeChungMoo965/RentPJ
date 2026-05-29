<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Member" %>
<%@ page import="dao.GetMember" %>

<html>
<head>
<title>회원 정보</title>
</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>
<%@ include file="nav.jsp"  %>
<%
    if (user_id == null) {
        response.sendRedirect("login.jsp");
        return; 
    }

    GetMember getmember = new GetMember();
    Member member = getmember.selectMember(user_id);

    // DB에 세션 ID에 해당하는 회원 정보가 없을 경우의 예외 처리 작업 (AI 도움)
    if (member == null) {
        out.println("<script>alert('회원 정보를 찾을 수 없습니다.'); location.href='login.jsp';</script>");
        return;
    }
%>
<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">회원 정보</h1>
        </div>
    </div>
    <table class="table table-bordered">
        <tr>
            <th>아이디</th>
            <td><%=member.getId()%></td>
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
            <th>성별</th>
            <td><%=member.getGender()%></td>
        </tr>

        <tr>
            <th>생년월일</th>
            <td><%=member.getBirth()%></td>
        </tr>

         <tr>
            <th>가입일</th>
            <td><%=member.getRegist_day()%></td>
        </tr>

    </table>

</div>

</body>
</html>
