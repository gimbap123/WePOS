package com.wepos.common.dao;

import java.util.List;
import java.util.Map;

import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.mgr.dto.CategoryDto;
import com.wepos.mgr.dto.ShopNoticeDto;

public interface ShopDao {
  
  // 검색 매장 갯수
  public int searchShopCount(Map<String, Object> map);
    
  // 매장 검색
  public List<ShopDto> searchShop(Map<String, Object> map);
  
  //매장 상세보기
  public ShopDto getShopDetail(int shopCode);
  
  // 상품 리스트보기
  public List<ProductDto> productList(Map<String, Object> map);
  
  // 상품 갯수
  public int productCount(Map<String, Object> map);
  
  // 매장 테이블 현황
  public Map<String, Object> shopTableInfo(int shopCode);
  
  // 매장별 카테고리
  public List<CategoryDto> categoryList(int shopCode);
  
  // 매장 공지사항 갯수
  public int shopNoticeCount(Map<String, Object> map);
  
  // 매장 공지사항
  public List<ShopNoticeDto> shopNoticeList(Map<String, Object> map);
  
  // 매장 공지사항 상세보기
  public ShopNoticeDto shopNoticeDetail(int noticeNumber);
  
  // 매장 공지사항 조회수 증가
  public void addNoticeReadCnt(int noticeNumber);
  
}

