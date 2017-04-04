package com.wepos.pos.controller;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.dto.TablesDto;
import com.wepos.pos.dao.PosMainDao;

@Controller
public class PosMainController {

  @Autowired
  private PosMainDao posMainDao;
  
  // 포스 페이지로 이동
  @RequestMapping( value = "/pos/posMain.do" )
  public ModelAndView showPosMain(
      @RequestParam( value = "shopCode" ) int shopCode ) {
  
    // 매장 코드 번호로 매장 정보 Select
    ShopDto shop = posMainDao.getShop( shopCode );
    // 매장 내 테이블 정보 select
    List<TablesDto> tables = posMainDao.getTables( shopCode );
    // 매장 내 테이블 숫자 select
    int tableCount = posMainDao.getTableCount( shopCode );
    // 매장 내 메뉴 select
    List<ProductDto> productList = posMainDao.getProductList( shopCode );
    // 카테고리 정보 select
    Map<String, Integer> category = posMainDao.getCategory( 3 );
    System.out.println( "PosMainController > category : " + category );
    
    ModelAndView mav = new ModelAndView( "pos/posMain" );
    mav.addObject( "shop", shop );
    mav.addObject( "tables", tables );
    mav.addObject( "productList", productList );
    mav.addObject( "tableCount", tableCount );
    mav.addObject( "category", category );
    
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
  
  // 매출 통계 페이지
  @RequestMapping("/pos/salesLog.do")
  public String showSalesLog(){
	  return "pos/salesLog";
  }
}
