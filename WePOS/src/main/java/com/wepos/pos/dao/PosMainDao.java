package com.wepos.pos.dao;

import java.util.List;
import java.util.Map;

import com.wepos.common.dto.OrdersDetailDto;
import com.wepos.common.dto.OrdersDto;
import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.dto.TablesDto;

public interface PosMainDao {

  // 매니저 아이디로 매장 코드 구함
  public int getShopCode( String mgrId );
 
  // 테이블 갯수 select
  public int getTableCount( int shopCode );
 
  // 매장 정보 가져옴
  public ShopDto getShop( int shopCode );
  
  // 테이블 정보 select
  public List<TablesDto> getTables( int shopCode );
  
  // 메뉴 정보 select
  public List<ProductDto> getProductList( int shopCode );
  
  // 카테고리 정보 select
  public Map<String, Integer> getCategory( int categoryCode );
  
  // 주문 기본 정보 insert
  public void insertOrders( OrdersDto orders );
 
  // 주문 코드 select
  public int getOrderCode();
  
  // 주문 상세 정보 insert
  public void insertOrdersDetail( OrdersDetailDto odt );
  
  // 결제 전 주문 정보 select
  public List<OrdersDto> getOrderBeforePayment();
  
  // 결제 전 테이블의 주문 상세 내역 select
  public List<OrdersDetailDto> getOrdersDetailBeforePayment();
}

