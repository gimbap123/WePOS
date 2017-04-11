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

function replyListPaging(pageNum)
{
	var boardNumber = $("#boardNumber").val()
	
	$.get("shopBoardReply.do", {pageNum : pageNum, boardNumber : boardNumber}, function(result)
	{			
		$("#replyDiv").html(result);
	})
}

function updateReply(replyNumber, replyContent)
{
	var contentDiv = $("#contentDiv" + replyNumber);
	var functionUl = $("#functionUl" + replyNumber);
	
	contentDiv.html('<div class="input-group" style="margin-bottom: 20px;"><textarea class="form-control" rows="3" style="resize: none;" id="updateReply' +replyNumber + '">' 
			+ replyContent + '</textarea><span class="input-group-btn"><button class="btn-u" type="button" style="height: 74px;" onclick="shopBoardReplyUpdate(' + replyNumber + ')">수정</button>' 
			+ '</span></div>');
	functionUl.html('<li><a href="javascript:updateCancelReply(' + "'" + replyNumber + "', '" + replyContent + "'" 
			+ ')"><i class="expand-list rounded-x fa fa-pencil"></i> 취소</a></li>');
}

function updateCancelReply(replyNumber, replyContent)
{
	var contentDiv = $("#contentDiv" + replyNumber);
	var functionUl = $("#functionUl" + replyNumber);
	
	contentDiv.html('<p>' + replyContent + '</p>');
	functionUl.html('<li><a href="javascript:updateReply(' + "'" + replyNumber + "', '" + replyContent + "'" 
			+ ')"><i class="expand-list rounded-x fa fa-pencil"></i> 수정</a></li><li><a href="#"><i class="expand-list rounded-x fa fa-times"></i> 삭제</a></li>');
}

function shopBoardReplyUpdate(replyNumber)
{
	var replyContent = $("#updateReply" + replyNumber).val();
	var pageNum = $("#pageNum").val();
	var boardNumber = $("#boardNumber").val()
	$.get("shopBoardReplyUpdate.do", {replyNumber : replyNumber, replyContent : replyContent, boardNumber : boardNumber, pageNum : pageNum}, function(result)
	{			
		$("#replyDiv").html(result);
	})
}

