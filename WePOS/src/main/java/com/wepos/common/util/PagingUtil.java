
package com.wepos.common.util;

public class PagingUtil {
	
	private int startCount;	 // 한 페이지에서 보여줄 게시글의 시작 번호
	private int endCount;	 // 한 페이지에서 보여줄 게시글의 끝 번호
	private StringBuffer pagingHtml;// 페이징 생성자

	/**
	 * currentPage : 현재페이지
	 * totalCount : 전체 게시물 수
	 * blockCount : 한 페이지의  게시물의 수
	 * blockPage : 한 화면에 보여줄 페이지 수
	 * pageUrl : 호출 페이지 url
	 * addKey : 부가적인 key 없을 때는 null 처리 (&num=23형식으로 전달할 것)
	 * boardTypeCode : 게시판 타입 코드로 0이면 게시판 페이지에 대한 페이징 처리가 아니다., 1이상이면 게시판 페이지에 대한 페이징 처리
	 * */
	public PagingUtil(int currentPage, int totalCount, int blockCount,
			int blockPage, String pageUrl) {
		this(null,currentPage,totalCount,blockCount,blockPage,pageUrl,null);
	}
	
	public PagingUtil(String paramString, int currentPage, int totalCount, int blockCount,
			int blockPage, String pageUrl) {
		this(paramString,currentPage,totalCount,blockCount,blockPage,pageUrl,null);
	}
	
	public PagingUtil(int currentPage, int totalCount, int blockCount,
			int blockPage, String pageUrl, String addKey) {
		this(null,currentPage,totalCount,blockCount,blockPage,pageUrl,addKey);
	}		
	
	public PagingUtil(String paramString, int currentPage, int totalCount, int blockCount,
			int blockPage,String pageUrl,String addKey) {
		
		if(addKey == null) addKey = ""; //부가키가 null 일때 ""처리
		
		// 전체 페이지 수
		int totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}
		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCount = (currentPage - 1) * blockCount + 1;
		endCount = currentPage * blockCount;
		// 시작 페이지와 마지막 페이지 값 구하기.
		int startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		int endPage = startPage + blockPage - 1;
		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		// 이전 block 페이지
		pagingHtml = new StringBuffer();		
		pagingHtml.append("<div class=\"text-center\">");
		pagingHtml.append("<ul class=\"pagination\">");		
		if (currentPage > blockPage) 
		{
			pagingHtml.append("<li>");
			
			
			if(pageUrl == null)
			{
				pagingHtml.append("<a href='"+paramString + "(" + (startPage - 1) + ")'>");
			}
			else
			{
				if(paramString==null)
				{
					pagingHtml.append("<a href="+pageUrl+"?pageNum="+ (startPage - 1) + addKey +">");
				}
				else
				{	
					pagingHtml.append("<a href="+pageUrl+paramString+"&pageNum="+ (startPage - 1) + addKey +">");								
				}			
			}						
								
			pagingHtml.append("이전");
			pagingHtml.append("</a></li>");
		}
		
		for (int i = startPage; i <= endPage; i++) 
		{
			if (i > totalPage) 
			{
				break;
			}
			
			if (i == currentPage) 
			{
				pagingHtml.append("<li class=\"active\"><a href=\"#\">");
				pagingHtml.append(i);
				pagingHtml.append("</a></li>");
			} 
			else 
			{
				pagingHtml.append("<li>");				
				
				if(pageUrl == null)
				{
					pagingHtml.append("<a href='"+paramString+"(");
					pagingHtml.append(i);
					pagingHtml.append(")'>");
				}
				else
				{
					if(paramString==null)
					{
						pagingHtml.append("<a href='"+pageUrl+"?pageNum=");
					}
					else
					{					
						pagingHtml.append("<a href='"+pageUrl+paramString+"&pageNum=");										
					}
					
					pagingHtml.append(i);
					pagingHtml.append(addKey+"'>");					
				}
				pagingHtml.append(i);
				pagingHtml.append("</a></li>");
			}			
		}
		
		// 다음 block 페이지
		if (totalPage - startPage >= blockPage) 
		{
			pagingHtml.append("<li>");
			
			if(pageUrl == null)
			{
				pagingHtml.append("<a href='"+paramString+"("+ (endPage + 1) + ")'>");
			}
			else
			{
				if(paramString==null)
				{
					pagingHtml.append("<a href="+pageUrl+"?pageNum="+ (endPage + 1) + addKey +">");
				}
				else
				{
					pagingHtml.append("<a href="+pageUrl+paramString+"&pageNum="+ (endPage + 1) + addKey +">");
				}		
			}	
						
			pagingHtml.append("다음");
			pagingHtml.append("</a></li>");
		}		
		
		pagingHtml.append("</ul>");
		pagingHtml.append("</div>");
		
	}
	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}
	public int getStartCount() {
		return startCount;
	}
	public int getEndCount() {
		return endCount;
	}
}
