<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dao.Post" %>
<%@ page import="dto.Posts" %>
<%@ include file="nav.jsp"  %>
<%
    // 인코딩 설정
    request.setCharacterEncoding("utf-8");

    // 파라미터 수신
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    /* String writer = request.getParameter("writer");로 처음에 작성했다가
       계속 오류가 발생하여 AI의 도움으로 해당 코드로 수정하여 실행 */
    String writer =user_id;

    if(user_id == null){

    response.sendRedirect("login.jsp");
    return;
    }

    // DTO 및 DAO 객체 생성 및 셋팅
    Posts posts = new Posts();
    Post post = new Post();

    posts.setTitle(title);
    posts.setContent(content);
    posts.setWriter(writer);

    // DB Insert 수행
    post.insert(posts);

    // 등록 완료 후 다시 목록으로 이동
    response.sendRedirect("postlist.jsp");
%>