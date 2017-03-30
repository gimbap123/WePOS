package com.wepos.pos.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dto.ShopDto;
import com.wepos.pos.dao.PosMainDao;

@Controller
public class PosMainController {

  @Autowired
  private PosMainDao posMainDao;
  
  // 포스 페이지로 이동
  @RequestMapping( value = "/pos/posMain.do" )
  public ModelAndView showPosMain(
      @RequestParam( value = "shopCode" ) int shopCode ) {
   
    
    ShopDto shop = posMainDao.getShop( shopCode );
    int tableCount = posMainDao.getTableCount( shopCode );
    System.out.println( shopCode + " / " + shop );
    
    ModelAndView mav = new ModelAndView( "pos/posMain" );
    mav.addObject( "shop", shop );
    mav.addObject( "tableCount", tableCount );
    return mav;
  }
 
  // 매니저 아이디로 매장 정보 구함
  @RequestMapping( value = "/pos/getShopInfo.do" )
  public ModelAndView getShopInfo(
      @RequestParam( value = "mgrId" ) String mgrId ) {
    
    int shopCode = posMainDao.getShopCode( mgrId );
    System.out.println( shopCode );
    ModelAndView mav = new ModelAndView( "pos/getShopInfo" );
    mav.addObject( "shopCode", shopCode );
    return mav;
  }
}
