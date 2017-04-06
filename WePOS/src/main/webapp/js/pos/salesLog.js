function checkForm(){
	if($('#calendarBegin').val()==''){
		alert("시작일을 확인해주세요");
		return false;
	}else if($('#calendarEnd').val()==''){
		alert("종료일을 확인해주세요");
		return false;
	}else if($('#productCode').val()==999){
		alert("메뉴를 선택해주세요");
		return false;
	}else if($('#searchType').val()==999){
		alert("정렬방식을 선택해주세요");
		return false;
	}else{
		$('#searchForm').submit();
	}
}