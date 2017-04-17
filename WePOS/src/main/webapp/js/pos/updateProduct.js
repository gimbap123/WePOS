function productInfo(code,name,price,stock,desc,categoryCode,countOrder){
	$('#productInfoTag').text("메뉴 수정");
	$('#productName').prop("disabled",false);
	$('#productCode').attr("style","visibility:visibility;text-align:center;color:blue;border:0;")
	$('#productCode').val(code);
	$('#productName').val(name);
	$('#productPrice').val(price);
	$('#productStock').val(stock);
	$('#productDesc').val(desc);
	$('#categoryCode').val(categoryCode);
	$('#countOrder').val(countOrder);
	$('#okButton').prop("disabled",false);
	$('#deleteButton').prop("disabled",false);
}

function checkNull(){
	if($('#categoryCode').val()==999){
		alert("상품 분류를 선택하세요")
		return false;
	}
		
	if($('#productName').val()=='' || $('#productPrice').val()=='' || $('#productStock').val()=='' || $('#productDesc').val()=='' || $('#categoryCode').val()==''){
		alert("공란이 존재합니다.");
		return false;
	}
	
	var exptext= /^[0-9]{1,12}$/;
	if(exptext.test($('#productPrice').val())==false ||  $('#productPrice').val().indexOf(' ') > -1 || $('#productPrice').val()<100){
		alert("가격을 확인하세요");
		$('#productPrice').focus();
		return false;
	}if(exptext.test($('#productStock').val())==false ||  $('#productStock').val().indexOf(' ') > -1 || $('#productStock').val()<0){
		alert("재고를 확인하세요");
		$('#productStock').focus();
		return false;
	}if ($('#checkResult').val() == 1){
		alert("상품명을 확인하세요");
		$('#productName').focus();
		return false;
	}
	else{
		if($('#productCode').val()!='')
			$('#updateProductForm').submit();
	}		
}

function checkProductName(){
	$.ajax({	 
		url : 'checkProductName.do?productName=' + $('#productName').val()+'&shopCode='+$('#shopCode').val(),
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

function createProduct(){
	$('#productName').prop("disabled",false);
	if($('#categoryCode option').size()==1){
		alert("상품분류를 먼저 등록하세요");
		return false;
	}
	else{
		$('#productInfoTag').text("메뉴 추가");
		$('#productCode').val(0);
		$('#productName').val('');
		$('#productPrice').val('');
		$('#productStock').val('');
		$('#productDesc').val('');
		$('#categoryCode').val(999);
		$('#countOrder').val(0);
		$('#productName').attr("placeholder","메뉴명 입력");
		$('#productPrice').attr("placeholder","가격 입력");
		$('#productStock').attr("placeholder","재고량 입력");
		$('#productDesc').attr("placeholder","메뉴 설명 입력");
		$('#productCode').attr("style","visibility:hidden");
		
		$('#okButton').prop("disabled",false);
		$('#deleteButton').prop("disabled",true);
	}
	
}

function deleteProduct(mgrId){
	if($('#countOrder').val()!=0){
		alert("삭제 불가 : 주문 내역이 존재합니다");
		return false;
	}
	else{
		var deleteproduct=confirm("상품명 : "+$('#productName').val()+"\r삭제하시겠습니까?")
		if(deleteproduct==true){
			location.href="deleteProduct.do?productCode="+$('#productCode').val()+"&mgrId="+mgrId;
	}
	}
		
		
}

