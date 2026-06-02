<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<title>로그인</title>
</head>
<script type="text/javascript">
function CheckMember() {
    

    var form = document.member;
    var regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    var regExpName = /^[가-힣]*$/;
    var regExpPasswd = /^[0-9]*$/;
    var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
    var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    if(!regExpId.test(form.id.value)){
        alert("아이디는 문자로 시작해주세요!");
        form.id.select();
        return;
    }
        if(!regExpName.test(form.name.value)){
        alert("이름은 한글만 입력해주세요!");
        form.name.select();
        return;
    }
    if(!regExpPasswd.test(form.pw.value)){
        alert("비밀번호는 숫자만 입력해주세요");
        form.pw.select();
        return;
    }
    if(!regExpPhone.test(form.phone.value)){
        alert("연락처 입력을 확인해주세요!");
        form.id.select();
        return;
    }
    
    form.submit();
}

</script>
<body style='font-family: "Jua", sans-serif;font-weight: 100;font-style: normal;'>
    
             <h4>로그인 실패</h4>  
   
</div>
</body>
</html>
