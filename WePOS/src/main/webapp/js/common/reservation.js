//예약 확인
function checkRes(){
	if($('#resPersons').val()==0){
		alert("예약 인원을 선택해주세요");
		return false;
	}else if($('#date').val()==''){
		alert("예약 날짜를 선택해주세요");
		return false;
	}else if($('#resTime').val()==0){
		alert("예약 시간을 선택해주세요");
		return false;
	}else if($('#resMemo').val()==""){
		alert("주문 내용을 기입해주세요");
		return false;
	}else{
		alert("예약이 성공적으로 진행되었습니다")
		$('#resForm').submit();
	}
}