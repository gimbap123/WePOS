package com.wepos.admin.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.admin.dto.City;
import com.wepos.admin.dto.ShopType;

public class AdminDaoImpl extends SqlSessionDaoSupport implements AdminDao {

	public List<ShopType> getShopType() {	
		List<ShopType> shopTypeList = getSqlSession().selectList("getShopType");
		return shopTypeList;
	}
	
	public List<City> getCity() {
		List<City> cityList = getSqlSession().selectList("getCity");
		return cityList;
	}

}
