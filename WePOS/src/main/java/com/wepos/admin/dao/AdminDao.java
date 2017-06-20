package com.wepos.admin.dao;

import java.util.List;

import com.wepos.admin.dto.CityDto;
import com.wepos.admin.dto.LocalDto;
import com.wepos.admin.dto.ShopTypeDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.mgr.dto.MgrDto;

public interface AdminDao {
	
	// 매장 종류
	public List<ShopTypeDto> getShopType();
	
	// 지역 정보 가져오기
	public List<CityDto> getCity();
		
	// 시, 군 정보 가져오기
	public List<LocalDto> searchLocal(int cityCode);
	
	// 매장 추가
	public void shopRegistration(ShopDto shop);
	
	
	//---------------------------------------------
	
	
	//관리자 추가
	public void insertMgr(MgrDto mgrDto);	
	
	//세부 매장 가져오기
	public List<ShopDto> searchShopCode(int shopTypeCode);
	
	// 회원정보 수정
	public MgrDto showMgrInfo(String mgrId);
	public String showShopInfo(int shopCode);
	public int updateMgrInfo(MgrDto mgrDto);	
}
