function checkForm(){
	if($('#calendarBegin').val()==''){
		alert("시작일을 확인해주세요");
	}else if($('#calendarEnd').val()==''){
		alert("종료일을 확인해주세요");
	}else{
		calendarBegin=$('#calendarBegin').val()
		calendarEnd=$('#calendarEnd').val()
		$('#searchForm').submit();
	}
}