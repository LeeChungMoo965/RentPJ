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
<%@ page import="java.net.URLClassLoader" %>
<%@ page import="java.net.URLDecoder" %>


<html>
<head>
<title>나의 예약 내역 및 상세 조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>


<%@ include file="nav.jsp" %>
<%
    

    if(user_id == null) {
        response.sendRedirect("login.jsp");
        return;
    }


    Admin admin = new Admin();
    admin.getListofCars(); 
    Admin adminsub = new Admin();

    ArrayList<Reservation> res = adminsub.getListofRess(); 
    


%>
<div class="container py-4">

<div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <h2 class="fw-bold"><%= user_id %>님의 예약 확인 및 상세조회</h2>
        <p class="text-primary-emphasis">상세보기를 클릭하시면 차량의 모든 세부 정보를 확인할 수 있습니다.</p>
    </div>
    <div class="card shadow-sm rounded-3">
        <div class="card-body">
            
                <table class="table table-hover align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>No.</th>
                            <th>예약 신청일</th>
                            <th>id</th>
                            <th>차량 정보</th>
                            <th>대여 시작일시</th>
                            <th>반납 예정일시</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int index = 0; // Collapse ID 구분을 위한 인덱스 변수
                              
                            for (int i=0; i < res.size(); i++){
                                Reservation newres = res.get(i);
                                String id = newres.getId();
                                Car carInfo = admin.getCarById(newres.getCarid());
                                if(id.equals(user_id)){
                        %>
                        <tr>
                            <td><%= newres.getRes_num() %></td>
                            <td><%= newres.getRegist_day() %></td>
                            <td><%= newres.getId() %></td>
                            <td>
                                <small class="text-primary-emphasis">차량코드: <%= newres.getCarid() %></small>
                            </td>
                            <td><%= newres.getStarttime() %></td>
                            <td><%= newres.getEndtime() %></td>
                             <td>
                                <button class="btn btn-sm btn-outline-secondary" type="button" 
                                        data-bs-toggle="collapse" data-bs-target="#carDetail<%= newres.getRes_num() %>" 
                                        aria-expanded="false">
                                    ▼ 상세 데이터 보기
                                </button>
                            </td>
                        </tr>
                        <tr class="collapse" id="carDetail<%=  newres.getRes_num()%>">
                            <td colspan="6" class="bg-light p-4 text-start">
                                <div class="card card-body shadow-sm border-0">

                                    
                                    <% if (carInfo != null) { %>
                                        <div class="row g-3">
                                            <div class="col-md-4 text-center">
                                                <img src="./resources/images/<%= carInfo.getFileName() %>" class="img-fluid rounded border shadow-sm" style="max-height: 200px; object-fit: contain;">
                                                <div class="mt-2 text-primary-emphasis small">파일명: <%= carInfo.getFileName() %></div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="row row-cols-2">
                                                    <div class="mb-2"><strong>차량 고유 ID :</strong> <span class="text-danger"><%= carInfo.getCarid() %></span></div>
                                                    <div class="mb-2"><strong>차량명 :</strong> <%= carInfo.getCarname() %></div>
                                                    <div class="mb-2"><strong>가격 :</strong> <%= carInfo.getCarprice() %> 원</div>
                                                    <div class="mb-2"><strong>탑승 제한 인원 :</strong> <%= carInfo.getPeople() %> 인승</div>
                                                    <div class="mb-2"><strong>연료 종류 :</strong> <%= carInfo.getOil() %></div>
                                                    <div class="mb-2"><strong>차량 색상 :</strong> <%= carInfo.getColor() %></div>
                                                    <div class="mb-2"><strong>주행 거리 :</strong> <%= carInfo.getDistancy() %> km</div>
                                                    <div class="mb-2"><strong>차량 등록일 :</strong> <%= carInfo.getReleasDate() %></div>
                                                    <div class="mb-2"><strong>차량 위치 (위도 X) :</strong> <%= carInfo.getLocationX() %></div>
                                                    <div class="mb-2"><strong>차량 위치 (경도 Y) :</strong> <%= carInfo.getLocationY() %></div>
                                                    <div class="mb-2"><strong>대여 시작시간 :</strong> <%= carInfo.getStarttime() %></div>
                                                    <div class="mb-2"><strong>반납 대기시간 :</strong> <%= carInfo.getEndtime() %></div>
                                                </div>
                                            </div>
                                        </div>
                                    <% } else { %>
                                        <div class="text-danger text-center py-3">해당 차량 객체의 상세 데이터가 존재하지 않거나 연결에 실패했습니다.</div>
                                    <% } %>
                                </div>
                            </td>
                        </tr>
            <%
                                }
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