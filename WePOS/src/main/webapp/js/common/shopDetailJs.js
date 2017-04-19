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
			+ ')"><i class="expand-list rounded-x fa fa-pencil"></i> 수정</a></li><li><a href="javascript:deleteReply(' 
			+"'" + replyNumber + "'" + ')"><i class="expand-list rounded-x fa fa-times"></i> 삭제</a></li>');
}

function shopBoardReplyUpdate(replyNumber)
{
	var replyContent = $("#updateReply" + replyNumber).val();
	var pageNum = $("#pageNum").val();
	var boardNumber = $("#boardNumber").val()
	$.get("shopBoardReplyUpdate.do", {replyNumber : replyNumber, replyContent : replyContent, boardNumber : boardNumber, pageNum : pageNum}, function(result)
	{		
		alert("수정되었습니다.");
		$("#replyDiv").html(result);
	})
}

function deleteReply(replyNumber)
{
	var flag = confirm("댓글을 삭제하시겠습니까?");
	
	if(flag)
	{
		var boardNumber = $("#boardNumber").val()
		$.get("shopBoardReplyDelete.do", {replyNumber : replyNumber, boardNumber : boardNumber}, function(result)
		{
			alert("삭제되었습니다.");
			$("#replyDiv").html(result);
		})
	}
	else
	{
		return false;
	}
}

function shopBoardWrite()
{
	if($("#boardTitle").val() == "" || $("#boardTitle").val() == null)
	{
		alert("제목을 입력해주세요.")
		return false;
	}
	document.shopBoardWriteForm.submit();
}

function shopBoardUpdate()
{
	if($("#boardTitle").val() == "" || $("#boardTitle").val() == null)
	{
		alert("제목을 입력해주세요.")
		return false;
	}
	document.shopBoardUpdateForm.submit();
}

function shopBoardDelete(boardNumber, shopCode, fileName, menuType)
{
	var flag = confirm("글을 삭제하시겠습니까?");
	
	if(flag)
	{
		alert("삭제되었습니다.");
		location.href = 'shopBoardDelete.do?boardNumber=' + boardNumber + '&shopCode=' + shopCode + '&boardFile=' + fileName
		+ '&menuType=' + menuType;
	}
	else
	{
		return false;
	}
}

function shopNoticeWrite()
{
	if($("#noticeTitle").val() == "" || $("#noticeTitle").val() == null)
	{
		alert("제목을 입력해주세요.")
		return false;
	}	
	document.shopNoticeWriteForm.submit();
}	

function shopNoticeUpdate()
{
	if($("#noticeTitle").val() == "" || $("#noticeTitle").val() == null)
	{
		alert("제목을 입력해주세요.")
		return false;
	}
	document.shopNoticeUpdateForm.submit();
}

function shopNoticeDelete(noticeNumber, shopCode, fileName, menuType)
{
	var flag = confirm("글을 삭제하시겠습니까?");
	
	if(flag)
	{
		alert("삭제되었습니다.");		
		location.href = 'shopNoticeDelete.do?noticeNumber=' + noticeNumber + '&shopCode=' + shopCode + '&noticeFile=' + fileName 
			+ '&menuType=' + menuType;
	}
	else
	{
		return false;
	}
}


function productGradeCancle(productCode, gradeComment, grade)
{		
	if(grade == 0)
	{
		$("#userGradeDiv" + productCode + "> form > div > input:radio:checked").attr("checked", false);
	}
	else
	{
		$("#userGradeDiv" + productCode + "> form > div > input:radio:input[id=quality-" + grade + "-" + productCode + "]").attr("checked", true);
	}	
	$("#gradeComment" + productCode).val(gradeComment);
	$("#userGradeDiv" + productCode).hide();
}

function productGrade(productCode)
{	
	var grade = $("#userGradeDiv" + productCode + "> form > div > input:radio:checked").val();
	
	if(grade == 0)
	{
		alert("평점을 선택하세요.(1점 이상)");
		return false;
	}
	
	params = $("#gradeForm" + productCode).serialize();
		
	$.ajax({
		type : "get",
		url : "../user/productGrade.do",
		data : params,
		dataType : "html",
		success : function(data)
		{
			alert("평점이 등록되었습니다.");
			$("#productListTab").html(data);
		}
	})	
}

function productGradeUpdate(productCode)
{	
	var grade = $("#userGradeDiv" + productCode + "> form > div > input:radio:checked").val();
	
	if(grade == 0)
	{
		alert("평점을 선택하세요.(1점 이상)");
		return false;
	}
	
	params = $("#gradeUpdateForm" + productCode).serialize();
	
	$.ajax({
		type : "get",
		url : "../user/productGradeUpdate.do",
		data : params,
		dataType : "html",
		success : function(data)
		{
			alert("평점이 수정되었습니다.");
			$("#productListTab").html(data);
		}
	})	
}

function productGradeDelete(productCode)
{		
	var flag = confirm("평점을 삭제하시겠습니까?");
	
	if(flag)
	{
		params = $("#gradeUpdateForm" + productCode).serialize();
		
		$.ajax({
			type : "get",
			url : "../user/productGradeDelete.do",
			data : params,
			dataType : "html",
			success : function(data)
			{
				alert("평점이 삭제되었습니다.");
				$("#productListTab").html(data);
			}
		})			
	}
	else
	{
		return false;
	}	
}

function productGradeModal(productCode, productName)
{
	$("#productGradeModal").html("");	
	
	$.get("../user/productGradeModal.do", {productCode : productCode, productName : productName}, function(result)
	{		
		$("#productGradeModal").append(result);		
	})	
}

function gradeModalPaging(pageNum)
{
	var productCode = $("#productCode").val();
	var productName = $("#productName").val();
	
	$("#productGradeModal").html("");	
	
	$.get("../user/productGradeModal.do", {productCode : productCode, productName : productName, pageNum : pageNum}, function(result)
	{		
		$("#productGradeModal").append(result);		
	})	
	
}


