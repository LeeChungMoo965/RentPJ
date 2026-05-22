<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<title>Main_Page</title>

</head>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>
<div class="container">
    
    <%@ include file="nav.jsp"  %>
    <%@ include file="ReservaitionBlock.jsp"  %>
    <table width="80%" style="margin-left :10%">
      <tr>
        <td align="left">
          <table>
            <tr>
            <td width="200px" align="left">     
            <img  src="./img/TSLA-model-3.png" class="d-block w-100" alt="...">
            </td>
            <td  align="rligt" style="padding : 1rem">     
            <b>테슬라 모델 3</b><br><hr>
            <p>60,000원</p>
            </td>
            </tr>
            <tr>
            <td width="200px" align="left">     
            <img  src="./img/TSLA-model-3.png" class="d-block w-100" alt="...">
            </td>
            <td  align="rligt" style="padding : 1rem">     
            <b>테슬라 모델 3</b><br><hr>
            <p>60,000원</p>
            </td>
            </tr>
            <tr>
            <td width="200px" align="left">     
            <img  src="./img/TSLA-model-3.png" class="d-block w-100" alt="...">
            </td>
            <td  align="rligt" style="padding : 1rem">     
            <b>테슬라 모델 3</b><br><hr>
            <p>60,000원</p>
            </td>
            </tr>
            <tr>
            <td width="180px" align="left">     
            <img  src="./img/TSLA-model-3.png" class="d-block w-100" alt="...">
            </td>
            <td  align="rligt" style="padding : 1rem">     
            <b>테슬라 모델 3</b><br><hr>
            <p>60,000원</p>
            </td>
            </tr>
            </table>
            </td>
          <td width="60%" align="left" >  
            <div >
             <%@ include file="Map.jsp"  %>
            </div>
          </td>
        </tr>
      </table>

<%@ include file="footer.jsp"  %>
</div>

</body>
</html>
