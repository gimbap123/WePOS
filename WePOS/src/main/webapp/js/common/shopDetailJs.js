/**
 * shopDetail.jsp의 자바스크립트
 */

function tabClick(tabType)
{	
	var shopCode = $("#shopCode").val()
	
	if(tabType == "productListTab")
	{
		$.get("productList.do", {shopCode : shopCode}, function(result)
		{			
			$("#productList").html(result);
		})		
	}
	else
	{
		alert(tabType);
	}
}

