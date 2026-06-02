<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" %>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <script src="https://js.tosspayments.com/v2/standard"></script>
  </head>
  <%

  Cookie carid_cookie = new Cookie("carid", String.valueOf(carid));
    Cookie day1_cookie = new Cookie("day1", day1);
      Cookie day2_cookie = new Cookie("day2", day2);
      Cookie total_price_cookie = new Cookie("total_price", String.valueOf(total_price));
            carid_cookie.setMaxAge(60 * 60);  // 쿠키 유효 기간: 1시간 (초 단위)
            day1_cookie.setMaxAge(60 * 60);
            day2_cookie.setMaxAge(60 * 60);
            total_price_cookie.setMaxAge(60 * 60);
            carid_cookie.setPath("/");
            day1_cookie.setPath("/");
            day2_cookie.setPath("/");
            total_price_cookie.setPath("/");
            response.addCookie(carid_cookie);
            response.addCookie(day1_cookie);
            response.addCookie(day2_cookie);
            response.addCookie(total_price_cookie);

  %>
  <body>
    <!-- 할인 쿠폰 -->
    <div>
      <input type="checkbox" id="coupon-box" />
      <label for="coupon-box"> 5,000원 쿠폰 적용 </label>
    </div>
    <!-- 결제 UI -->
    <div id="payment-method"></div>
    <!-- 이용약관 UI -->
    <div id="agreement"></div>
    <!-- 결제하기 버튼 -->
    <button class="button" id="payment-button" style="margin-top: 30px">결제하기</button>

    <script>
      main();

      async function main() {
        const button = document.getElementById("payment-button");
        const coupon = document.getElementById("coupon-box");
        // ------  결제위젯 초기화 ------
        const clientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
        const tossPayments = TossPayments(clientKey);
        // 회원 결제
        const customerKey = "Tx0oaVAPQgQPY_BnJdEdN";
        const widgets = tossPayments.widgets({
          customerKey,
        });
        // 비회원 결제
        // const widgets = tossPayments.widgets({ customerKey: TossPayments.ANONYMOUS });

        // ------ 주문의 결제 금액 설정 ------
        await widgets.setAmount({
          currency: "KRW",
          value: <%=total_price%>,
        });

        await Promise.all([
          // ------  결제 UI 렌더링 ------
          widgets.renderPaymentMethods({
            selector: "#payment-method",
            variantKey: "DEFAULT",
          }),
          // ------  이용약관 UI 렌더링 ------
          widgets.renderAgreement({ selector: "#agreement", variantKey: "AGREEMENT" }),
        ]);

        // ------  주문서의 결제 금액이 변경되었을 경우 결제 금액 업데이트 ------
        coupon.addEventListener("change", async function () {
          if (coupon.checked) {
            await widgets.setAmount({
              currency: "KRW",
              value: <%=total_price%> - 5000,
            });

            return;
          }

          await widgets.setAmount({
            currency: "KRW",
            value: <%=total_price%>,
          });
        });

        // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
        button.addEventListener("click", async function () {
          await widgets.requestPayment({
            orderId: "nU6uMlfIdCaO1v_d0uFvG",
            orderName: "토스 티셔츠 외 2건",
            successUrl: "http://localhost:8080/carrentproject"+"/success.jsp",
            failUrl: "http://localhost:8080/carrentproject" + "/fail.jsp",
            customerEmail: "customer123@gmail.com",
            customerName: "김토스",
            customerMobilePhone: "01012341234",
          });
        });
      }
    </script>
  </body>
</html>