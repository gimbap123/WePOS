package com.wepos.common.dao;

import java.util.List;
import java.util.Map;

import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;

public interface ShopDao {
  
  // 검색 매장 갯수
  public int searchShopCount(Map<String, Object> map);
    
  // 매장 검색
  public List<ShopDto> searchShop(Map<String, Object> map);
  
  //매장 상세보기
  public ShopDto getShopDetail(String shopCode);
  
  // 상품 리스트보기
  public List<ProductDto> productList(Map<String, Object> map);
  
  // 상품 갯수
  public int productCount(String shopCode);
  
  // 매장 테이블 현황
  public Map<String, Object> shopTableInfo(String shopCode);
  
}

