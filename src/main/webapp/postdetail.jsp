<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dao.Post" %>
<%@ page import="dto.Posts" %>

<%
    String id_value = request.getParameter("postId");
    Posts posts = null;

    // URL 파라미터로 넘어온 postId 값이 존재하는지 안전하게 검사 (AI 도움)
    if(id_value != null && !id_value.trim().isEmpty()) {
        int postId = Integer.parseInt(id_value);
        Post post = new Post();
        posts = post.findById(postId);
    }
%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bundle.min.js"></script>
    <title>게시판 - 상세조회</title>
</head>
<body style='font-family: "Jua", sans-serif; font-weight: 100; font-style: normal;'>
<%@ include file="nav.jsp"  %>
    <div class="container py-4">
        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <h2 class="mb-4">상세조회</h2>
            <% if(posts != null) { %>
                <div class="card p-4">
                    <h3>제목 : <%= posts.getTitle() %></h3>
                    <p class="text-body-emphasis">작성자: <%= posts.getWriter() %> | 작성일: <%= posts.getCreatedDate() %></p>
                    <hr>
                    <div style="min-height: 200px; white-space: pre-wrap;"><%= posts.getContent() %></div>
                </div>
            <% } else { %>
                <p>존재하지 않거나 삭제된 게시글입니다.</p>
            <% } %>
            <div class="mt-4">
                <a href="postlist.jsp" class="btn btn-secondary">목록으로</a>
            </div>
        </div>
    </div>
<%@ include file="footer.jsp" %>
</body>
</html>