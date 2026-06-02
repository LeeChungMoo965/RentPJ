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
<title>차량등록</title>
</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>
 
 <%@ include file="adminnav.jsp"  %>

<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <h2 class="text-center mb-4">차량등록</h2>
        <form action="processAddCar.jsp" method="post" enctype="multipart/form-data">
            <div class="md-3 row">
            <label class="col-sm-2"> 차량이름  </label>
            <div class="col-sm-3">
            <input type="text" name="carname" class="form-control">
            </div>
            </div>
            <div class="md-3 row">
            <label class="col-sm-2"> 시간당 가격  </label>
            <div class="col-sm-3">
            <input type="text" name="price" class="form-control">
            </div>
            </div>
            <div class="md-3 row">
            <label class="col-sm-2"> 탑승 인원  </label>
            <div class="col-sm-3">
            <input type="text" name="people" class="form-control">
            </div>
            </div>
             <div class="md-3 row">
            <label class="col-sm-2"> 연료  </label>
            <div class="col-sm-3">
            <input type="text" name="oil" class="form-control">
            </div>
            </div>
            <div class="md-3 row">
            <label class="col-sm-2"> 색상  </label>
            <div class="col-sm-3">
            <input type="text" name="color" class="form-control">
            </div>
            </div>
            
            <div class="md-3 row">
            <label class="col-sm-2"> 이동거리 </label>
            <div class="col-sm-3">
            <input type="text" name="distancy" class="form-control">
            </div>
            </div>
            <div class="md-3 row">
            <label class="col-sm-2"> x좌표  </label>
            <div class="col-sm-3">
            <input type="text" name="locationX" class="form-control">
            </div>
            </div>
            <div class="md-3 row">
            <label class="col-sm-2"> y좌표 </label>
            <div class="col-sm-3">
            <input type="text" name="locationY" class="form-control">
            </div>
            </div>

            <div class="md-3 row">
            <label class="col-sm-2"> 사진  </label>
            <div class="col-sm-3">
            <input type="file" name="filename">
            </div>
            </div>
            <div class="md-3 row">
            <div class="col-sm-offset-2 col-sm-10">
            <input type="submit"  class="btn btn-primary" value="등록" >
            </div>
            </div>
        </form>

    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>