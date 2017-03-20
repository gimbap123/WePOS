/**
 * findId.jsp의 자바스크립트
 */

function checkFindId()
{
	var userName = document.findIdForm.userName.value; 
	var userEmail = document.findIdForm.userEmail.value;
	if(userName == "" || userEmail == "")
	{
		alert("이름과 이메일 주소를 입력하세요.");
		return false;	
	}
}

function checkFindPw()
{
	var userId = document.findPwForm.userId.value; 
	var userEmail = document.findPwForm.userEmail.value;
	if(userId == "" || userEmail == "")
	{
		alert("아이디와 이메일 주소를 입력하세요.");
		return false;	
	}
}