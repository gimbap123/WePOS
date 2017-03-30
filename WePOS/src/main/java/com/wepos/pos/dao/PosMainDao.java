package com.wepos.pos.dao;

import com.wepos.common.dto.ShopDto;

public interface PosMainDao {

  // 매니저 아이디로 매장 코드 구함
  public int getShopCode( String mgrId );
  
  public int getTableCount( int shopCode );
  
  // 매장 정보 가져옴
  public ShopDto getShop( int shopCode );
}

