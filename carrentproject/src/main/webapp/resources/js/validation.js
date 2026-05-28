function checkSignup() {
  var id = document.getElementById("id");
  var password = document.getElementById("password");
  var name = document.getElementById("name");
  var phone = document.getElementById("phone");
  var email = document.getElementById("mail");
  var address = document.getElementById("address");

  // 아이디 검사
  if (!check(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,12}$/, id, "[아이디]\n영문과 숫자를 조합하여 4~12자 입력하세요")) {
    return false;
  }

  // 비밀번호 검사 (if 조건식 AI 도움)
  if (!check(/^(?=.*[A-Za-z])(?=.*\d).{8,20}$/, password, "[비밀번호]\n영문과 숫자를 포함하여 8~20자 입력하세요")) {
    return false;
  }

  if (name.value.trim().length < 2) {
    alert("[이름]\n2자 이상 입력하세요");
    name.focus();
    return false;
  }

  if (!/^010-\d{4}-\d{4}$/.test(phone.value)) {
    alert("[전화번호]\n010-0000-0000 형식으로 입력하세요");
    phone.focus();
    return false;
  }

  if (!/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test(mail.value)) {
    alert("[이메일]\n올바른 이메일 형식을 입력하세요");
    mail.focus();
    return false;
  }

  if (address.value.trim() == "") {
    alert("[주소]\n주소를 입력하세요");
    address.focus();
    return false;
  }

  function check(regExp, e, msg) {
    if (regExp.test(e.value)) {
      return true;
    }
    alert(msg);
    e.focus();
    return false;
  }

  document.signup.submit();
}
