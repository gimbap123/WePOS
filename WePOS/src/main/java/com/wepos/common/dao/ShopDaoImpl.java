package com.wepos.common.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ShopDto;

public class ShopDaoImpl extends SqlSessionDaoSupport implements ShopDao {


  public int searchShopCount( String shopName ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectOne( "searchShopCount", shopName );
  }

  
  public List<ShopDto> searchShop(Map<String, Object> map) {
		List<ShopDto> shopList = getSqlSession().selectList("searchShop", map);
		return shopList;
	}
  

}

