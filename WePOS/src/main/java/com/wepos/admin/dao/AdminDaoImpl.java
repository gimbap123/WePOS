package com.wepos.admin.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.admin.dto.CityDto;
import com.wepos.admin.dto.LocalDto;
import com.wepos.admin.dto.ShopTypeDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.mgr.dto.MgrDto;

public class AdminDaoImpl extends SqlSessionDaoSupport implements AdminDao {

	public List<ShopTypeDto> getShopType() {	
		List<ShopTypeDto> shopTypeList = getSqlSession().selectList("getShopType");
		return shopTypeList;
	}
	
	public List<CityDto> getCity() {
		List<CityDto> cityList = getSqlSession().selectList("getCity");
		return cityList;
	}
	
	public List<LocalDto> searchLocal(int cityCode) {
		List<LocalDto> localList = getSqlSession().selectList("searchLocal", cityCode);
		return localList;
	}
	
	public void shopRegistration(ShopDto shop) {
		getSqlSession().insert("shopRegistration", shop);
	}

	//매장 관리자 추가
	public void insertMgr(MgrDto mgrDto) {
		getSqlSession().insert("insertMgr", mgrDto);
	}
	
	//세부 매장 불러오기
	public List<ShopDto> searchShopCode(int shopTypeCode) {
		List<ShopDto> shopList =  getSqlSession().selectList("searchShopCode", shopTypeCode);
		return shopList;
	}
	
	// 관리자 정보 수정
	public MgrDto showMgrInfo(String mgrId){
		return getSqlSession().selectOne("showMgrInfo",mgrId);
	}
	public String showShopInfo(int shopCode){
		return getSqlSession().selectOne("showShopInfo",shopCode);
	}
	public int updateMgrInfo(MgrDto mgrDto){
		return getSqlSession().update("updateMgrInfo",mgrDto);
	}
	
}
