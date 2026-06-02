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
                // 1. 인코딩 설정
                request.setCharacterEncoding("UTF-8");
                // 2. 파일 저장 경로 설정 (프로젝트 내 resources/images 폴더)
                String realFolder = request.getServletContext().getRealPath("./img");
                
                // 폴더가 없으면 생성
                File dir = new File(realFolder);
                if (!dir.exists()) {
                        dir.mkdirs();
                }

                request.setCharacterEncoding("utf-8");
                String price1 = request.getParameter("price");
                String carname = request.getParameter("carname");
                String oil = request.getParameter("oil");
                String people1 = request.getParameter("people");
                String color = request.getParameter("color");
                String distancy1 = request.getParameter("distancy");
                String locationX = request.getParameter("locationX");
                String locationY = request.getParameter("locationY");


                int price = Integer.parseInt(price1);
                int people = Integer.parseInt(people1);
                int distancy = Integer.parseInt(distancy1);
                String fileName = "";
                Part part = request.getPart("filename");

                
                if (part != null && part.getSubmittedFileName() != null && 
                !part.getSubmittedFileName().isEmpty()) {
                        fileName = part.getSubmittedFileName();
                        // 파일 중복 방지를 위한 간단한 처리 (필요시 날짜나 UUID 추가)
                        part.write(realFolder + File.separator + fileName);
                }

                Admin admin = new Admin();

                Car newcar = new Car();
                
                newcar.setFileName(fileName);
                newcar.setCarname(carname);
                newcar.setCarprice(price);
                newcar.setOil(oil);
                newcar.setPeople(people);
                newcar.setColor(color);
                newcar.setDistancy(distancy);
                newcar.setLocationX(locationX);
                newcar.setLocationY(locationY);
                boolean is = admin.addCar(newcar);
                if(is){
                   out.println("<script> alert('등록 완료!'); window.location.href = 'http://localhost:8080/carrentproject/adminhome.jsp';</script>");      
                }else  out.println("<script> alert('등록 실패 다시 입력해주세요'); window.location.href = 'http://localhost:8080/carrentproject/addcar.jsp';</script>");
        %>
        </div>
</body>
</html>
