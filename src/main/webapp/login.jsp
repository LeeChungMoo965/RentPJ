<%@ page contentType="text/html; charset=utf-8"  pageEncoding="UTF-8" %>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
      rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>로그인</title>
</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>
<%@ include file="nav.jsp"  %>
<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">로그인</h1>
            <p class="col-md-8 fs-4">Login</P>
            
            <div class="row justify-content-center align-items-center">
                <%
                String error=request.getParameter("error");
                if (error!=null) {
                    out.println("<div class='alert alert-danger'>");
                    out.println("아이디와 비밀번호를 확인해 주세요");
                    out.println("</div>");
                }
                %>
                <form action="login_process.jsp" method="post">
                    <div class="mb-4">
                        <label class="form-label">아이디</label>
                        <input type="text" name="id" class="form-control form-control-lg rounded-3" placeholder="아이디를 입력하세요">
                    </div>

                    <div class="mb-4">
                        <label class="form-label">비밀번호</label>
                        <input type="password" name="password" class="form-control form-control-lg rounded-3" placeholder="비밀번호 입력">
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg rounded-3">로그인</button>
                    </div>
                </form>

                <div class="text-center mt-4">
                    계정이 없으신가요?
                    <a href="signup.jsp" class="text-decoration-none">회원가입</a>
                    <%@ include file="loginkakao.jsp" %>
                </div>
                
            </div>
        </div> 
    </div>         
</div>

<%@ include file="footer.jsp" %>

</body>
</html>