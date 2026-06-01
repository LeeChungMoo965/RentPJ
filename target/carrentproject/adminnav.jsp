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
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>
<nav class="navbar navbar-expand-lg bg-body-tertiary" width="100%">
    <div class="container py-4">
        <a class="navbar-brand" href="adminhome.jsp"style="font-size : 30px">🏎️</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup"width="100%">
        <div class="navbar-nav">
        <table style="margin-left : 1rem">
            <tr style="margin-left : 1rem">

                        <th>
                            <a class="nav-link" href="./addcar.jsp">차량등록</a>
                        </th>
                        <th> 
                            <a class="nav-link" href="./deletecar.jsp">차량삭제</a>
                        </th>              
                        <th> 
                            <a class="nav-link" href="./adminmemberList.jsp">회원관리</a>
                        </th>              
                        <th> 
                            <a class="nav-link" href="./payinfoList.jsp">결제정보</a>
                        </th>              
                        <th> 
                            <a class="nav-link" href="./adminreservationList.jsp">예약정보</a>
                        </th>              
                        
            </tr>
        </table> 
        </div>
        </div>
    </nav>
</body>
</html>