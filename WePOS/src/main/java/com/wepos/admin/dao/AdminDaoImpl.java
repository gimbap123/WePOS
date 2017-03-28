package com.wepos.admin.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.admin.dto.CityDto;
import com.wepos.admin.dto.LocalDto;
import com.wepos.admin.dto.ShopTypeDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.dto.UsersDto;

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

	
	
	
}
