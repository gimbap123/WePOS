//예약 버튼을 눌렀을때
function reservationMove(userId, shopCode)
{
	$("#responsive").html("");	
		
		$.get("../common/reservationModal.do", {shopCode : shopCode, userId : userId}, function(result)
		{		
			$("#responsive").append(result);		
		})	
}

//예약 확인
function checkRes()
{
	if($('#resPersons').val()==0){
		alert("예약 인원을 선택해주세요");
		return false;
	}else if($('#start').val()==''){
		alert("예약 날짜를 선택해주세요");
		return false;
	}else if($('#startHourType').val()==0){
		alert("예약 시간 타입을 선택해주세요");
		return false;
	}else if($('#startHour').val()==0){
		alert("예약하실 시간을 선택해주세요");
		return false;
	}else if($('#startMinute').val()==""){
		alert("예약하실 시간을 선택해주세요");
		return false;
	}else{
		var checkRes = confirm("이대로 예약을 진행하시겠습니까?")
		if(checkRes)
		{
		alert("예약이 성공적으로 진행되었습니다!")
//		document.resForm.submit();
		$("#resForm").submit();
		}
		else
		{
			return false;
		}	
	}
}


//예약내역 수정
function updateRes()
{
	if($('#start').val()==''){
		alert("예약 날짜를 선택해주세요");
		return false;
	}else{
		var updateRes = confirm("이대로 예약을 수정하시겠습니까?")
		if(updateRes)
		{
		alert("예약이 성공적으로 수정되었습니다!")
		document.updateResForm.submit();
		}
		else
		{
			return false;
		}	
	}
}


//예약내역 삭제
function deleteRes()
{
	var deleteRes = confirm("예약한 내역을 삭제하시겠습니까?")
	
	if(deleteRes)
	{
		var resState = $("#resState").val()
		var userId = $("#userId").val()
		var shopCode = $("#shopCode").val()
		var reseNumber = $("#reseNumber").val()
		alert("예약한 내역이 성공적으로 삭제되었습니다.")
		
		location.href = "../common/reservationDelete.do?shopCode=" + shopCode + "&userId=" + userId + "&reseNumber=" + reseNumber + "&resState=" + resState;
	}
}
