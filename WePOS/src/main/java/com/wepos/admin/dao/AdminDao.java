package com.wepos.admin.dao;

import java.util.List;

import com.wepos.admin.dto.City;
import com.wepos.admin.dto.ShopType;

public interface AdminDao {
	
	// 매장 종류
	public List<ShopType> getShopType();
	
	// 지역 가져오기
	public List<City> getCity();
}
