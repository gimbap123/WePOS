/**
 * searchShop.jsp의 자바스크립트
 */

function searchLocal()
{
	var cityCode = $("#cityCode").val();
	
	$("#localCode").html('<option value="0">시, 군</option>');
	
	if(cityCode == 0)
	{			
		return;
	}
		
	$.post("../admin/searchLocal.do", {cityCode : cityCode}, function(result)
	{			
		$("#localCode").append(result);
	})		
}
