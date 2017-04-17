//예약 확인
function checkRes(){
	
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
		document.resForm.submit();
		}
		else
		{
			return false;
		}	
	}
}