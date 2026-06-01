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
<title>마이페이지</title>
</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>
<%@ include file="nav.jsp"  %>
<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <%
            String sessionId = (String) session.getAttribute("sessionId");
            
            if (sessionId == null) {
                response.sendRedirect("login.jsp");
                return; 
            }
        %>

        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">마이페이지</h1>
            <p class="fs-4"> <%=sessionId%> 님 환영합니다.</p>
        </div>
    </div>
    <div class="row text-center">
        <div class="col-md-3 mb-3">
            <div class="card p-4">
                <h5>회원 정보</h5>
                <a href="memberInfo.jsp" class="btn btn-dark mt-3">조회하기</a>
            </div>
        </div>
        <div class="col-md-3 mb-3">
            <div class="card p-4">
                <h5>회원 정보 수정</h5>
                <a href="updateMember.jsp" class="btn btn-dark mt-3">수정하기</a>
            </div>
        </div>
        <div class="col-md-3 mb-3">
            <div class="card p-4">
                <h5>예약 내역</h5>
                <a href="reservationList.jsp" class="btn btn-dark mt-3">조회하기</a>
            </div>
        </div>
        <div class="col-md-3 mb-3">
            <div class="card p-4">
                <h5>회원 탈퇴</h5>
                <a href="deleteMember.jsp" class="btn btn-dark mt-3">탈퇴하기</a>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>