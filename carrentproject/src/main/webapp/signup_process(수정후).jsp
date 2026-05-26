<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Member" %>
<%@ page import="dao.AddMember" %>

<%
    request.setCharacterEncoding("UTF-8");

    Member member = new Member();
    member.setId(request.getParameter("id"));
    member.setPassword(request.getParameter("password"));
    member.setName(request.getParameter("name"));
    member.setGender(request.getParameter("gender"));
    member.setBirth(request.getParameter("birth"));
    member.setPhone(request.getParameter("phone"));
    member.setEmail(request.getParameter("email"));
    member.setAddress(request.getParameter("address"));
    
    AddMember addmember = new AddMember();
    boolean isSuccess = addmember.insertMember(member); 

    if (isSuccess) {
        out.println("<script>");
        out.println("alert('회원가입이 완료되었습니다.');");
        out.println("location.href='login.jsp';");
        out.println("</script>");
    } else {
        out.println("<script>");
        out.println("alert('회원가입 실패');");
        out.println("history.back();");
        out.println("</script>");
    }
%>
