<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.Post" %>
<%@ page import="dto.Posts" %>

<%
    Post post = new Post();
    List<Posts> list = post.findAll();
%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
      rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>게시판</title>
</head>

<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>
<%@ include file="nav.jsp"  %>
    <div class="container py-4">
        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <h2 class="text-center mb-4">목록 조회</h2>
  
            <table class="table table-striped table-bordered text-center">
                <thead class="table-dark">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>삭제하기</th>
                    </tr>
                </thead>
                <tbody>
                <%
                if(list != null) {
                    for(Posts posts : list) { 
                %>
                    <tr>
                        <td><%= posts.getPostId() %></td>
                        <td class="text-start">
                            <a href="postdetail.jsp?postId=<%= posts.getPostId() %>" style="text-decoration:none;">
                                <%= posts.getTitle() %>
                            </a>
                        </td>
                        <td><%= posts.getWriter() %></td>
                        <td><%= posts.getCreatedDate() %></td>
                        <td><a href="postdelete.jsp?post=<%=posts.getPostId()%>" class="btn btn-success">삭제하기</a></td>
                    </tr>
                <%
                    }
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>