package com.wepos.pos.dao;

import java.util.List;

import com.wepos.pos.dto.PosLogDto;

public interface PosLogDao {

  // 오늘 기준 매출통계
  public List<PosLogDto> todayLog();
 
}

