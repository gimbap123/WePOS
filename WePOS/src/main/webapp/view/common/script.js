
//글수정하기
function boardRewrite(){
	if(document.boardDetail.boardTitle.value=="" || document.boardDetail.boardTitle.value==null){
		alert("제목을 입력하세요");
		document.boardDetail.boardTitle.focus();
		return false;
	}
	
	if(document.boardDetail.boardContent.value=="" || document.boardDetail.boardContent.value==null){
		alert("내용을 입력하세요");
		document.boardDetail.boardContent.focus();
		return false;
	}
	 
	alert("글이 성공적으로 수정되었습니다!");
	document.boardDetail.submit();
}

//글쓰기
function checkWrite(){
		if(document.boardWrite.boardTitle.value=="" || document.boardWrite.boardTitle.value==null){
			alert("제목을 입력하세요");
			document.boardWrite.boardTitle.focus();
			return false;
		}
	
		if(document.boardWrite.totalId.value=="" || document.boardWrite.totalId.value==null){
			alert("아이디를 입력하세요");
			document.boardWrite.totalId.focus();
			return false;
		}
		
		if(document.boardWrite.boardContent.value=="" || document.boardWrite.boardContent.value==null){
			alert("내용을 입력하세요");
			document.boardWrite.boardContent.focus();
			return false;
		}
		
		alert("글이 성공적으로 등록되었습니다!");
		document.boardWrite.submit();
	}


function check(){
		if(document.regForm.user_name.value=="" || document.regForm.user_name.value==null){
			alert("이름을 입력하세요");
			document.regForm.user_name.focus();
			return false;
		}
		if(document.regForm.user_id.value=="" || document.regForm.user_id.value==null){
			alert("아이디를 입력하세요");
			document.regForm.user_id.focus();
			return false;
		}
		if(document.regForm.user_password.value=="" || document.regForm.user_password.value==null){
			alert("암호를 입력하세요");
			document.regForm.user_password.focus();
			return false;
		}
		if(document.regForm.user_password2.value=="" || document.regForm.user_password2.value==null){
			alert("암호확인을 입력하세요");
			document.regForm.user_password2.focus();
			return false;
		}
		if(document.regForm.user_phone.value=="" || document.regForm.user_phone.value==null){
			alert("연락처를 입력하세요");
			document.regForm.user_phone.focus();
			return false;
		}
		if(document.regForm.user_email.value=="" || document.regForm.user_email.value==null){
			alert("이메일을 입력하세요");
			document.regForm.user_email.focus();
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