/**
 * shopInfoUpdate.jsp의 자바스크립트
 */

function searchLocal()
{
	var cityCode = document.shopInfoUpdateForm.cityCode.value
	
	$("#localCode").html('<option value="0">시, 군을 선택하세요.</option>');
	
	if(cityCode == 0)
	{		
		return;
	}		
		
	$.post("../admin/searchLocal.do", {cityCode : cityCode}, function(result)
	{			
		$("#localCode").append(result);
	})		
}