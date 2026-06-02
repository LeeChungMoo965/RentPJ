<%@ page  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>카카오 로그인</title>
    
</head>
<body>

    <hr>
  
    <%
        //카카오 앱 정보 설정
        String clientId = "700ee71dfda3cbe5ed1ad66eedc9448e";
        String redirectUri = "http://localhost:8080/carrentproject/kakaoCallback.jsp";
    
        String kakaoAuthUrl = "https://kauth.kakao.com/oauth/authorize"
                            + "?client_id=" + clientId 
                            + "&redirect_uri=" +redirectUri
                            + "&response_type=code";
    %>
    <a href="<%=kakaoAuthUrl %>">
    <img src="./img/kakao_login_medium_narrow.png" alt="카카오 로그인 버튼" />
    </a>
                
</body>
</html>