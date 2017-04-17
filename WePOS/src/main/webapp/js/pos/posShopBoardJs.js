/**
 * posShopBoard.jsp의 자바스크립트
 */

function searchShopBoard(pageNum)
{
	var shopCode = $("#shopCode").val()
	var searchNoticeType = $("#searchNoticeType").val()
	var searchNoticeText = $("#searchNoticeText").val()
	
	location.href = "../pos/posShopBoard.do?shopCode=" + shopCode + "&searchNoticeType=" + searchNoticeType
		+ "&searchNoticeText=" + searchNoticeText;
}