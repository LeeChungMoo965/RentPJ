<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="jakarta.servlet.http.*"%>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<title>도서등록</title>
</head>
<body>
<div>
    <%
                request.setCharacterEncoding("UTF-8");
                int carid = Integer.parseInt(request.getParameter("carid"));

                Admin admin = new Admin();


                if(!admin.deleteCar(carid)){
                   out.println("<script> alert('삭제 완료!'); window.location.href = 'http://localhost:8080/carrentproject/adminhome.jsp';</script>");      
                }else{out.println("<script> alert('삭제 실패 다시 입력해주세요'); window.location.href = 'http://localhost:8080/carrentproject/deletecar.jsp';</script>");
                }           
        %>
</div>
</body>
</html>
