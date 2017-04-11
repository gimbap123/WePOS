function tableInfo(tableCode,tableName,tableDesc,tableMax){
	$('#tableCode').val(tableCode);
	$('#tableName').val(tableName);
	$('#tableDesc').val(tableDesc);
	$('#tableMax').val(tableMax);
}

function checkNull(){
	if($('#tableCode').val()==''){
		alert("테이블을 선택하세요")
		return false;
	}
		
	if($('#tableName').val()=='' || $('#tableDesc').val()=='' || $('#tableMax').val()==''){
		alert("공란이 존재합니다.");
		return false;
	}
	
	var exptext= /^[0-9]{1,1}$/;
	if(exptext.test($('#tableMax').val())==false ||  $('#tableMax').val().indexOf(' ') > -1){
		alert("정원은 2~6 사이입니다.");
		$('#tableMax').focus();
		return false;
	}else if($('#tableMax').val()>6)
		alert("정원은 2~6 사이입니다.");
	else
		$('#updateTableForm').submit();
}



