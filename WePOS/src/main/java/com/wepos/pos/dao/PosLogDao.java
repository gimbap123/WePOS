package com.wepos.pos.dao;

import java.util.List;

import com.wepos.pos.dto.PosLogDto;

public interface PosLogDao {

  // 전체 메뉴, 전체 기간 매출통계
  public List<PosLogDto> mainLog(PosLogDto posLogDto);
  
  // 메뉴별 상세 매출통계
 public List<PosLogDto> searchTotalLog(PosLogDto posLogDto);
  
  // 메뉴별 일 매출통계
  public List<PosLogDto> searchDayLog(PosLogDto posLogDto);
  
  // 메뉴별 월 매출통계
  public List<PosLogDto> searchMonthLog(PosLogDto posLogDto);
  
  // 메뉴명 조회
  public String productName(int productCode);
  
  // 카테고리명 조회
  public String categoryName(PosLogDto posLogDto);
  
  // 카테고리별 일 매출통계
  public List<PosLogDto> categoryDayLog(PosLogDto posLogDto);
  
  // 카테고리별 월 매출통계
  public List<PosLogDto> categoryMonthLog(PosLogDto posLogDto);
  
}

