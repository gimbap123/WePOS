/**
 * shopMgrRegistration.jsp의 자바스크립트
 */

function checkShopMgrRegistration()
{
	if($("#shopTypeCode").val() == 0)
	{
		alert("매장 종류를 선택하세요.");
		$("#shopTypeCode").focus();
		return;
	}

	if($("#mgrId").val() == "" || $("#mgrId").val() == null)
	{
		alert("관리자 아이디를 입력하세요.");
		$("#mgrId").focus();
		return;
	}

	if($('#mgrPassword').val()=="" || $('#mgrPassword').val()==null)
	{
		alert("비밀번호를 입력하세요");
		$('#mgrPassword').focus();
		return false;
	}
	
	if($('#mgrPassword1').val()=="" || $('#mgrPassword1').val()==null)
	{
		alert("비밀번호를 한 번 더 입력하세요");
		$('#mgrPassword1').focus();
		return false;
	}
	
	if($("#mgrName").val() == "" || $("#mgrName").val() == null)
	{
		alert("관리자 이름을 입력하세요.");
		$("#mgrName").focus();
		return;
	}
	
	if($("#mgrPhone").val() == "" || $("#mgrPhone").val() == null)
	{
		alert("관리자 전화번호를 입력하세요.");
		$("#mgrPhone").focus();
		return;
	}
	
	else
		checkPhone();
}

//연락처 유효성 검사
function checkPhone(){
	var exptext= /^[0-9]{9,12}$/;
	if(exptext.test($('#mgrPhone').val())==false ||  $('#mgrPhone').val().indexOf(' ') > -1){
		alert("올바른 연락처 형식이 아닙니다.");
		$('#mgrPhone').focus();
		return false;
	}
	if (/(\w)\1\1\1\1/.test($('#mgrPhone').val())) {
		alert('연락처에 같은 문자를 5번 이상 반복하실 수 없습니다.');
		$('#mgrPhone').focus();
		return false;
	}
	else
		checkPwd();
}

//비밀번호 유효성 검사 및 폼 전송	
function checkPwd()
{
	var pwd=$('#mgrPassword').val();
	var pwd1=$('#mgrPassword1').val();
	var chk_num = pwd.search(/[0-9]/g);
	var chk_eng = pwd.search(/[a-z]/ig);
	var exptext=/^[a-zA-Z0-9]{8,12}$/;

	// 비밀번호 형식 및 공백문자
	if (!exptext.test(pwd) || pwd.indexOf(' ') > -1)
	{
		alert('패스워드는 영문+숫자 8~12자리');
		$('#mgrPassword').val("");
		$('#mgrPassword1').val("");
		$('#mgrPassword').focus();
		return false;
	}

	if (chk_num < 0 || chk_eng < 0) {
		alert('패스워드는 영문+숫자 8~12자리');
		$('#mgrPassword').val("");
		$('#mgrPassword1').val("");
		$('#mgrPassword').focus();
		return false;
	}

	if (/(\w)\1\1\1/.test(pwd)) {
		alert('패스워드에 같은 문자를 4번 이상 반복하실 수 없습니다.');
		$('#mgrPassword').val("");
		$('#mgrPassword1').val("");
		$('#mgrPassword').focus();
		return false;
	}
	
	if(pwd==pwd1){
		alert("성공적으로 관리자 가입이 완료되었습니다!");
		document.shopMgrRegForm.submit();
		
	}
		
	else
	{
		alert("패스워드가 일치하지 않습니다.");
		$('#mgrPassword1').val("");
		$('#mgrPassword1').focus();
		return false;
	}
}

//아이디 중복 및 유효성 검사
function checkId()
{	
	var exptext= /^[a-z0-9]{4,12}$/;
	var chk_num = $('#mgrId').val().search(/[0-9]/g);
	var chk_eng = $('#mgrId').val().search(/[a-z]/ig);
	
	// 아이디 글자수 제한
	if(exptext.test($('#mgrId').val())==false || $('#mgrId').val().indexOf(' ')>-1){
		$('#mgrIdCheck').html("아이디는 영문+숫자 4~12자리");
		$('#mgrIdCheck').attr("style","color:red");
		return false;
	}
	// 아이디 영문자+숫자 조합
	if (chk_num < 0 || chk_eng < 0) {
		$('#mgrIdCheck').html("아이디는 영문+숫자 4~12자리");
		$('#mgrIdCheck').attr("style","color:red");
		return false;
	}
	// 아이디에 같은 문자 반복 제한
	if (/(\w)\1\1\1/.test($('#mgrId'))) {
		$('#mgrIdCheck').html('아이디에 같은 문자를 4번 이상 반복하실 수 없습니다.');
		$('#mgrIdCheck').attr("style","color:red");
		return false;
	}
	$.ajax({	 
		url : '../common/checkId.do?userId=' + $('#mgrId').val(),
		type : 'post',
		success : function(data) {
			$('#mgrIdCheck').html(data);
			if($('#checkIdFromUsers').val()==1 || $('#checkIdFromMgr').val()==1){
				$('#mgrIdCheck').attr("style","color:red");
				return false;
			}				
			if($('#checkIdFromUsers').val()==0 || $('#checkIdFromMgr').val()==0){
				$('#mgrIdCheck').attr("style","color:blue");
				return false;
			}

		}
	});	
}