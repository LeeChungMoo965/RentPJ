<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
      rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>회원가입</title>
</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>
<%@ include file="nav.jsp"  %>
<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <h2 class="text-center mb-4">회원가입</h2>
        <form name= "signup" action="signup_process.jsp" method="post">
            <div class="mb-4">
                <label class="form-label">아이디</label>
                <input type="text" id="id" name="id" class="form-control form-control-lg rounded-3" placeholder="아이디를 입력하세요" required>
            </div>

            <div class="mb-4">
                <label class="form-label">비밀번호</label>
                <input type="password" id="password" name="password" class="form-control form-control-lg rounded-3" placeholder="비밀번호를 입력하세요" required>
            </div>

            <div class="mb-4">
                <label class="form-label">이름</label>
                <input type="text" id="name" name="name" class="form-control form-control-lg rounded-3" placeholder="홍길동" required>
            </div>

            <div class="mb-4">
                <label class="form-label">성별</label>
                <!--bootstrap 체크박스 인라인 활용-->
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="남자">
                    <label class="form-check-label">남자</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="여자">
                    <label class="form-check-label">여자</label>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">생년월일</label>
                <input type="date" name="birth" class="form-control form-control-lg rounded-3" required>
            </div>

            <div class="mb-4">
                <label class="form-label">전화번호</label>
                <input type="text" id="phone" name="phone" class="form-control form-control-lg rounded-3" placeholder="010-1234-5678" required>
            </div>

            <div class="mb-4">
                <label class="form-label">이메일</label>
                <input type="email" id="mail" name="mail" class="form-control form-control-lg rounded-3" placeholder="example@email.com" required>
            </div>

            <div class="mb-4">
                <label class="form-label">주소</label>
                <input type="text" id="address" name="address" class="form-control form-control-lg rounded-3" placeholder="주소를 입력해주세요" required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary btn-lg rounded-3" onclick="checkSignup()">회원가입</button>
            </div>
        </form>

        <div class="text-center mt-4">
            이미 계정이 있으신가요?
            <a href="login.jsp" class="text-decoration-none">로그인</a>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
