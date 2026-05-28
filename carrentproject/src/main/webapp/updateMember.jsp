<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Member" %>
<%@ page import="dao.ModifyMember" %>

<%
    String sessionId = (String) session.getAttribute("sessionId");
    
    if (sessionId == null) {
        response.sendRedirect("login.jsp");
        return; 
    }

    ModifyMember modifymember = new ModifyMember();
    Member member = modifymember.getMemberById(sessionId);

    // DB에 세션 ID에 해당하는 회원 정보가 없을 경우의 예외 처리 작업 (AI 도움)
    if (member == null) {
        out.println("<script>alert('회원 정보를 찾을 수 없습니다.'); location.href='login.jsp';</script>");
        return;
    }
%>
<html>
<head>
<title>회원 정보 수정</title>
</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>
<%@ include file="nav.jsp"  %>
<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">회원 정보 수정</h1>
        </div>
    </div>
    <form action="UpdateMember_process.jsp" method="post">
        <table class="table table-bordered">
        <tr>
            <th>아이디</th>
            <%-- 아이디를 출력하면서 서버에도 아이디가 전달되지 않아서
            AI의 도움으로 type을 hidden으로 설정하고 실행하였음 --%>
            <td><%=member.getId()%> <input type="hidden" name="id" value="<%=member.getId()%>"></td>
        </tr>

        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="password" value="<%=member.getPassword()%>"></td>
        </tr>

        <tr>
            <th>이름</th>
            <td><input type="text" name="name" value="<%=member.getName()%>"></td>
            </tr>
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
            <th>전화번호</th>
            <td><input type="text" name="phone" value="<%=member.getPhone()%>"></td>
        </tr>

        <tr>
            <th>이메일</th>
            <td><input type="text" name="mail" value="<%=member.getMail()%>"></td>
        </tr>

        <tr>
            <th>주소</th>
            <td><input type="text" name="address" value="<%=member.getAddress()%>"></td>
        </tr>

        <tr>
            <th>가입일</th>
            <td><%=member.getRegist_day()%></td>
        </tr>
    </table>
    <div class="text-center mt-3">
        <button type="submit" class="btn btn-primary">수정하기</button>
        <a href="myPage.jsp" class="btn btn-primary" onclick="return confirm('회원정보를 수정하시겠습니까?')">취소</a>
    </div>
    </form>
</div>
</body>
</html>
