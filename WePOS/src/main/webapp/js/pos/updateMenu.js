function productInfo(code,name,price,stock,desc,categoryCode){
	$('#menuInfoTag').text("상품 수정");
	$('#productCode').attr("style","visibility:visibility;text-align:center;color:blue;border:0;")
	$('#productCode').val(code);
	$('#productName').val(name);
	$('#productPrice').val(price);
	$('#productStock').val(stock);
	$('#productDesc').val(desc);
	$('#categoryCode').val(categoryCode);
}