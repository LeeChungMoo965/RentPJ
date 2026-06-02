<!DOCTYPE html>
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
<html lang="ko">
  <head>
    <meta charset="utf-8" />
  </head>
  <%
  
  request.setCharacterEncoding("utf-8");
            Cookie[] cookies = request.getCookies();
            int carid= 0;
            String day1="";
            String day2="";
            String user_id="";
            Double total_price=0D;
            if(cookies!=null){
                    for (int i= 0; i < cookies.length; i++){
                    Cookie thisCookie = cookies[i];
                    String n = thisCookie.getName();
                    if(n.equals("carid"))
                            carid = Integer.parseInt(URLDecoder.decode((thisCookie.getValue()),"utf-8"));
                    if(n.equals("day1"))
                            day1 = URLDecoder.decode((thisCookie.getValue()),"utf-8");
                    if(n.equals("day2"))
                            day2 = URLDecoder.decode((thisCookie.getValue()),"utf-8");
                    if(n.equals("userCookieId"))
                            user_id = URLDecoder.decode((thisCookie.getValue()),"utf-8");
                    if(n.equals("total_price"))
                            total_price = Double.parseDouble(URLDecoder.decode((thisCookie.getValue()),"utf-8"));
                    }
            }
    
    Admin admin = new Admin();
    admin.addTime(carid,day1,day2);
    Member mem = new Member();
    Login log = new Login();
    mem = log.getUserById(user_id);
    PayInfo info = new PayInfo();
    info.setId(user_id);
    info.setCarid(carid);
    info.setTotal_price(total_price);
    Reservation rv = new Reservation();
    rv.setId(user_id);
    rv.setCarid(carid);
    rv.setStarttime(day1);
    rv.setEndtime(day2);

    admin.addPayInfo(info);
    admin = new Admin();
    admin.addReservation(rv);
    
  %>
  <body>
 

    <script>
      
      // 쿼리 파라미터 값이 결제 요청할 때 보낸 데이터와 동일한지 반드시 확인하세요.
      // 클라이언트에서 결제 금액을 조작하는 행위를 방지할 수 있습니다.
      const urlParams = new URLSearchParams(window.location.search);
      const paymentKey = urlParams.get("paymentKey");
      const orderId = urlParams.get("orderId");
      const amount = urlParams.get("amount");

      async function confirm() {
        const requestData = {
          paymentKey: paymentKey,
          orderId: orderId,
          amount: amount,
        };

        const response = await fetch("/confirm", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestData),
        });

        const json = await response.json();

        if (!response.ok) {
          // 결제 실패 비즈니스 로직을 구현하세요.
          console.log(json);
          window.location.href = `/fail?message=${json.message}&code=${json.code}`;
        }

        // 결제 성공 비즈니스 로직을 구현하세요.
        console.log(json);
      }
      confirm();

      const paymentKeyElement = document.getElementById("paymentKey");
      const orderIdElement = document.getElementById("orderId");
      const amountElement = document.getElementById("amount");

      orderIdElement.textContent = "주문번호: " + orderId;
      amountElement.textContent = "결제 금액: " + amount;
      paymentKeyElement.textContent = "paymentKey: " + paymentKey;
   
  
    </script>
    <%
     out.println("<script> alert('결제 성공! ');  window.location.href = 'http://localhost:8080/carrentproject/reservationList.jsp'; </script>");
  %>
  </body>
</html>