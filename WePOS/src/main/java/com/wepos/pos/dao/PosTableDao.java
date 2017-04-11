package com.wepos.pos.dao;

import com.wepos.common.dto.TablesDto;

public interface PosTableDao {

  // 테이블 정보 수정
  public int updateTable(TablesDto tablesDto);
  
}

