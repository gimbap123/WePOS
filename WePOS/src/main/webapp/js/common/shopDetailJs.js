/**
 * shopDetail.jsp의 자바스크립트
 */

function tabClick(tabType)
{	
	var shopCode = $("#shopCode").val()
	
	if(tabType == "shopNoticeTab")
	{
		$.get("shopNotice.do", {shopCode : shopCode}, function(result)
		{			
			$("#shopNoticeTab").html(result);
		})
	}
	else if(tabType == "productListTab")
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


function searchShopNotice(pageNum)
{
	var shopCode = $("#shopCode").val()
	var searchType = $("#searchType").val()
	var searchText = $("#searchText").val()
	
	$.get("shopNotice.do", {shopCode : shopCode, searchType : searchType, searchText : searchText, pageNum : pageNum}, function(result)
	{			
		$("#shopNoticeTab").html(result);
	})
}
