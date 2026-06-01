<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" %>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
  </head>

  <body>
  
  </body>
</html>

<script>

  const urlParams = new URLSearchParams(window.location.search);

  const codeElement = document.getElementById("code");
  const messageElement = document.getElementById("message");
  
  if(confirm("에러코드: " + urlParams.get("code") + "실패 사유: " + urlParams.get("message"))){
    window.location.href = "http://localhost:8080/carrentproject/home.jsp";
  }
</script>