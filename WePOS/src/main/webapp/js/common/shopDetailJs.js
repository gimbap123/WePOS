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
	else if(tabType == "shopTableInfoTab")
	{
		$.get("shopTableInfo.do", {shopCode : shopCode}, function(result)
		{			
			$("#shopTableInfo").html(result);
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
	
	$.get("productList.do", {shopCode : shopCode, pageNum : pageNum}, function(result)
	{			
		$("#productList").html(result);
	})	
}

