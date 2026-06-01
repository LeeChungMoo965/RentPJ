<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="dao.ConnectionFactory" %>
<%@ page import="dto.Reservation" %>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>


<html>
<head>
<title>나의 예약 내역 및 상세 조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>


<%@ include file="adminnav.jsp" %>
<%
    

    

    Admin admin = new Admin();
    admin.getListofCars(); 
    Admin adminsub = new Admin();

    ArrayList<Reservation> res = adminsub.getListofRess(); 
    


%>
<div class="container py-4">


    <div class="card shadow-sm rounded-3">
        <div class="card-body">
            
                <table class="table table-hover align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>예약 신청일</th>
                            <th>id</th>
                            <th>차량 정보</th>
                            <th>대여 시작일시</th>
                            <th>반납 예정일시</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int index = 0; // Collapse ID 구분을 위한 인덱스 변수
                              
                            for (int i=0; i < res.size(); i++){
                                Reservation newres = res.get(i);
                                String id = newres.getId();
                                Car carInfo = admin.getCarById(newres.getCarid());
                            
                        %>
                        <tr>
                            <td><%= newres.getRegist_day() %></td>
                            <td><%= newres.getId() %></td>
                            <td>
                                <small class="text-primary-emphasis">차량코드: <%= newres.getCarid() %></small>
                            </td>
                            <td><%= newres.getStarttime() %></td>
                            <td><%= newres.getEndtime() %></td>
                        </tr>
                   
            <%
                }
            %>
             </tbody>
                </table>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>