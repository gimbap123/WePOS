/**
 * shopRegistration.jsp의 자바스크립트
 */

function searchLocal()
{
	var cityCode = document.shopRegForm.cityCode.value
	
	$("#localCode").html('<option value="0">시, 군을 선택하세요.</option>');
	
	if(cityCode == 0)
	{		
		return;
	}		
		
	$.post("searchLocal.do", {cityCode : cityCode}, function(result)
	{			
		$("#localCode").append(result);
	})		
}

function checkShopRegistration()
{
	if($("#shopName").val() == "" || $("#shopName").val() == null)
	{
		alert("매장 이름은 입력하세요.");
		$("#shopName").focus();
		return;
	}
	
	if($("#shopTypeCode").val() == 0)
	{
		alert("매장 종류를 선택하세요.");
		$("#shopTypeCode").focus();
		return;
	}
	
	if($("#cityCode").val() == 0)
	{
		alert("지역을 선택하세요.");		
		$("#cityCode").focus();
		return;
	}
	
	if($("#localCode").val() == 0)
	{
		alert("시, 군을 선택하세요.");
		$("#localCode").focus();	
		return;
	}
	
	if($("#shopAddress").val() == "" || $("#shopAddress").val() == null)
	{
		alert("나머지 주소를 입력하세요.");
		$("#shopAddress").focus();
		return;
	}
	
	alert("매장 추가 성공");
	document.shopRegForm.submit();
}
