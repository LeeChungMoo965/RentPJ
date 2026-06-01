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
 <%
    

    
    Admin adminsub = new Admin();

    ArrayList<Car> car = adminsub.getListofCars(); 
    


%>
<div class="container py-4">


    <div class="card shadow-sm rounded-3">
        <div class="card-body">
            <form action="processDeleteCar.jsp" method="post">
            <div class="md-3 row">
            <label class="col-sm-2"> 삭제할 carId  </label>
            <div class="col-sm-3">
            <input type="text" name="carid" class="form-control">
            </div>
            </div>
        </form>
                <table class="table table-hover align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>carId</th>
                            <th>carname</th>
                            <th>price</th>
                            <th>people</th>
                            <th>oil</th>
                            <th>color</th>
                            <th>distancy</th>
                            <th>대여시간</th>
                            <th>반납시간</th>
                            <th>X</th>
                            <th>Y</th>
                            <th>releasDate</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int index = 0; // Collapse ID 구분을 위한 인덱스 변수
                              
                            for (int i=0; i < car.size(); i++){
                                Car newcar = car.get(i);
                                int carid = newcar.getCarid();
                            
                        %>
                        <tr>
                            <td><%= carid%></td>
                            <td><%= newcar.getCarname() %></td>
                            <td>
                                <%= newcar.getCarprice() %>
                            </td>
                            <td><%= newcar.getPeople() %></td>
                            <td><%= newcar.getOil() %></td>
                            <td><%= newcar.getColor() %></td>
                            <td><%= newcar.getDistancy() %></td>
                            <td><%= newcar.getStarttime() %></td>
                            <td><%= newcar.getEndtime() %></td>
                            <td><%= newcar.getLocationX() %></td>
                            <td><%= newcar.getLocationY() %></td>
                            <td><%= newcar.getReleasDate() %></td>

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