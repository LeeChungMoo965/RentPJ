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
    member.setMail(request.getParameter("mail"));
    member.setAddress(request.getParameter("address"));
    
    AddMember addmember = new AddMember();

    // DB에 중복된 아이디 여부를 체크
    boolean isDuplicate = addmember.checkIdDuplicate(member.getId());

    if (isDuplicate) {
        // 아이디가 이미 존재하는 경우 -> 회원가입 진행 실패
        out.println("<script>");
        out.println("alert('이미 존재하는 아이디입니다. 다른 아이디를 입력해주세요.');");
        out.println("history.back();");
        out.println("</script>");
    } else {
        // 아이디가 중복되지 않은 경우 -> 회원가입 진행
        boolean isSuccess = addmember.insertMember(member); 

        if (isSuccess) {
            out.println("<script>");
            out.println("alert('회원가입이 완료되었습니다.');");
            out.println("location.href='login.jsp';");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('회원가입에 실패했습니다. 다시 시도해주세요.');");
            out.println("history.back();");
            out.println("</script>");
        }
    }
%>