package com.wepos.common.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.admin.dao.AdminDao;
import com.wepos.admin.dto.CityDto;
import com.wepos.admin.dto.LocalDto;
import com.wepos.admin.dto.ShopTypeDto;
import com.wepos.common.dao.ShopDao;
import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopBoardDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.util.PagingUtil;
import com.wepos.mgr.dto.CategoryDto;
import com.wepos.mgr.dto.ShopNoticeDto;

@Controller
public class SearchShopController {

  @Autowired
  private ShopDao shopDao;
  
  @Autowired
  private AdminDao adminDao;
    
  // 매장 검색
  @RequestMapping(value = "/common/searchShop.do", method = RequestMethod.GET)
  public ModelAndView searchShopView(HttpServletRequest request, 
		  @RequestParam(value="pageNum", defaultValue="1") int currentPage, 
		  @ModelAttribute ShopDto shop)
  {
	  String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile\\";
	  int index = filePath.lastIndexOf("\\WePOS");
	  filePath = filePath.substring(index);
	  
	  if("".equals(shop.getShopName()))
	  {
		  shop.setShopName(null);
	  }
	  
	  Map<String, Object> map = new HashMap<String, Object>();
	  map.put("shopName", shop.getShopName());
	  map.put("shopTypeCode", shop.getShopTypeCode());
	  map.put("cityCode", shop.getCityCode());
	  map.put("localCode", shop.getLocalCode());
	  
	  int shopCount = shopDao.searchShopCount(map);
	  PagingUtil page = null;
	  if(shop.getShopTypeCode() == 0 && shop.getCityCode() == 0 && shop.getLocalCode() == 0 
			  && shop.getShopName() == null)
	  {
		  page = new PagingUtil(currentPage, shopCount, 6, 5, "searchShop.do");
	  }
	  else
	  {
		  String paramString = "";
		  if(shop.getShopName() == null)
		  {
			  paramString = "?shopTypeCode=" + shop.getShopTypeCode() +
					  "&cityCode=" + shop.getCityCode() + "&localCode=" + shop.getLocalCode();
		  }
		  else
		  {
			  paramString = "?shopName=" + shop.getShopName() + "&shopTypeCode=" + shop.getShopTypeCode() +
					  "&cityCode=" + shop.getCityCode() + "&localCode=" + shop.getLocalCode();
		  }
		 
		  page = new PagingUtil(paramString, currentPage, shopCount, 6, 5, "searchShop.do");
	  }	  
	  	  
	  map.put("start", page.getStartCount());
	  map.put("end", page.getEndCount());	  
	  
	  List<ShopDto> shopList = null;
	  
	  if(shopCount > 0)
	  {
		  shopList = shopDao.searchShop(map);
		  for(ShopDto resultShop : shopList)
		  {
			  if(resultShop.getShopFile() != null)
			  {
				  String fileName = resultShop.getShopFile();		
				  resultShop.setShopFile(filePath + fileName);
			  }
			  else
			  {
				  resultShop.setShopFile("/WePOS/uploadFile/nullImg.jpg");
			  }		  
		  }	 		  		  
	  }  
	  else
	  {
		  shopList = Collections.emptyList();
	  }
	  
	  List<ShopTypeDto> shopTypeList = adminDao.getShopType();
	  List<CityDto> cityList = adminDao.getCity();
	  
	  List<LocalDto> localList = null;
	  
	  if(shop.getCityCode() != 0)
	  {
		  localList = adminDao.searchLocal(shop.getCityCode());
	  }
	  
	  ModelAndView mav = new ModelAndView();
	  mav.setViewName("common/searchShop");
	  mav.addObject("shopList", shopList);
	  mav.addObject("shopCount", shopCount);
	  mav.addObject("shopTypeList", shopTypeList);
	  mav.addObject("cityList", cityList);
	  mav.addObject("localList", localList);
	  mav.addObject("pagingHtml", page.getPagingHtml());
	  
	  mav.addObject("shopTypeCode", shop.getShopTypeCode());
	  mav.addObject("cityCode", shop.getCityCode());
	  mav.addObject("localCode", shop.getLocalCode());
	  mav.addObject("shopName", shop.getShopName());
	  
	  return mav;
  }
  
  	//매장 상세보기
	@RequestMapping(value="/common/shopDetail.do")
	public ModelAndView shopDetailView(HttpServletRequest request, 
			@RequestParam("shopCode") int shopCode) throws Exception
	{
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile\\";
		int index = filePath.indexOf("\\WePOS");
		filePath = filePath.substring(index);
		ShopDto shop = shopDao.getShopDetail(shopCode);
		String trimAddress = shop.getShopAddress().replaceAll("\\p{Z}", "");
		
		// 파일 경로 설정
		if(shop.getShopFile() != null)
		{
			String fileName = shop.getShopFile();		
			shop.setShopFile(filePath + fileName);
		}
		else
		{
			shop.setShopFile("/WePOS/uploadFile/nullImg.jpg");
		}
		
		// 주소를 통한 좌표 구하기
		Map<String, String> coordinateMap = new HashMap<String, String>();	
		String url = "http://maps.googleapis.com/maps/api/geocode/json?language=ko&sensor=false&address=" 
				+ trimAddress;
		
		HttpClient httpClient = HttpClientBuilder.create().build();		
		HttpResponse httpResponse = httpClient.execute(new HttpGet(url));
		HttpEntity httpEntity = httpResponse.getEntity(); 
		String content = EntityUtils.toString(httpEntity);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject)jsonParser.parse(content);
		JSONArray jsonArray = (JSONArray)jsonObject.get("results");
		
		for(int i = 0; i < jsonArray.size(); i++)
		{
			JSONObject tempObj = (JSONObject)jsonArray.get(i);
			if(tempObj.get("geometry") != null)
			{
				JSONObject geometry = (JSONObject)tempObj.get("geometry");
				JSONObject location = (JSONObject)geometry.get("location");
				coordinateMap.put("x", (String)location.get("lat").toString());
				coordinateMap.put("y", (String)location.get("lng").toString());				
			}
		}	
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/shopDetail");
		mav.addObject("shop", shop);
		mav.addObject("coordinateMap", coordinateMap);		
		
		return mav;
	}
	
	// 상품 리스트
	@RequestMapping(value="/common/productList.do")
	public ModelAndView productListView(HttpServletRequest request, @RequestParam("shopCode") int shopCode,
			@RequestParam(value="pageNum", defaultValue="1") int currentPage,
			@RequestParam(value="categoryCode", defaultValue="0") int categoryCode)
	{	
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile\\";
		int index = filePath.indexOf("\\WePOS");
		filePath = filePath.substring(index);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("categoryCode", categoryCode);
		
		List<CategoryDto> categoryList = shopDao.categoryList(shopCode);		
		
		int productCount = shopDao.productCount(map);
				
		String paramString = "javascript:productListPaging";
		PagingUtil page = new PagingUtil(paramString, currentPage, productCount, 3, 5, null);
				
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<ProductDto> productList = null;
		
		if(productCount > 0)
		{
			productList = shopDao.productList(map);
			for(ProductDto product : productList)
			{
				if(product.getProductFile() != null)
				{
					String fileName = product.getProductFile();
					product.setProductFile(filePath + fileName);
				}
				else
				{
					product.setProductFile("/WePOS/uploadFile/nullImg.jpg");
				}
			}	 		  		  
		 }
		else
		{
			productList = Collections.emptyList();
		}
		
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("common/productListTab");
		mav.addObject("productList", productList);
		mav.addObject("categoryList", categoryList);
		mav.addObject("categoryCode", categoryCode);
		mav.addObject("pagingHtml", page.getPagingHtml()); 
		
		return mav;
	}
	
	// 매장 테이블 현황
	@RequestMapping(value="/common/shopTableInfo.do")
	public ModelAndView shopTableInfoView(@RequestParam("shopCode") int shopCode)
	{
		Map<String, Object> tableInfoMap = shopDao.shopTableInfo(shopCode);
		
		ModelAndView mav = new ModelAndView();		
		mav.setViewName("common/shopTableInfoTab");
		mav.addObject("tableInfoMap", tableInfoMap);
		
		return mav;
	}
		
	// 매장 공지사항
	@RequestMapping(value="/common/shopNotice.do")
	public ModelAndView shopNodticeView(HttpServletRequest request, @RequestParam("shopCode") int shopCode,
			@RequestParam(value="searchNoticeType", defaultValue="all") String searchNoticeType, 
			@RequestParam(value="searchNoticeText", defaultValue="") String searchNoticeText,
			@RequestParam(value="pageNum", defaultValue="1") int currentPage)
	{		
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile\\";
		int index = filePath.indexOf("\\WePOS");
		filePath = filePath.substring(index);
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("searchType", searchNoticeType);
		map.put("searchText", searchNoticeText);
		
		int shopNoticeCount = shopDao.shopNoticeCount(map);	
		
		String paramString = "javascript:searchShopNotice";
		PagingUtil page = new PagingUtil(paramString, currentPage, shopNoticeCount, 5, 5, null);
				
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<ShopNoticeDto> shopNoticeList = null;
		
		if(shopNoticeCount > 0)
		{
			shopNoticeList = shopDao.shopNoticeList(map);
			for(ShopNoticeDto shopNotice : shopNoticeList)
			{
				if(shopNotice.getNoticeFile() != null)
				{
					String fileName = shopNotice.getNoticeFile();
					shopNotice.setNoticeFile(filePath + fileName);
				}
				else
				{
					shopNotice.setNoticeFile("/WePOS/uploadFile/nullImg.jpg");
				}
			}	 		  		  
		 }
		else
		{
			shopNoticeList = Collections.emptyList();
		}
		
		Map<String, Object> searchNoticeTypeList = new HashMap<String, Object>();
		searchNoticeTypeList.put("all", "전체");
		searchNoticeTypeList.put("mgr_id", "작성자");
		searchNoticeTypeList.put("notice_title", "제목");
		searchNoticeTypeList.put("notice_content", "내용");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/shopNoticeTab");
		mav.addObject("shopNoticeList", shopNoticeList);
		mav.addObject("shopNoticeCount", shopNoticeCount);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		mav.addObject("searchNoticeType", searchNoticeType);
		mav.addObject("searchNoticeText", searchNoticeText);
		mav.addObject("searchNoticeTypeList", searchNoticeTypeList);
		
		return mav;
	}
	
	// 매장 공지사항 상세보기
	@RequestMapping(value="/common/shopNoticeDetail.do")
	public ModelAndView shopNodticeDetailView(HttpServletRequest request, @RequestParam("noticeNumber") int noticeNumber)
	{
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile\\";
		int index = filePath.indexOf("\\WePOS");
		filePath = filePath.substring(index);
		
		shopDao.addNoticeReadCnt(noticeNumber);
		ShopNoticeDto shopNotice = shopDao.shopNoticeDetail(noticeNumber);		
		
		String fileName = null;
		
		if(shopNotice.getNoticeFile() != null)
		{
			fileName = shopNotice.getNoticeFile();
			shopNotice.setNoticeFile(filePath + fileName);
		}
		else
		{
			shopNotice.setNoticeFile(null);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/shopNoticeDetail");
		mav.addObject("shopNotice", shopNotice);
		mav.addObject("fileName", fileName);
		
		return mav;
	}
	
	// 매장 자유 게시판
	@RequestMapping(value="/common/shopBoard.do")
	public ModelAndView shopBoardView(HttpServletRequest request, @RequestParam("shopCode") int shopCode,
			@RequestParam(value="searchBoardType", defaultValue="all") String searchBoardType, 
			@RequestParam(value="searchBoardText", defaultValue="") String searchBoardText,
			@RequestParam(value="pageNum", defaultValue="1") int currentPage)
	{		
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile\\";
		int index = filePath.indexOf("\\WePOS");
		filePath = filePath.substring(index);
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("searchType", searchBoardType);
		map.put("searchText", searchBoardText);
		
		int shopBoardCount = shopDao.shopBoardCount(map);	
		
		String paramString = "javascript:searchShopBoard";
		PagingUtil page = new PagingUtil(paramString, currentPage, shopBoardCount, 5, 5, null);
				
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<ShopBoardDto> shopBoardList = null;
		
		if(shopBoardCount > 0)
		{
			shopBoardList = shopDao.shopBoardList(map);
			for(ShopBoardDto shopBoard : shopBoardList)
			{
				if(shopBoard.getBoardFile() != null)
				{
					String fileName = shopBoard.getBoardFile();
					shopBoard.setBoardFile(filePath + fileName);
				}
				else
				{
					shopBoard.setBoardFile("/WePOS/uploadFile/nullImg.jpg");
				}
			}	 		  		  
		 }
		else
		{
			shopBoardList = Collections.emptyList();
		}
		
		Map<String, Object> searchBoardTypeList = new HashMap<String, Object>();
		searchBoardTypeList.put("all", "전체");
		searchBoardTypeList.put("total_id", "작성자");
		searchBoardTypeList.put("board_title", "제목");
		searchBoardTypeList.put("board_content", "내용");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/shopBoardTab");
		mav.addObject("shopBoardList", shopBoardList);
		mav.addObject("shopBoardCount", shopBoardCount);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		mav.addObject("searchBoardType", searchBoardType);
		mav.addObject("searchBoardText", searchBoardText);
		mav.addObject("searchBoardTypeList", searchBoardTypeList);
		return mav;
	}
	
	// 매장 자유게시판 상세보기
	@RequestMapping(value="/common/shopBoardDetail.do")
	public ModelAndView shopBoardDetailView(HttpServletRequest request, @RequestParam("boardNumber") int boardNumber)
	{
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile\\";
		int index = filePath.indexOf("\\WePOS");
		filePath = filePath.substring(index);
		
		shopDao.addBoardReadCnt(boardNumber);
		ShopBoardDto shopBoard = shopDao.shopBoardDetail(boardNumber);	
		
		String fileName = null;
		
		if(shopBoard.getBoardFile() != null)
		{
			fileName = shopBoard.getBoardFile();
			shopBoard.setBoardFile(filePath + fileName);
		}
		else
		{
			shopBoard.setBoardFile(null);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/shopBoardDetail");
		mav.addObject("shopBoard", shopBoard);
		mav.addObject("fileName", fileName);
				
		return mav;
	}
}