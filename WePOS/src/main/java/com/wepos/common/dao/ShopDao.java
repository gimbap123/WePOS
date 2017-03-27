package com.wepos.common.dao;

import java.util.List;

import com.wepos.common.dto.ShopDto;

public interface ShopDao {
  
  // 매장 총 갯수 조회
  public int allShopCount();

  // 매장 리스트 검색
  public List<ShopDto> findShopList( String shopName );
  
  // 검색 매장 갯수
  public int findShopCount( String shopName );
  
  
  // 매장 검색
  public List<ShopDto> searchShop(String shopName);
}

