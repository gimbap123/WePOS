package com.wepos.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dao.ShopDao;
import com.wepos.common.dto.ShopDto;

@Controller
public class SearchShopController {

  @Autowired
  private ShopDao shopDao;

  // 매장검색
  @RequestMapping( value = "/common/searchShop.do" )
  public ModelAndView searchShop() {
    int allShopCount = shopDao.allShopCount();
    ModelAndView mav = new ModelAndView( "common/searchShop" );
    mav.addObject( "allShopCount", allShopCount );
    mav.addObject( "resultCount", 0 );
    return mav;
  }

  @RequestMapping( value = "/common/searchShopProc.do" )
  public ModelAndView searchShopProc(
      @RequestParam( value = "shopName" ) String shopName ) {
    int allShopCount = shopDao.allShopCount();

    ModelAndView mav = new ModelAndView( "common/searchShop" );
    List<ShopDto> shopList = null;
    int resultCount = 0;

    resultCount = shopDao.findShopCount( shopName );
    System.out.println( shopName );
    shopList = shopDao.findShopList( shopName );

    mav.addObject( "allShopCount", allShopCount );
    mav.addObject( "shopList", shopList );
    mav.addObject( "resultCount", resultCount );
    return mav;
  }
  
  @RequestMapping(value = "/common/searchShop2.do", method = RequestMethod.GET)
  public ModelAndView searchShopView(HttpServletRequest request, @RequestParam(value = "shopName", defaultValue = "") String shopName)
  {
	  String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile\\";
	  int index = filePath.indexOf("\\WePOS");
	  filePath = filePath.substring(index);
	  
	  ModelAndView mav = new ModelAndView();
	  List<ShopDto> shopList = shopDao.searchShop(shopName);
	  for(ShopDto shop : shopList)
	  {
		  String fileName = shop.getShopFile();		
		  shop.setShopFile(filePath + fileName);		
	  }
	  
	  mav.setViewName("common/searchShop2");
	  mav.addObject("shopList", shopList);
	  return mav;
  }
}