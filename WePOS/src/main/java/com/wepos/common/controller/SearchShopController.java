package com.wepos.common.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.admin.dao.AdminDao;
import com.wepos.admin.dto.CityDto;
import com.wepos.admin.dto.ShopTypeDto;
import com.wepos.common.dao.ShopDao;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.util.PagingUtil;

@Controller
public class SearchShopController {

  @Autowired
  private ShopDao shopDao;
  
  @Autowired
  private AdminDao adminDao;
    
  @RequestMapping(value = "/common/searchShop.do", method = RequestMethod.GET)
  public ModelAndView searchShopView(HttpServletRequest request, 
		  @RequestParam(value="pageNum", defaultValue="1") int currentPage, 
		  @ModelAttribute ShopDto shop)
  {
	  String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile\\";
	  int index = filePath.indexOf("\\WePOS");
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
		  String paramString = "?shopName=" + shop.getShopName() + "&shopTypeCode=" + shop.getShopTypeCode() +
				  "&cityCode=" + shop.getCityCode() + "&localCode=" + shop.getLocalCode();
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
	  
	  ModelAndView mav = new ModelAndView();
	  mav.setViewName("common/searchShop");
	  mav.addObject("shopList", shopList);
	  mav.addObject("shopCount", shopCount);
	  mav.addObject("shopTypeList", shopTypeList);
	  mav.addObject("cityList", cityList);
	  mav.addObject("pagingHtml", page.getPagingHtml()); 
	  
	  return mav;
  }
}