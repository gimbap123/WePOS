package com.wepos.pos.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.pos.dao.PosMainDao;
import com.wepos.pos.dto.PosMainDto;

@Controller
public class PosMainController {

  @Autowired
  private PosMainDao posMainDao;
  
  // 포스 페이지로 이동
  @RequestMapping( value = "/pos/posMain.do" )
  public ModelAndView showPosMain(
      @RequestParam( value = "shopCode" ) int shopCode ) {
    
    List<PosMainDto> posInfo = posMainDao.getShopList( shopCode );
    
    int tableCount = posMainDao.getTableCount( shopCode );
    
    ModelAndView mav = new ModelAndView( "pos/posMain" );
    mav.addObject( "posInfo", posInfo );
    mav.addObject( "tableCount", tableCount );
    return mav;
  }
 
  // 매니저 아이디로 매장 정보 구함
  @RequestMapping( value = "/pos/getShopInfo.do" )
  public ModelAndView getShopInfo(
      @RequestParam( value = "mgrId" ) String mgrId ) {
    
    PosMainDto posMainDto = posMainDao.getShopInfo( mgrId );
    ModelAndView mav = new ModelAndView( "pos/getShopInfo" );
    mav.addObject( "shopInfo", posMainDto );
    return mav;
  }
}
