package com.wepos.pos.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class PosFunctionDaoImpl extends SqlSessionDaoSupport implements PosFunctionDao {

  public List<Integer> getMovableTableList( int shopCode ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectList( "getMovableTableList", shopCode );
  }

  public int moveTable( Map<String, Integer> shopInfo ) {
    // TODO Auto-generated method stub
    return getSqlSession().update( "moveTable", shopInfo );
  }

}
