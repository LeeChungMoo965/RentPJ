<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLClassLoader" %>
<html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<title>Main_Page</title>

</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>
<div class="container py-4">
   
    <%@ include file="adminnav.jsp"  %>



    
<div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="./img/car1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="./img/car2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="./img/car3.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<%@ include file="footer.jsp"  %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
