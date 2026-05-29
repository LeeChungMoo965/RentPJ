<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>게시판</title>
</head>
<body style='font-family: "Jua", sans-serif; font-weight: 100; font-style: normal;'>
    <%@ include file="nav.jsp"  %>
    <%
    if (user_id == null) {
        out.println("<script>");
        out.println("alert('로그인이 필요합니다.');");
        out.println("location.href='login.jsp';");
        out.println("</script>");
        return; 
    }
%>
    <div class="container py-4">
        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <h2 class="text-center mb-4">글쓰기</h2>
            
            <form action="postwrite_process.jsp" method="post">
                <div class="mb-3">
                    <label class="form-label">제목</label>
                    <input type="text" name="title" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">작성자</label>
                    <input type="text" name="writer" value="<%=user_id%>"class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">내용</label>
                    <textarea name="content" rows="10" class="form-control"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">등록</button>
                <a href="postlist.jsp" class="btn btn-secondary">목록으로</a>
            </form>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>