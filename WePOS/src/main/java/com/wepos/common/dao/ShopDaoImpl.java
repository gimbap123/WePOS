package com.wepos.common.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ShopDto;

public class ShopDaoImpl extends SqlSessionDaoSupport implements ShopDao {

  public List<ShopDto> findShopList( String shopName ) {
    // TODO Auto-generated method stub
    List<ShopDto> shopList = getSqlSession().selectList( "findShopList", shopName );
    return shopList;
  }

  public int allShopCount() {
    // TODO Auto-generated method stub
    return getSqlSession().selectOne( "allShopCount" );
  }

  public int findShopCount( String shopName ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectOne( "findShopCount", shopName );
  }


}
