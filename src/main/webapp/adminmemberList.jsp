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
    

    
    Admin adminsub = new Admin();

    ArrayList<Member> mem = adminsub.getListofMems(); 
    


%>
<div class="container py-4">


    <div class="card shadow-sm rounded-3">
        <div class="card-body">
            <form action="processDeleteMem.jsp" method="post">
            <div class="md-3 row">
            <label class="col-sm-2"> 삭제할 Id  </label>
            <div class="col-sm-3">
            <input type="text" name="id" class="form-control">
            </div>
            </div>
        </form>
                <table class="table table-hover align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>id</th>
                            <th>password</th>
                            <th>name</th>
                            <th>gender</th>
                            <th>mail</th>
                            <th>phone</th>
                            <th>address</th>
                            <th>registday</th>
                            <th>삭제하기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int index = 0; // Collapse ID 구분을 위한 인덱스 변수
                            //
                            for (int i=0; i < mem.size(); i++){
                                Member newmem = mem.get(i);
                                String id = newmem.getId();
                            
                        %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= newmem.getPassword() %></td>
                            <td>
                                <%= newmem.getName() %>
                            </td>
                            <td><%= newmem.getGender() %></td>
                            <td><%= newmem.getMail() %></td>
                            <td><%= newmem.getPhone() %></td>
                            <td><%= newmem.getAddress() %></td>
                            <td><%= newmem.getRegist_day() %></td>
                            <td><a href="processDeleteMem.jsp?id=<%=id%>" class="btn btn-success">삭제하기</a></td>
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