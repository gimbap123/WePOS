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
  
  public List<ProductDto> productList(Map<String, Object> map) {
	  	List<ProductDto> productList = getSqlSession().selectList("productList", map);
		return productList;
	}
  
  public int productCount(String shopCode) {		
		return getSqlSession().selectOne("productCount", shopCode);
	}
  
  public Map<String, Object> shopTableInfo(String shopCode)
  {
	  Map<String, Object> tableInfoMap = getSqlSession().selectOne("shopTableInfo", shopCode);
	  return tableInfoMap;
  }
  
}

