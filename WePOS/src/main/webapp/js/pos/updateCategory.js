function categoryInfo(code,name,count){
	$('#categoryInfoTag').text("상품분류 수정");
	$('#categoryName').prop("disabled",false);
	$('#categoryCode').attr("style","visibility:visibility;text-align:center;color:blue;border:0;")
	$('#categoryCode').val(code);
	$('#categoryName').val(name);
	$('#countProduct').text(count);
	$('#okButton').prop("disabled",false);
	$('#deleteButton').prop("disabled",false);
}

function checkCategoryName(){
	$.ajax({	 
		url : 'checkCategoryName.do?categoryName=' + $('#categoryName').val()+'&shopCode='+$('#shopCode').val(),
		type : 'post',
		success : function(data) {
			$('#checkNameTh').html(data);
			if ($('#checkResult').val() == 1) {
				$('#checkNameTh').attr("style","color:red");
				return false;
			}
			if ($('#checkResult').val() == 0) {
				$('#checkNameTh').attr("style","color:blue");
				return false;
			}
		}
	});
}

function checkNull(){
	if($('#checkResult').val()==1)
	{
		$('#checkNameTh').attr("style","color:red");
		alert("상품분류명을 확인해주세요.");
		$('#categoryName').focus();
		return false;
	}
	if($('#categoryCode').val()==999){
		alert("상품 분류를 선택하세요")
		return false;
	}
		
	if($('#categoryName').val()=='' || $('#categoryName').val().indexOf(' ') > -1){
		alert("띄어쓰기 불가");
		return false;
	}else{
		$('#updateCategoryForm').submit();
	}
		
}

function createCategory(){
	$('#categoryName').prop("disabled",false);
	$('#checkNameTh').val('');
	$('#categoryInfoTag').text("상품분류 추가");
	$('#categoryCode').val(0);
	$('#categoryName').val('');
	$('#categoryName').attr("placeholder","상품분류명 입력");
	$('#categoryCode').attr("style","visibility:hidden");
	$('#okButton').prop("disabled",false);
	$('#deleteButton').prop("disabled",true);
}

function deleteCategory(mgrId){
	if($('#countProduct').text()>0){
		alert("현재 상품분류에 등록된 상품이 존재합니다.")
		return false;
	}else{
		var deletecategory=confirm("상품분류명 : "+$('#categoryName').val()+"\r삭제하시겠습니까?")
		if(deletecategory==true)
			location.href="deleteCategory.do?categoryCode="+$('#categoryCode').val()+"&mgrId="+mgrId;
	}
		
	
}

