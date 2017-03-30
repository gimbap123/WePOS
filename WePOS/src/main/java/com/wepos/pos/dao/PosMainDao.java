package com.wepos.pos.dao;

import java.util.List;

import com.wepos.pos.dto.PosMainDto;

public interface PosMainDao {

  // 매니저 아이디로 매장 정보 구함
  public PosMainDto getShopInfo( String mgrId );
  
  public List<PosMainDto> getShopList( int shopCode );
  
  public int getTableCount( int shopCode );
}

