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
	else if(tabType == "shopBoardTab")
	{
		$.get("shopBoard.do", {shopCode : shopCode}, function(result)
		{
			$("#shopBoardTab").html(result);
		})
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
	var searchNoticeType = $("#searchNoticeType").val()
	var searchNoticeText = $("#searchNoticeText").val()
	
	$.get("shopNotice.do", {shopCode : shopCode, searchNoticeType : searchNoticeType, searchNoticeText : searchNoticeText, pageNum : pageNum}, function(result)
	{			
		$("#shopNoticeTab").html(result);
	})
}

function searchShopBoard(pageNum)
{
	var shopCode = $("#shopCode").val()
	var searchBoardType = $("#searchBoardType").val()
	var searchBoardText = $("#searchBoardText").val()
	
	$.get("shopBoard.do", {shopCode : shopCode, searchBoardType : searchBoardType, searchBoardText : searchBoardText, pageNum : pageNum}, function(result)
	{			
		$("#shopBoardTab").html(result);
	})
}

