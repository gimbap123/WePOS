/**
 * posShopNotice.jsp의 자바스크립트
 */

function searchShopNotice(pageNum)
{
	var shopCode = $("#shopCode").val()
	var searchNoticeType = $("#searchNoticeType").val()
	var searchNoticeText = $("#searchNoticeText").val()
	
	location.href = "../pos/posShopNotice.do?shopCode=" + shopCode + "&searchNoticeType=" + searchNoticeType
		+ "&searchNoticeText=" + searchNoticeText;
}