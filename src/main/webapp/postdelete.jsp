<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dao.Post" %>
<%@ page import="dto.Posts" %>
<%@ include file="nav.jsp"  %>
<%
    // 인코딩 설정
    request.setCharacterEncoding("utf-8");

    // 파라미터 수신
    int post1 = Integer.parseInt(request.getParameter("post"));
    
    /* String writer = request.getParameter("writer");로 처음에 작성했다가
       계속 오류가 발생하여 AI의 도움으로 해당 코드로 수정하여 실행 */

    // DTO 및 DAO 객체 생성 및 셋팅
    Posts posts = new Posts();
    Post post = new Post();
    boolean a =post.deletePost(post1);
    if(!a){out.println("<script> alert('삭제 완료!'); window.location.href = 'http://localhost:8080/carrentproject/adminhome.jsp';</script>");      
    }else  out.println("<script> alert('삭제 실패 다시 입력해주세요'); window.location.href = 'http://localhost:8080/carrentproject/adminpostlist.jsp';</script>");

    


    // 등록 완료 후 다시 목록으로 이동
 
%>