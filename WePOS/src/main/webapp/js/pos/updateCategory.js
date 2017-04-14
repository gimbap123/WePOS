function categoryInfo(code,name){
	$('#categoryInfoTag').text("상품 수정");
	$('#categoryCode').attr("style","visibility:visibility;text-align:center;color:blue;border:0;")
	$('#categoryCode').val(code);
	$('#categoryName').val(name);
	$('#okButton').prop("disabled",false);
	$('#deleteButton').prop("disabled",false);
}

function checkNull(){
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
	$('#categoryInfoTag').text("상품분류 추가");
	$('#categoryCode').val(0);
	$('#categoryName').val('');
	$('#categoryName').attr("placeholder","상품분류명 입력");
	$('#categoryCode').attr("style","visibility:hidden");
	$('#okButton').prop("disabled",false);
	$('#deleteButton').prop("disabled",true);
}

function deleteCategory(mgrId){
	var deletecategory=confirm("상품명 : "+$('#categoryName').val()+"\r삭제하시겠습니까?")
	if(deletecategory==true)
		location.href="deleteCategory.do?categoryCode="+$('#categoryCode').val()+"&mgrId="+mgrId;
}

