package com.wepos.pos.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.mgr.dto.CategoryDto;
import com.wepos.common.dto.OrdersDetailDto;
import com.wepos.common.dto.OrdersDto;
import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.dto.SumOrdersDetailDto;
import com.wepos.common.dto.TablesDto;

public class PosMainDaoImpl extends SqlSessionDaoSupport implements PosMainDao{
  
  public int getTableCount( int shopCode ) {
    return getSqlSession().selectOne( "getTableCount", shopCode );
  }

  // 매니저 아이디로 매장 정보 가져옴
  public int getShopCode( String mgrId ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectOne( "getShopCode", mgrId );
  }

  // 매장 코드로 매장 정보 가져옴
  public ShopDto getShop( int shopCode ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectOne( "getShop", shopCode );
  }

  // 해당 매장 테이블 정보 select
  public List<TablesDto> getTables( int shopCode ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectList( "getTables", shopCode );
  }

  public List<ProductDto> getProductList( int shopCode ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectList( "getProductList", shopCode );
  }

  /*public Map<String, Integer> getCategory( int categoryCode ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectMap( "getCategory", categoryCode, "CATEGORY_NAME" );
  }*/
  
  public List<CategoryDto> getCategory( int shopCode ) {
    return getSqlSession().selectList( "getCategory", shopCode );
  }

  public void insertOrders( OrdersDto orders ) {
    // TODO Auto-generated method stub
    getSqlSession().insert( "insertOrders", orders );
  }

  public void insertOrdersDetail( OrdersDetailDto odt ) {
    // TODO Auto-generated method stub
    getSqlSession().insert( "insertOrdersDetail", odt );
  }

  public int getOrderCode() {
    // TODO Auto-generated method stub
    return getSqlSession().selectOne( "getOrderCode" );
  }

  public List<OrdersDto> getOrderBeforePayment() {
    // TODO Auto-generated method stub
    return getSqlSession().selectList( "getOrderBeforePayment" );
  }

  public List<SumOrdersDetailDto> getOrdersDetailBeforePayment() {
    // TODO Auto-generated method stub
    return getSqlSession().selectList( "getOrdersDetailBeforePayment" );
  }

  // 해당 상품의 최근 주문 수량
  public int lastestOrderAmount( HashMap<String, Integer> orderInfo ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectOne( "lastestOrderAmount", orderInfo );
  }

  // 삭제 할 주문 번호 select 
  public int getDeleteOrderCode( HashMap<String, Integer> orderInfo ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectOne( "getDeleteOrderCode", orderInfo );
  }
  
  // 주문 내역 삭제
  public int deleteOrdersDetail( HashMap<String, Integer> orderInfo ) {
    return getSqlSession().delete( "deleteOrdersDetail", orderInfo );
  }
  
  // 주문 수량 update
  public int updateOrderAmount( OrdersDetailDto odd ){
    return getSqlSession().update( "updateOrderAmount", odd );
  }
}
