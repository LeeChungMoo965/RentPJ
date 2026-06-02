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
<title>회원가입</title>
</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>
 <%@ include file="adminnav.jsp"  %>
<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <h2 class="text-center mb-4">차량삭제</h2>
        <form action="processDeleteCar.jsp" method="post">
            <div class="md-3 row">
            <label class="col-sm-2"> 차량id  </label>
            <div class="col-sm-3">
            <input type="text" name="carid" class="form-control">
            </div>
            </div>
        </form>

    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>