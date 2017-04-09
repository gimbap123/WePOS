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
			$("#productListTab").html(result);
		})		
	}
	else if(tabType == "shopTableInfoTab")
	{
		$.get("shopTableInfo.do", {shopCode : shopCode}, function(result)
		{			
			$("#shopTableInfoTab").html(result);
		})	
	}
	else
	{
		alert(tabType);
	}
}

function productListPaging(pageNum)
{
	var shopCode = $("#shopCode").val()
	var categoryCode = $("#categoryCode").val()
	
	$.get("productList.do", {shopCode : shopCode, pageNum : pageNum, categoryCode : categoryCode}, function(result)
	{			
		$("#productListTab").html(result);
	})	
}

