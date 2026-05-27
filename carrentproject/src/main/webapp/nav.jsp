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
    <div class="container-fluid">
        <a class="navbar-brand" href="#">로고</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup"width="100%">
        <div class="navbar-nav">
        <table style="margin-left : 1rem">
            <tr style="margin-left : 1rem">
                
                        <th>
                            <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                        </th>
                        <th>
                            <a class="nav-link" href="./ReservaitionPage.jsp">예약</a>
                        </th>
                        <th> 
                            <a class="nav-link" href="#">게시판</a>
                        </th>              
            </tr>
        </table> 
        </div>
        </div>
        <% request.setCharacterEncoding("utf-8");
            Cookie[] cookies = request.getCookies();
            String user_id="";

            if(cookies!=null){
                    for (int i= 0; i < cookies.length; i++){
                    Cookie thisCookie = cookies[i];
                    String n = thisCookie.getName();
                    if(n.equals("userCookieId"))
                            user_id = URLDecoder.decode((thisCookie.getValue()),"utf-8");
                            
                    }
        %>
        <ul class="nav justify-content-end" >
        
       
        <li class="nav-item">
            <%=user_id%>님 환영합니다 !
        </li>
        <% 
        }else{
%>
    <ul class="nav justify-content-end" >
        
        <li class="nav-item">
            <a class="nav-link" href="login.jsp" style="color : balck">로그인</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="signup.jsp" style="color : balck">회원가입</a>
        </li>
    <% } %>
    </div>

    </nav>
</body>
</html>
