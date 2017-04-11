package com.wepos.pos.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dto.OrdersDetailDto;
import com.wepos.common.dto.OrdersDto;
import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.dto.TablesDto;
import com.wepos.pos.dao.PosMainDao;

@Controller
public class PosMainController {

  @Autowired
  private PosMainDao posMainDao;

  // 포스 페이지 이동
  @RequestMapping( value = "/pos/posMain.do" )
  public ModelAndView getShopInfo(
      @RequestParam( value = "mgrId" ) String mgrId ) {

    int shopCode = posMainDao.getShopCode( mgrId );
    System.out.println( shopCode );
    // 매장 코드 번호로 매장 정보 Select
    ShopDto shop = posMainDao.getShop( shopCode );
    // 매장 내 테이블 정보 select
    List<TablesDto> tables = posMainDao.getTables( shopCode );
    // 매장 내 테이블 숫자 select
    int tableCount = posMainDao.getTableCount( shopCode );
    // 매장 내 메뉴 select
    List<ProductDto> productList = posMainDao
        .getProductList( shopCode );
    // 카테고리 정보 select
    // Map<String, Integer> category = posMainDao.getCategory( 3 );

    ModelAndView mav = new ModelAndView( "pos/posMain" );
    mav.addObject( "shopCode", shopCode );
    mav.addObject( "shop", shop );
    mav.addObject( "tables", tables );
    mav.addObject( "productList", productList );
    mav.addObject( "tableCount", tableCount );
    // mav.addObject( "category", category );
    return mav;
  }

  // 주문 내역 DB 저장
  @RequestMapping( "/pos/insertOrder.do" )
  public ModelAndView insertOrder(
      @RequestParam( value = "orders" ) List<?> orders,
      @RequestParam( value = "ordersDetailList" ) List<?> ordersDetailList ) {

    List<OrdersDetailDto> oddList = new ArrayList<OrdersDetailDto>();
    OrdersDto od = new OrdersDto();

    od.setShopCode( Integer.parseInt( (String)orders.get( 0 ) ) );
    od.setTableCode( Integer.parseInt( (String)orders.get( 1 ) ) );
    // od.setUserId( userId );
    // od.setPaymentCode( paymentCode );
    // od.setOrderDate( orderDate );
    // od.setOrderState( orderState );

    posMainDao.insertOrders( od );
    int lastOrderCode = posMainDao.getOrderCode();
    
    System.out.println( "Last Order Code : " + lastOrderCode );

    for ( int i = 0; i < ordersDetailList.size(); i=i+3 ) {
      OrdersDetailDto odd = new OrdersDetailDto();
      odd.setOrderCode( lastOrderCode );
      odd.setProductCode( Integer.parseInt( (String)ordersDetailList.get( i ) ) );
      odd.setOrderAmount( Integer.parseInt( (String)ordersDetailList.get( i + 1 ) ) );
      odd.setOrderPrice( Integer.parseInt( (String)ordersDetailList.get( i + 2 ) ) );
      
      posMainDao.insertOrdersDetail( odd );
      
      oddList.add(odd);
    }

    ModelAndView mav = new ModelAndView( "pos/insertOrder" );
    mav.addObject( "orders", orders );
    mav.addObject( "ordersDetailList", ordersDetailList );
    mav.addObject( "od", od );
    mav.addObject( "oddList", oddList );
    return mav;
  }

  // 매출 통계 페이지
  @RequestMapping( "/pos/salesLog.do" )
  public String showSalesLog() {
    return "pos/salesLog";
  }
}
