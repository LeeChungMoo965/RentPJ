<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dao.AddMember" %>

<%
    // 1. 회원가입 창에서 전달한 id 파라미터 받기
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");

    // 2. DAO를 통해 DB에서 중복 여부 체크
    AddMember addMember = new AddMember();
    boolean isDuplicate = addMember.checkIdDuplicate(id);
%>

<html>
<head>
    <meta charset="utf-8">
    <title>아이디 중복 확인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <%-- AI의 도움을 받아 팝업창 실행 화면 페이지 구현을 하였습니다. --%>
    <script type="text/javascript">
        // 아이디 사용하기 버튼을 눌렀을 때 실행되는 함수
        function useId(userId) {
            // 회원가입 페이지의 아이디 입력란에 이 아이디를 그대로 전달 
            opener.document.getElementById("id").value = userId;
            
            // 회원가입 페이지의 idCheckFlag 값에 중복 확인이 실행된 상태 저장
            opener.document.getElementById("idCheckFlag").value = "<%= AddMember.getIdCheckSuccess() %>";;
            
            // 팝업창 닫기
            window.close();
        }
    </script>
</head>
<body class="bg-light">

<div class="container p-4 text-center">
    <h5 class="fw-bold mb-3">아이디 중복 확인 결과</h5>
    <hr>

    <%-- CSS 디자인은 AI와 부트스트랩을 활용해서 작성하였습니다. --%>
    <% if (isDuplicate) { %>
        <div class="alert alert-danger" role="alert">
            <span class="fw-bold text-secondary-emphasis">'<%= id %>'</span>은(는) 이미 사용 중인 아이디입니다.
        </div>
        <p class="text-muted small">다른 아이디를 입력하고 다시 시도해주세요.</p>
        <button type="button" class="btn btn-danger w-100 mt-2" onclick="window.close()">창 닫기</button>

    <% } else { %>
        <div class="alert alert-success" role="alert">
            <span class="fw-bold text-secondary-emphasis">'<%= id %>'</span>은(는) 사용 가능한 아이디입니다.
        </div>
        <p class="text-muted small">이 아이디를 사용하시겠습니까?</p>
        <button type="button" class="btn btn-primary w-100 mt-2" onclick="useId('<%= id %>')">아이디 사용하기</button>
    <% } %>

</div>

</body>
</html>