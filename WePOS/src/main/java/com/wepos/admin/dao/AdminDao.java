package com.wepos.admin.dao;

import java.util.List;

import com.wepos.admin.dto.CityDto;
import com.wepos.admin.dto.LocalDto;
import com.wepos.admin.dto.ShopTypeDto;
import com.wepos.common.dto.ShopDto;

public interface AdminDao {
	
	// 매장 종류
	public List<ShopTypeDto> getShopType();
	
	// 지역 정보 가져오기
	public List<CityDto> getCity();
	
	// 시, 군 정보 가져오기
	public List<LocalDto> searchLocal(int cityCode);
	
	// 매장 추가
	public void shopRegistration(ShopDto shop);
}
