package com.wepos.common.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.wepos.common.dao.ReservationDao;
import com.wepos.common.dao.ShopDao;
import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ReservationDto;
import com.wepos.common.dto.ShopBoardDto;
import com.wepos.common.dto.ShopBoardReplyDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.util.FileUtil;
import com.wepos.common.util.PagingUtil;
import com.wepos.mgr.dto.CategoryDto;
import com.wepos.mgr.dto.ShopNoticeDto;
import com.wepos.user.dao.UserDao;
import com.wepos.user.dto.ProductGradeDto;

@Controller
public class SearchShopController {

  @Autowired
  private ShopDao shopDao;
  
  @Autowired
  private AdminDao adminDao;
  
  @Autowired
  private UserDao userDao;
  
  @Autowired
  private ReservationDao reservationDao;

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
			@RequestParam("shopCode") int shopCode, @RequestParam("userId") String userId) throws Exception
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
		ReservationDto reservationDto = new ReservationDto();
		reservationDto.setShopCode(shopCode);
		reservationDto.setUserId(userId);
		int countRes = reservationDao.countRes(reservationDto);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/shopDetail");
		mav.addObject("countRes", countRes);
		mav.addObject("shop", shop);
		mav.addObject("coordinateMap", coordinateMap);		
		
		return mav;
	}
	
	// 상품 리스트
	@RequestMapping(value="/common/productList.do")
	public ModelAndView productListView(HttpSession session, HttpServletRequest request, 
			@RequestParam("shopCode") int shopCode,
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
		List<Integer> productCodeList = new ArrayList<Integer>();
		
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
				
				productCodeList.add(product.getProductCode());
			}	 		  		  
		 }
		else
		{
			productList = Collections.emptyList();
		}
		
		List<ProductGradeDto> productGradeList = null;
		
		if(session.getAttribute("id") != null)
		{
			Map<String, Object> productGradeMap = new HashMap<String, Object>();
			productGradeMap.put("userId", session.getAttribute("id"));
			productGradeMap.put("productCodeList", productCodeList);
			productGradeList = userDao.productGradeList(productGradeMap);
		}
		
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("common/productListTab");
		mav.addObject("productList", productList);
		mav.addObject("categoryList", categoryList);
		mav.addObject("categoryCode", categoryCode);
		mav.addObject("pagingHtml", page.getPagingHtml()); 
		mav.addObject("currentPage", currentPage);
		mav.addObject("shopCode", shopCode);
		mav.addObject("productGradeList", productGradeList);
		
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
		map.put("searchNoticeType", searchNoticeType);
		map.put("searchNoticeText", searchNoticeText);
		
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
		mav.addObject("shopCode", shopCode);
		mav.addObject("menuType", "common");
		
		return mav;
	}
	
	// 매장 공지사항 상세보기
	@RequestMapping(value="/common/shopNoticeDetail.do")
	public ModelAndView shopNodticeDetailView(HttpServletRequest request, @RequestParam("noticeNumber") int noticeNumber,
			@RequestParam("menuType") String menuType)
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
		mav.addObject("menuType", menuType);
		
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
		map.put("searchBoardType", searchBoardType);
		map.put("searchBoardText", searchBoardText);
		
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
		mav.addObject("shopCode", shopCode);
		mav.addObject("menuType", "common");
		
		return mav;
	}
	
	// 매장 자유게시판 상세보기
	@RequestMapping(value="/common/shopBoardDetail.do")
	public ModelAndView shopBoardDetailView(HttpServletRequest request, @RequestParam("boardNumber") int boardNumber,
			@RequestParam("menuType") String menuType)
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
		mav.addObject("menuType", menuType);
				
		return mav;
	}
	
	// 매장 자유 게시판 게시물 댓글
	@RequestMapping(value="/common/shopBoardReply.do")
	public ModelAndView shopBoardReplyView(@RequestParam(value="pageNum", defaultValue="1") int currentPage, 
			@RequestParam("boardNumber") int boardNumber)
	{
		int shopBoardReplyCount = shopDao.shopBoardReplyCount(boardNumber);
		
		String paramString = "javascript:replyListPaging";
		PagingUtil page = new PagingUtil(paramString, currentPage, shopBoardReplyCount, 5, 5, null);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNumber", boardNumber);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<ShopBoardReplyDto> shopBoardReplyList = null;
		if(shopBoardReplyCount > 0)
		{
			shopBoardReplyList = shopDao.shopBoardReplyList(map);
		}
		else
		{
			shopBoardReplyList = Collections.emptyList();
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/shopBoardReply");
		mav.addObject("shopBoardReplyList", shopBoardReplyList);
		mav.addObject("shopBoardReplyCount", shopBoardReplyCount);
		mav.addObject("pagingHtml", page.getPagingHtml());
		mav.addObject("pageNum", currentPage);
		
		return mav;
	}
	
	// 매장 자유 게시판 댓글 쓰기
	@RequestMapping(value="/common/shopBoardReplyWrite.do")
	public String shopBoardReplyWriteProcess(HttpSession session, @ModelAttribute ShopBoardReplyDto shopBoardReply)
	{
		shopBoardReply.setTotalId((String)session.getAttribute("id"));
		shopDao.shopBoardReplyWrite(shopBoardReply);
		return "redirect:/common/shopBoardReply.do?boardNumber=" + shopBoardReply.getBoardNumber();
	}
	
	// 매장 자유 게시판 댓글 수정
	@RequestMapping(value="/common/shopBoardReplyUpdate.do")
	public String shopBoardReplyUpdateProcess(@ModelAttribute ShopBoardReplyDto shopBoardReply,
			@RequestParam(value="pageNum", defaultValue="1") int currentPage)
	{		
		shopDao.shopBoardReplyUpdate(shopBoardReply);
		return "redirect:/common/shopBoardReply.do?pageNum=" + currentPage + "&boardNumber=" +shopBoardReply.getBoardNumber();
	}
	
	// 매장 자유 게시판 댓글 삭제
	@RequestMapping(value="/common/shopBoardReplyDelete.do")
	public String shopBoardReplyDeleteProcess(@ModelAttribute ShopBoardReplyDto shopBoardReply)
	{
		shopDao.shopBoardReplyDelete(shopBoardReply.getReplyNumber());
		return "redirect:/common/shopBoardReply.do?boardNumber=" + shopBoardReply.getBoardNumber();
	}
	
	// 매장 자유 게시판 글쓰기
	@RequestMapping(value="/common/shopBoardWrite.do", method=RequestMethod.GET)
	public ModelAndView shopBoardWriteView(@RequestParam("shopCode") int shopCode,
			@RequestParam("menuType") String menuType)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/shopBoardWrite");
		mav.addObject("shopCode", shopCode);
		mav.addObject("menuType", menuType);
		
		return mav;
	}
	
	// 매장 자유 게시판 글쓰기 기능 수행
	@RequestMapping(value="/common/shopBoardWrite.do", method=RequestMethod.POST)
	public String shopBoardWriteProcess(HttpServletRequest request, @ModelAttribute ShopBoardDto shopBoard,
			@RequestParam("menuType") String menuType) throws IOException, Exception
	{		
		String newFileName = "";
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile/";
		
		if(!shopBoard.getUpload().isEmpty())
		{
			newFileName = FileUtil.rename(shopBoard.getUpload().getOriginalFilename());
			shopBoard.setBoardFile(newFileName);
			File file = new File(filePath + newFileName);
			shopBoard.getUpload().transferTo(file);
		}
		
		shopDao.shopBoardWrite(shopBoard);
		
		return "redirect:/common/shopBoardSelectMenu.do?shopCode=" + shopBoard.getShopCode() + "&menuType=" + menuType;
	}
	
	// 매장 자유 게시판 글수정
	@RequestMapping(value="/common/shopBoardUpdate.do", method=RequestMethod.GET)
	public ModelAndView shopBoardUpdateView(@RequestParam("boardNumber") int boardNumber,
			@RequestParam("menuType") String menuType)
	{
		ShopBoardDto shopBoard = shopDao.shopBoardDetail(boardNumber);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/shopBoardUpdate");
		mav.addObject("shopBoard", shopBoard);
		mav.addObject("menuType", menuType);
		
		return mav;
	}
	
	// 매장 자유 게시판 글수정 기능 수행
	@RequestMapping(value="/common/shopBoardUpdate.do", method=RequestMethod.POST)
	public String shopBoardUpdateProcess(HttpServletRequest request, @ModelAttribute ShopBoardDto shopBoard,
			@RequestParam("menuType") String menuType) throws IOException, Exception
	{
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile/";
		String oldFileName = shopBoard.getBoardFile();
		
		if(!shopBoard.getUpload().isEmpty())
		{
			shopBoard.setBoardFile(FileUtil.rename(shopBoard.getUpload().getOriginalFilename()));
			File file = new File(filePath + shopBoard.getBoardFile());
			shopBoard.getUpload().transferTo(file);
			if(oldFileName != null)
			{
				FileUtil.removeFile(oldFileName, filePath);
			}
		}
		else
		{
			shopBoard.setBoardFile(oldFileName);
		}
		
		shopDao.shopBoardUpdate(shopBoard);
		
		return "redirect:/common/shopBoardDetail.do?boardNumber=" + shopBoard.getBoardNumber() + "&menuType=" + menuType;
	}
	
	// 매장 자유 게시판 글삭제
	@RequestMapping(value="/common/shopBoardDelete.do")
	public String shopBoardDeleteProcess(HttpServletRequest request, @ModelAttribute ShopBoardDto shopBoard,
			@RequestParam("menuType") String menuType)
	{
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile/";
		
		if(shopBoard.getBoardFile() != null)
		{
			FileUtil.removeFile(shopBoard.getBoardFile(), filePath);
		}
		
		shopDao.shopBoardDelete(shopBoard.getBoardNumber());
		
		return "redirect:/common/shopBoardSelectMenu.do?shopCode=" + shopBoard.getShopCode() + "&menuType=" + menuType;
	}
	
	// 매장 공지사항 글쓰기
	@RequestMapping(value="/common/shopNoticeWrite.do", method=RequestMethod.GET)
	public ModelAndView shopNoticeWriteView(@RequestParam("shopCode") int shopCode,
			@RequestParam("menuType") String menuType)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/shopNoticeWrite");
		mav.addObject("shopCode", shopCode);
		mav.addObject("menuType", menuType);
		
		return mav;
	}
	
	// 매장 공지사항 글쓰기 기능 수행
	@RequestMapping(value="/common/shopNoticeWrite.do", method=RequestMethod.POST)
	public String shopNoticeWriteProcess(HttpServletRequest request, @ModelAttribute ShopNoticeDto shopNotice,
			@RequestParam("menuType") String menuType) throws IOException, Exception
	{		
		String newFileName = "";
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile/";
		
		if(!shopNotice.getUpload().isEmpty())
		{
			newFileName = FileUtil.rename(shopNotice.getUpload().getOriginalFilename());
			shopNotice.setNoticeFile(newFileName);
			File file = new File(filePath + newFileName);
			shopNotice.getUpload().transferTo(file);
		}
		
		shopDao.shopNoticeWrite(shopNotice);
		return "redirect:/common/shopNoticeSelectMenu.do?shopCode=" + shopNotice.getShopCode() + "&menuType=" + menuType;
	}
	
	// 매장 공지사항 글수정
	@RequestMapping(value="/common/shopNoticeUpdate.do", method=RequestMethod.GET)
	public ModelAndView shopNoticeUpdateView(@RequestParam("noticeNumber") int noticeNumber,
			@RequestParam("menuType") String menuType)
	{
		ShopNoticeDto shopNotice = shopDao.shopNoticeDetail(noticeNumber);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/shopNoticeUpdate");
		mav.addObject("shopNotice", shopNotice);
		mav.addObject("menuType", menuType);
		
		return mav;
	}
	
	// 매장 공지사항 글수정 기능 수행
	@RequestMapping(value="/common/shopNoticeUpdate.do", method=RequestMethod.POST)
	public String shopNoticeUpdateProcess(HttpServletRequest request, @ModelAttribute ShopNoticeDto shopNotice,
			@RequestParam("menuType") String menuType) throws IOException, Exception
	{	
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile/";
		String oldFileName = shopNotice.getNoticeFile();
		
		if(!shopNotice.getUpload().isEmpty())
		{
			shopNotice.setNoticeFile(FileUtil.rename(shopNotice.getUpload().getOriginalFilename()));
			File file = new File(filePath + shopNotice.getNoticeFile());
			shopNotice.getUpload().transferTo(file);
			if(oldFileName != null)
			{
				FileUtil.removeFile(oldFileName, filePath);
			}
		}
		else
		{
			shopNotice.setNoticeFile(oldFileName);
		}		
		
		shopDao.shopNoticeUpdate(shopNotice);
		return "redirect:/common/shopNoticeDetail.do?noticeNumber=" + shopNotice.getNoticeNumber() + "&menuType=" + menuType;
	}
	
	// 매장 공지사항 글삭제
	@RequestMapping(value="/common/shopNoticeDelete.do")
	public String shopNoticeDeleteProcess(HttpServletRequest request, @ModelAttribute ShopNoticeDto shopNotice,
			@RequestParam("menuType") String menuType)
	{		
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile/";
				
		if(shopNotice.getNoticeFile() != null)
		{
			FileUtil.removeFile(shopNotice.getNoticeFile(), filePath);
		}
		shopDao.shopNoticeDelete(shopNotice.getNoticeNumber());
			
		return "redirect:/common/shopNoticeSelectMenu.do?shopCode=" + shopNotice.getShopCode() + "&menuType=" + menuType;
	}
	
	// 매장 공지사항 메뉴에 따른 목록으로
	@RequestMapping(value="/common/shopNoticeSelectMenu.do")
	public String shopNoticeSelectMenu(@RequestParam("shopCode") int shopCode, @RequestParam("menuType") String menuType)
	{
		String redirect = null;
		if("common".equals(menuType))
		{
			redirect = "redirect:/common/shopDetail.do?shopCode=" + shopCode;
		}
		else if("pos".equals(menuType))
		{
			redirect = "redirect:/pos/posShopNotice.do?shopCode=" + shopCode;
		}
		
		return redirect;
	}
	
	// 매장 자유 게시판 메뉴에 따른 목록으로
	@RequestMapping(value="/common/shopBoardSelectMenu.do")
	public String shopBoardSelectMenu(@RequestParam("shopCode") int shopCode, @RequestParam("menuType") String menuType)
	{
		String redirect = null;
		if("common".equals(menuType))
		{
			redirect = "redirect:/common/shopDetail.do?shopCode=" + shopCode;
		}
		else if("pos".equals(menuType))
		{
			redirect = "redirect:/pos/posShopBoard.do?shopCode=" + shopCode;
		}
		
		return redirect;
	}
	
}