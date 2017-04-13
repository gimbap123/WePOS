package com.wepos.mgr.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ShopDto;

public class MgrDaoImpl extends SqlSessionDaoSupport implements MgrDao {
	
	public ShopDto shopInfo(int shopCode) {
		return getSqlSession().selectOne("shopInfo", shopCode);
	}
	
	public void shopInfoUpdate(ShopDto shop) {
		getSqlSession().update("shopInfoUpdate", shop);
	}
}
