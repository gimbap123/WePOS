package com.wepos.pos.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ShopDto;

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
}
