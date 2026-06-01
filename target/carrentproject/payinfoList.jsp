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

<title>결제 내역</title>
</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>


<%@ include file="adminnav.jsp" %>
<%
  
    
    Admin adminsub = new Admin();


    ArrayList<PayInfo> pays = adminsub.getListofPays(); 

    ArrayList<Reservation> res = adminsub.getListofRess(); 


%>
<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <h2 class="fw-bold">결제 내역</h2>
    </div>

    <div class="card shadow-sm rounded-3">
        <div class="card-body">
            
 
                <table class="table table-hover align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>결제 넘버</th>
                            <th>id</th>
                            <th>carid</th>
                            <th>releasDate</th>
                            <th>total_price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int index = 0; // Collapse ID 구분을 위한 인덱스 변수
                              
                            for (int i=0; i < pays.size(); i++){
                                PayInfo pay = pays.get(i);
                                String id = pay.getId();
                        %>
                        <tr>
                            <td><%= pay.getPay_number() %></td>
                            <td><%= pay.getId() %></td>
                            
                            <td>
                                <small class="text-primary-emphasis">차량코드: <%= pay.getCarid() %></small>
                            </td>
                            <td><%= pay.getReleasDate() %></td>
                            <td><%= pay.getTotal_price() %></td>
                      
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