package com.wepos.pos.dao;

import java.util.List;

import com.wepos.common.dto.ShopDto;
import com.wepos.common.dto.TablesDto;

public interface PosMainDao {

  // 매니저 아이디로 매장 코드 구함
  public int getShopCode( String mgrId );
 
  // 테이블 갯수 select
  public int getTableCount( int shopCode );
 
  // 매장 정보 가져옴
  public ShopDto getShop( int shopCode );
  
  // 테이블 정보 select
  public List<TablesDto> getTables( int shopCode );
}

