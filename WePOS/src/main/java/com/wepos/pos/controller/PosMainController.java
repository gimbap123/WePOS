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
  public ModelAndView posProc(
      @RequestParam( value = "shopCode" ) int shopCode ) {
    
    // PosMainDto posMainDto = posMainDao.getShopInfo( shopCode );
    List<PosMainDto> posInfo = posMainDao.getShopInfo( shopCode );
    System.out.println( "PosMainController > posProc > posMainDto : " + posInfo );
    
    int tableCount = posMainDao.getTableCount( shopCode );
    System.out.println( "PosMainController > posProc > tableCount : " + tableCount );
    
    ModelAndView mav = new ModelAndView( "pos/posMain" );
    mav.addObject( "posInfo", posInfo );
    mav.addObject( "tableCount", tableCount );
    return mav;
  }
}
