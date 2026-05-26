<%@ page contentType="text/html; charset=utf-8" %>

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
    
            <div class="rounded">
             <%@ include file="Map.jsp"  %>
            </div>
     
      </table>

<%@ include file="footer.jsp"  %>
</div>

</body>
</html>
