function checkWrite(){
		if(document.boardWrite.boardTitle.value=="" || document.boardWrite.boardTitle.value==null){
			alert("제목을 입력하세요");
			document.boardWrite.boardTitle.focus();
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
	
	function checkId(){
		
	}
	
	function checkPwd(){
		var pwd1=document.regForm.user_password.value;
		var pwd2=document.regForm.user_password2.value;
		if(pwd1==pwd2)
			document.regForm.submit();
		else{
			alert("비밀번호가 일치하지 않습니다.");
			document.regForm.user_password2.value="";
			document.regForm.user_password2.focus();
			return false;
		}
	}