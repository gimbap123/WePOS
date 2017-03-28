package com.wepos.pos.dao;

import java.util.List;

import com.wepos.pos.dto.PosMainDto;

public interface PosMainDao {
  public List<PosMainDto> getShopInfo( int shopCode );
  
  public int getTableCount( int shopCode );
}

