//클릭한 예약의 정보 가져오기user
function reservationInfo(reseNumber, userId, resPersons, resDate, resState)
{
	$("#reseNumber").val(reseNumber)
	$("#userId").val(userId)
	$("#resPersons").val(resPersons)
	$("#resDate").val(resDate)
	$("#resState").val(resState)
	
	if(resState == "0")
	{
		$("#resState").html('<option value="0" selected="selected">예약대기</option><option value="1">예약완료</option><option value="2">예약취소</option>')
	}
	if(resState == "1")
	{
		$("#resState").html('<option value="0">예약대기</option><option value="1" selected="selected">예약완료</option><option value="2">예약취소</option>')
	}
	if(resState == "2")
	{
		$("#resState").html('<option value="0">예약대기</option><option value="1">예약완료</option><option value="2" selected="selected">예약취소</option>')
	}
	
	$("#okButton").prop("disabled",false);
}


//예약상태 수정버튼 클릭시 작동
function updateResState()
{
	var mgrId = $("#mgrId").val()
	var reseNumber = $("#reseNumber").val()
	var resState = $("#resState").val()
	var userId = $("#userId").val()
	var shopCode = $("#shopCode").val()
	
	location.href = "../pos/updateReservationState.do?mgrId="+mgrId+"&shopCode=" + shopCode + "&userId=" + userId + "&reseNumber=" + reseNumber+"&resState="+resState;
}


//관리자 예약 관리 페이지 예약 상태로 조회
function checkStateForm()
{
	if($('#start').val()==''){
		alert("시작일을 선택해주세요");
		return false;
	}else if($('#finish').val()==''){
		alert("종료일을 선택해주세요");
		return false;
	}else{
		$('#searchStateForm').submit();
	}
}
