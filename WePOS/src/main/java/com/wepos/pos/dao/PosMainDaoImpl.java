package com.wepos.pos.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.pos.dto.PosMainDto;

public class PosMainDaoImpl extends SqlSessionDaoSupport implements PosMainDao{
  public List<PosMainDto> getShopInfo( int shopCode ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectList( "getShopInfo", shopCode );
  }
  
  public int getTableCount( int shopCode ) {
    return getSqlSession().selectOne( "getTableCount", shopCode );
  }
}
