<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Member" %>
<%@ page import="dao.ModifyMember" %>
<%

    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");
    String mail = request.getParameter("mail");
    String address = request.getParameter("address");

    // DTO 객체에 세팅
    Member member = new Member();
    member.setId(id);
    member.setName(name);
    member.setPassword(password);
    member.setPhone(phone);
    member.setMail(mail);
    member.setAddress(address);

    // DAO 호출하여 회원 정보 수정 실행
    ModifyMember modifyMember = new ModifyMember();
    boolean isUpdated = modifyMember.updateMember(member);

    if (isUpdated) {
%>
        <script>
            alert("회원 정보가 성공적으로 수정되었습니다.");
            location.href = "memberInfo.jsp"; 
        </script>
<%
    } else {
%>
        <script>
            alert("수정에 실패했습니다. 다시 시도해주세요.");
            history.back();
        </script>
<%
    }
%>