// 공백 체크
function checkBlank()
{
	if(document.regForm.userName.value=="" || document.regForm.userName.value==null)
	{
		alert("이름을 입력하세요");
		document.regForm.userName.focus();
		return false;
	}
	if(document.regForm.userId.value=="" || document.regForm.userId.value==null)
	{
		alert("아이디를 입력하세요");
		document.regForm.userId.focus();
		return false;
	}
	if(document.regForm.userPassword.value=="" || document.regForm.userPassword.value==null)
	{
		alert("암호를 입력하세요");
		document.regForm.userPassword.focus();
		return false;
	}
	if(document.regForm.userPassword1.value=="" || document.regForm.userPassword1.value==null)
	{
		alert("암호확인을 입력하세요");
		document.regForm.userPassword1.focus();
		return false;
	}
	if(document.regForm.userPhone.value=="" || document.regForm.userPhone.value==null)
	{
		alert("연락처를 입력하세요");
		document.regForm.userPhone.focus();
		return false;
	}
	if(document.regForm.userEmail.value=="" || document.regForm.userEmail.value==null)
	{
		alert("이메일을 입력하세요");
		document.regForm.userEmail.focus();	
		return false;
	}
	if(document.regForm.terms.checked==false)
	{
		alert("이용약관에 동의해 주세요");
		return false;
	}		
	if(document.regForm.result.value==1)
	{
		idCheck.style.color="red";
		alert("아이디를 확인해주세요.");
		document.regForm.userId.focus();
		return false;
	}
	else
		checkEmail();
		//checkPwd();
}

// 아이디 중복 및 유효성 검사
function checkId()
{
	var id=document.regForm.userId.value;
	var idCheck=document.getElementById('idCheck');
	var exptext= /^[a-z0-9]{4,12}$/;
	var chk_num = id.search(/[0-9]/g);
	var chk_eng = id.search(/[a-z]/ig);
	
	// 아이디 글자수 제한
	if(exptext.test(id)==false){
		idCheck.innerHTML="아이디는 영문,숫자 4~12자리";
		idCheck.style.color="red";
		return false;
	}
	// 아이디 영문자+숫자 조합
	if (chk_num < 0 || chk_eng < 0) {
		idCheck.innerHTML='아이디는 숫자와 영문자를 혼용하여야 합니다.';
		idCheck.style.color="red";
		document.regForm.userId.focus();
		return false;
	}
	// 아이디에 같은 문자 반복 제한
	if (/(\w)\1\1\1/.test(id)) {
		idCheck.innerHTML='아이디에 같은 문자를 4번 이상 사용하실 수 없습니다.';
		idCheck.style.color="red";
		document.regForm.userId.focus();
		return false;
	}
	$.ajax({	 
		url : 'checkId.do?userId=' + id,
		type : 'post',
		success : function(data) {
			idCheck.innerHTML = data;
			if(document.regForm.result.value==1)
				idCheck.style.color="red";
			if(document.regForm.result.value==0)
				idCheck.style.color="blue";
	       	}
	});	
}

//이메일 유효성 검사
function checkEmail(){
	var email=document.regForm.userEmail.value;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(exptext.test(email)==false){
		alert("올바른 이메일 형식이 아닙니다.");
		document.regForm.userEmail.focus();
		return false;
	}else{
		checkPwd();
	}

}

// 비밀번호 유효성 검사 및 폼 전송	
function checkPwd()
{
	var pwd1=document.regForm.userPassword.value;
	var pwd2=document.regForm.userPassword1.value;
	var chk_num = pwd1.search(/[0-9]/g);
	var chk_eng = pwd1.search(/[a-z]/ig);
	var exptext=/^[a-zA-Z0-9]{5,12}$/;

	if (!exptext.test(pwd1) || pwd1.indexOf(' ') > -1)
	{
		alert('패스워드는 숫자와 영문자 조합으로 5~12자리를 사용해야 합니다.');
		document.regForm.userPassword.value = "";
		document.regForm.userPassword.focus();
		return false;
	}

	if (chk_num < 0 || chk_eng < 0) {
		alert('패스워드는 숫자와 영문자를 혼용하여야 합니다.');
		document.regForm.userPassword.value="";
		document.regForm.userPassword.focus();
		return false;
	}

	if (/(\w)\1\1\1/.test(pwd1)) {
		alert('패스워드에 같은 문자를 4번 이상 사용하실 수 없습니다.');
		document.regForm.userPassword.value="";
		document.regForm.userPassword.focus();
		return false;
	}
	
	if(pwd1==pwd2)
		document.regForm.submit();
	else
	{
		alert("패스워드가 일치하지 않습니다.");
		document.regForm.userPassword1.value="";
		document.regForm.userPassword1.focus();
		return false;
	}
}

