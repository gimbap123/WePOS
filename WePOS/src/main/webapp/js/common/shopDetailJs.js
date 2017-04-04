/**
 * shopDetail.jsp의 자바스크립트
 */

function tabClick()
{	
	var shopCode = $("#shopCode").val()
	
	if($("#productList").html() != "")
	{	
		return;
	}
	else
	{
		$.get("productList.do", {shopCode : shopCode}, function(result)
		{			
			$("#productList").append(result);
		})
	}		
}

