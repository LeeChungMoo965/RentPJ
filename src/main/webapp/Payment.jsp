<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="jakarta.servlet.http.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLClassLoader" %>
<%@ page import="java.net.URLDecoder" %>
<html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<title>Payment</title>

</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>
<div class="container py-4">
    
    <%@ include file="nav.jsp"  %>
     <%
    if(user_id == ""){
        out.println("<script> alert('로그인 후 사용 가능'); window.location.href = 'http://localhost:8080/carrentproject/login.jsp';</script>");
    }
    Login log = new Login();
    Member mem = new Member();
    mem = log.getUserById(user_id);
    
    String name = mem.getName();
    String phone = mem.getPhone();
    Admin admin = new Admin();
    admin.getListofCars();
    int carid = Integer.parseInt(request.getParameter("carid"));
    Car car = admin.getCarById(carid); 
    String carname = car.getCarname();
    int carprice  = car.getCarprice();
    int people = car.getPeople();
    String oil = car.getOil();
    int distancy = car.getDistancy();
    String fileName = car.getFileName();
    try{
    String day1 = request.getParameter("day1");
    String day2 = request.getParameter("day2");
    
    String[] day11 = day1.split("-");
    String[] day22 = day2.split("-");
    int a = 0;
   
    if(day11[1].equals("01") || day11[1].equals("03") || day11[1].equals("05") || day11[1].equals("07") || day11[1].equals("08") || day11[1].equals("10") || day11[1].equals("12") ){ 
        a = 31;
    }else if(day11[1].equals("04") || day11[1].equals("06") || day11[1].equals("09") || day11[1].equals("11")){
        a = 30;
    }else{a=28;}
    double day = ((Double.parseDouble(day22[0]) - Double.parseDouble(day11[0])) * 365 * 24) + ((Double.parseDouble(day22[1]) - Double.parseDouble(day11[1])) * a * 24) + ((Double.parseDouble(day22[2]) - Double.parseDouble(day11[2])) * 24)  + (Double.parseDouble(day22[3]) - Double.parseDouble(day11[3])) + ((Double.parseDouble(day22[4]) - Double.parseDouble(day11[4])) / 60) ;
    double total_price = day * (double) carprice;
    
    
        %>

    

<div style="padding : 4rem">
<table style="padding : 4rem" width="90%">
<tr>
<td align="left" >
<table>
<tr>
<td>
<img width="300px"  src="./img/<%=fileName%>" class="srounded" >
</td>
</tr>
<tr>
<table class="table table-hover align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>차량 종류</th>
                            <th>탑승 인원</th>
                            <th>연료</th>
                            <th>이동 거리</th>
                        </tr>
                        </thead>
                        <tr>
                        <td><%=carname%></td>
                        <td><%=people%></td>
                        <td><%=oil%></td>
                        <td><%=distancy%></td>
                        </tr>
                        </table>

</td>


<td align="right"  >

<div style="margin-top : 10%">
<table class="table table-hover align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>대여 시작 시간</th>
                            <th>반납 시간</th>
                        </tr>
                        </thead>
                        <tr>
                        <td><%=day1%></td>
                        <td><%=day2%></td>
                        </tr>
                        </table>
</div>
<div style="margin-top : 3rem" width="200px" height="40%">
<label>차량위치</lable>
<%@ include file="Maps.jsp"  %>
</div>
</td>
</tr>
<tr>
<th>
<h3>총 결제 금액: <%=total_price%> 원
</th>
</tr>
</table>
</div>
<div>
<%@ include file="checkout.jsp"  %>
</div>
<%@ include file="footer.jsp"  %>
</div>
</body>
 <%
}catch(Exception e){
        out.println("<script> alert('날짜 미입력'); window.location.href = 'http://localhost:8080/carrentproject/home.jsp';</script>");
    }
    %>
</html>
