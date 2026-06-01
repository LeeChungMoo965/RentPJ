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
    <div>
        <br><br><br>
        <form action="ReservaitionPage.jsp" method="post">
        <table width="80%" style="margin-left : 10%;  ">
            <tr>
                <th align="left">
                    <table>
                    
                        <tr>
                        <td>
                        대여
                        </td>
                        <td align="left">
                           <input type="date" name="day1" class="form-control form-control-lg rounded-3">
                            </td>
                            <td>
                            <h4><pre style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'> / </pre></h4>
                            </td>
                            <td>
                            <select class="form-select" name="hour1">
                        <option selected>시</option>
                        <option value="01">01</option>
                        <option value="02">02</option>
                        <option value="03">03</option>
                        <option value="04">04</option>
                        <option value="05">05</option>
                        <option value="06">06</option>
                        <option value="07">07</option>
                        <option value="08">08</option>
                        <option value="09">09</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        
                    </select>
                    </td>
                    <td>
                    <h4><pre style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'> : </pre></h4>
                    </td>
                    <td align="right">
                 
                        <select class="form-select" name="min1">
                            <option selected>분</option>
                            <option value="00">0</option>
                            <option value="10">10</option>
                            <option value="20">20</option>
                            <option value="30">30</option>
                            <option value="40">40</option>
                            <option value="50">50</option>
                            
                            
                        </select>
                        </td>
                        </tr>
                        </table>
                        </th>
                <td align="right">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"><img src="./img/map.png" style="width : 1.5rem; height : 1.5rem" alt="..."></span>
                        <input type="text" name="local"class="form-control" placeholder="지역 검색" >
                    </div>
                </td>
                <th align="right">
                    <div class="input-group mb-3">
                        <input type="submit" value="검색"class="btn btn-info" />
                    </div>
                </th>
            </tr>
            
            <tr>
                <th align="left">
                    <table>
                        <tr>
                        <td>
                        반납
                        </td>
                        <td align="left">
                            <input type="date" name="day2" class="form-control form-control-lg rounded-3">
                            
                            </td>
                            <td>
                            <h4><pre style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'> / </pre></h4>
                            </td>
                            <td>
                            <select class="form-select" name="hour2">
                        <option selected>시</option>
                        <option value="1">01</option>
                        <option value="2">02</option>
                        <option value="3">03</option>
                        <option value="4">04</option>
                        <option value="5">05</option>
                        <option value="6">06</option>
                        <option value="7">07</option>
                        <option value="8">08</option>
                        <option value="9">09</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        
                    </select>
                    </td>
                    <td>
                    <h4><pre style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'> : </pre></h4>
                    </td>
                    <td align="right">
                 
                        <select class="form-select" name="min2">
                            <option selected>분</option>
                            <option value="0">0</option>
                            <option value="10">10</option>
                            <option value="20">20</option>
                            <option value="30">30</option>
                            <option value="40">40</option>
                            <option value="50">50</option>
                            
                            
                        </select>
                        </td>
                        </tr>
                        </table>
                        </th>
            </tr>

        </table>
        <br><br><br>
        </form>
    </div>

</body>
</html>
