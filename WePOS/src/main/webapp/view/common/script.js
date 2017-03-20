
function checkWrite()
{
	if(document.boardWrite.boardTitle.value=="" || document.boardWrite.boardTitle.value==null)
	{
		alert("제목을 입력하세요");
		document.boardWrite.boardTitle.focus();
		return false;
	}		
	if(document.boardWrite.boardContent.value=="" || document.boardWrite.boardContent.value==null)
	{
		alert("내용을 입력하세요");
		document.boardWrite.boardContent.focus();
		return false;
	}
	
	alert("글이 성공적으로 등록되었습니다!");
	document.boardWrite.submit();
}


function check()
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
	if(document.regForm.userPassword2.value=="" || document.regForm.userPassword2.value==null)
	{
		alert("암호확인을 입력하세요");
		document.regForm.userPassword2.focus();
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
		checkPwd();
}

	
function checkId()
{
	var id=document.regForm.userId.value;
	var idCheck=document.getElementById('idCheck');
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
	
function checkPwd()
{
	var pwd1=document.regForm.userPassword.value;
	var pwd2=document.regForm.userPassword2.value;
	if(pwd1==pwd2)
		document.regForm.submit();
	else
	{
		alert("비밀번호가 일치하지 않습니다.");
		document.regForm.userPassword2.value="";
		document.regForm.userPassword2.focus();
		return false;
	}
}