package com.wepos.pos.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;
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

  public Map<String, Integer> getCategory( int categoryCode ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectMap( "getCategory", categoryCode, "CATEGORY_NAME" );
  }
}
