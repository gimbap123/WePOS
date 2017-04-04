package com.wepos.common.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;

public class ShopDaoImpl extends SqlSessionDaoSupport implements ShopDao {


  public int searchShopCount(Map<String, Object> map) {
    // TODO Auto-generated method stub
    return getSqlSession().selectOne("searchShopCount", map);
  }

  
  public List<ShopDto> searchShop(Map<String, Object> map) {
		List<ShopDto> shopList = getSqlSession().selectList("searchShop", map);
		return shopList;
	}
  
  public ShopDto getShopDetail(String shopCode) {		
		return getSqlSession().selectOne("getShopDetail", shopCode);
	}
  
  public List<ProductDto> productList(String shopCode) {
	  	List<ProductDto> productList = getSqlSession().selectList("productList", shopCode);
		return productList;
	}
  
}

