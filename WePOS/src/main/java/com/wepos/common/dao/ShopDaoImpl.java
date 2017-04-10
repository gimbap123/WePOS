package com.wepos.common.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopBoardDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.mgr.dto.CategoryDto;
import com.wepos.mgr.dto.ShopNoticeDto;

public class ShopDaoImpl extends SqlSessionDaoSupport implements ShopDao {


  public int searchShopCount(Map<String, Object> map) {
    // TODO Auto-generated method stub
    return getSqlSession().selectOne("searchShopCount", map);
  }

  
  public List<ShopDto> searchShop(Map<String, Object> map) {
		List<ShopDto> shopList = getSqlSession().selectList("searchShop", map);
		return shopList;
	}
  
  public ShopDto getShopDetail(int shopCode) {		
		return getSqlSession().selectOne("getShopDetail", shopCode);
	}
  
  public List<ProductDto> productList(Map<String, Object> map) {
	  	List<ProductDto> productList = getSqlSession().selectList("productList", map);
		return productList;
	}
  
  public int productCount(Map<String, Object> map) {		
		return getSqlSession().selectOne("productCount", map);
	}
  
  public Map<String, Object> shopTableInfo(int shopCode)  {
	  Map<String, Object> tableInfoMap = getSqlSession().selectOne("shopTableInfo", shopCode);
	  return tableInfoMap;
  }
  
  public List<CategoryDto> categoryList(int shopCode) {
		List<CategoryDto> categoryList = getSqlSession().selectList("categoryList", shopCode);
		return categoryList;
	}
  
  public int shopNoticeCount(Map<String, Object> map) {
		return getSqlSession().selectOne("shopNoticeCount", map);
	}
  
  public List<ShopNoticeDto> shopNoticeList(Map<String, Object> map) {
		List<ShopNoticeDto> shopNoticeList = getSqlSession().selectList("shopNoticeList", map);
		return shopNoticeList;
	}
  
  public ShopNoticeDto shopNoticeDetail(int noticeNumber) {
		return getSqlSession().selectOne("shopNoticeDetail", noticeNumber);
	}
  
  public void addNoticeReadCnt(int noticeNumber) {
		getSqlSession().update("addNoticeReadCnt", noticeNumber);
	}
  
  public int shopBoardCount(Map<String, Object> map) {
		return getSqlSession().selectOne("shopBoardCount", map);
	}
  
  public List<ShopBoardDto> shopBoardList(Map<String, Object> map) {
		List<ShopBoardDto> shopBoardList = getSqlSession().selectList("shopBoardList", map);
		return shopBoardList;
	}
  
  public void addBoardReadCnt(int boardNumber) {
	  getSqlSession().update("addBoardReadCnt", boardNumber);
	}
  
  public ShopBoardDto shopBoardDetail(int boardNumber) {
		return getSqlSession().selectOne("shopBoardDetail", boardNumber);
	}
}

