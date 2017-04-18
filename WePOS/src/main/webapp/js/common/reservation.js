//예약 확인
function checkRes()
{
	if($('#resPersons').val()==0){
		alert("예약 인원을 선택해주세요");
		return false;
	}else if($('#start').val()==''){
		alert("예약 날짜를 선택해주세요");
		return false;
	}else if($('#resHourType').val()==0){
		alert("예약 시간 타입을 선택해주세요");
		return false;
	}else if($('#resHour').val()==0){
		alert("예약하실 시간을 선택해주세요");
		return false;
	}else if($('#resMinute').val()==0){
		alert("예약하실 시간을 선택해주세요");
		return false;
	}else if($('#resDesc').val()==""){
		alert("주문 내용을 기입해주세요");
		return false;
	}else{
		var checkRes = confirm("이대로 예약을 진행하시겠습니까?")
		if(checkRes)
		{
		alert("예약이 성공적으로 진행되었습니다!")
		alert("예약하신 내역은 상단 예약확인 페이지를 통해 확인하실 수 있습니다.")
		document.resForm.submit();
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
	}else if($('#resDesc').val()==""){
		alert("주문 내용을 기입해주세요");
		return false;
	}else{
		var updateRes = confirm("이대로 예약을 수정하시겠습니까?")
		if(updateRes)
		{
		alert("예약이 성공적으로 수정되었습니다!")
		alert("수정하신 내역은 상단 예약확인 페이지를 통해 확인하실 수 있습니다.")
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
		var userId = $("#userId").val()
		var shopCode = $("#shopCode").val()
		var reseNumber = $("#reseNumber").val()
		alert(shopCode)
		alert(reseNumber)
		
		location.href = "../common/reservationDelete.do?shopCode=" + shopCode + "&userId=" + userId + "&reseNumber=" + reseNumber;
	}
}
