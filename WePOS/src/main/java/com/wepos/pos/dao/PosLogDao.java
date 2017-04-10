package com.wepos.pos.dao;

import java.util.List;
import com.wepos.pos.dto.PosLogDto;

public interface PosLogDao {

  // 전체 매출통계
  public List<PosLogDto> mainLog();
  
  // 총 매출통계
 public List<PosLogDto> searchTotalLog(PosLogDto posLogDto);
  
  // 일별 매출통계
  public List<PosLogDto> searchDayLog(PosLogDto posLogDto);
  
  // 월별 매출통계
  public List<PosLogDto> searchMonthLog(PosLogDto posLogDto);
  
  // 메뉴명 조회
  public String productName(int productCode);
 
}

