package com.wepos.pos.dao;

import java.util.List;
import com.wepos.pos.dto.PosLogDto;

public interface PosLogDao {

  // 전체 매출통계
  public List<PosLogDto> mainLog();
  
  // 날짜 지정 매출통계
  public List<PosLogDto> searchLog(PosLogDto posLogDto);
  
  // 메뉴명 조회
  public String productName(int productCode);
 
}

