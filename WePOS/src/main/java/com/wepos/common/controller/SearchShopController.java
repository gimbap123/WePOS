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
import com.wepos.common.dto.ShopDto;
import com.wepos.common.util.PagingUtil;
import com.wepos.mgr.dto.CategoryDto;

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
		mav.setViewName("common/productList");
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
		mav.setViewName("common/shopTableInfo");
		mav.addObject("tableInfoMap", tableInfoMap);
		
		return mav;
	}
	
}