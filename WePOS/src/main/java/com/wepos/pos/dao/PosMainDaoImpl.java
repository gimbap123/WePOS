package com.wepos.pos.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.pos.dto.PosMainDto;

public class PosMainDaoImpl extends SqlSessionDaoSupport implements PosMainDao{
  public List<PosMainDto> getShopList( int shopCode ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectList( "getShopList", shopCode );
  }
  
  public int getTableCount( int shopCode ) {
    return getSqlSession().selectOne( "getTableCount", shopCode );
  }

  // 매니저 아이디로 매장 정보 가져옴
  public PosMainDto getShopInfo( String mgrId ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectOne( "getShopInfo", mgrId );
  }
}
