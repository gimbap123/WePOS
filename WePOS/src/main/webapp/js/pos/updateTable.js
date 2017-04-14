function tableInfo(tableCode,tableName,tableDesc,tableMax){
	$('#tableInfoTag').text("테이블 정보");
	$('#tableCode').attr("style","visibility:visibility;text-align:center;color:blue;border:0;")
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
	}else if($('#tableMax').val()>6 || $('#tableMax').val()<1)
		alert("정원은 2~6 사이입니다.");
	else{
		if($('#tableCode').val()!='')
			$('#updateTableForm').submit();			
	}
		
}

function create(){
	$('#tableInfoTag').text("테이블 추가");
	$('#tableCode').val(0);
	$('#tableName').val('');
	$('#tableDesc').val('');
	$('#tableMax').val('');
	$('#tableName').attr("placeholder","테이블명 입력");
	$('#tableDesc').attr("placeholder","테이블 설명 입력");
	$('#tableMax').attr("placeholder","정원 : 2~6명");
	$('#tableCode').attr("style","visibility:hidden");
}

function deleteTable(tableCode,mgrId){
	var deleteTable=confirm("테이블을 삭제하시겠습니까?")
	if(deleteTable==true)
		location.href="deleteTable.do?tableCode="+tableCode+"&mgrId="+mgrId;
}


