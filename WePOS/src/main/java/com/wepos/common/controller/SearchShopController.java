package com.wepos.common.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
}