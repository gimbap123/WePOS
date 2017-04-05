function checkForm(){
	if($('#calendarBegin').val()==''){
		alert("시작일을 확인해주세요");
	}else if($('#calendarEnd').val()==''){
		alert("종료일을 확인해주세요");
	}else if($('#calendarBegin').val()>$('#calendarEnd').val()){
		alert("시작일은 종료일보다 클 수 없습니다.")
	}else{
		$('#searchForm').submit();
	}
}