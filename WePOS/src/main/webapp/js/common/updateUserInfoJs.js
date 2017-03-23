// Null 체크
function checkNull()
{
	if($('#userName').val()=="" || $('#userName').val()==null ||$('#userName').val().indexOf(' ') > -1)
	{
		alert("올바른 이름을 입력하세요");
		$('#userName').focus();
		return false;
	}
	if($('#userId').val()=="" || $('#userId').val()==null)
	{
		alert("아이디를 입력하세요");
		$('#userId').focus();
		return false;
	}
	if($('#userPassword').val()=="" || $('#userPassword').val()==null)
	{
		alert("암호를 입력하세요");
		$('#userPassword').focus();
		return false;
	}
	if($('#userPassword1').val()=="" || $('#userPassword1').val()==null)
	{
		alert("암호확인을 입력하세요");
		$('#userPassword1').focus();
		return false;
	}
	if($('#userPhone').val()=="" || $('#userPhone').val()==null || $('#userPhone').val().indexOf(' ') > -1)
	{
		alert("올바른 연락처를 입력하세요");
		$('#userPhone').focus();
		return false;
	}
	if($('#userEmail').val()=="" || $('#userEmail').val()==null)
	{
		alert("이메일을 입력하세요");
		$('#userEmail').focus();	
		return false;
	}
	else
		checkPhone();
}

// 연락처 유효성 검사
function checkPhone(){
	var exptext= /^[0-9]{9,12}$/;
	if(exptext.test($('#userPhone').val())==false ||  $('#userPhone').val().indexOf(' ') > -1){
		alert("올바른 연락처 형식이 아닙니다.");
		$('#userPhone').focus();
		return false;
	}else{
		checkEmail();
	}
	
	if (/(\w)\1\1\1\1/.test($('#userPhone'))) {
		alert('연락처에 같은 문자를 5번 이상 반복하실 수 없습니다.');
		$('#userPhone').focus();
		return false;
	}
}

// 이메일 유효성 검사
function checkEmail(){
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(exptext.test($('#userEmail').val())==false ||  $('#userEmail').val().indexOf(' ') > -1){
		alert("올바른 이메일 형식이 아닙니다.");
		$('#userEmail').focus();
		return false;
	}else{
		checkPwd();
	}

}

// 비밀번호 유효성 검사 및 폼 전송	
function checkPwd()
{
	var pwd=$('#userPassword').val();
	var pwd1=$('#userPassword1').val();
	var chk_num = pwd.search(/[0-9]/g);
	var chk_eng = pwd.search(/[a-z]/ig);
	var exptext=/^[a-zA-Z0-9]{8,12}$/;

	// 비밀번호 형식 및 공백문자
	if (!exptext.test(pwd) || pwd.indexOf(' ') > -1)
	{
		alert('패스워드는 영문+숫자 8~12자리');
		$('#userPassword').val("");
		$('#userPassword1').val("");
		$('#userPassword').focus();
		return false;
	}

	if (chk_num < 0 || chk_eng < 0) {
		alert('패스워드는 영문+숫자 8~12자리');
		$('#userPassword').val("");
		$('#userPassword1').val("");
		$('#userPassword').focus();
		return false;
	}

	if (/(\w)\1\1\1/.test(pwd)) {
		alert('패스워드에 같은 문자를 4번 이상 반복하실 수 없습니다.');
		$('#userPassword').val("");
		$('#userPassword1').val("");
		$('#userPassword').focus();
		return false;
	}
	
	if(pwd==pwd1){
		alert("회원정보 수정 성공");
		document.updateForm.submit();		
	}
		
	else
	{
		alert("패스워드가 일치하지 않습니다.");
		$('#userPassword1').val("");
		$('#userPassword1').focus();
		return false;
	}
}
