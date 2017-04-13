package com.wepos.mgr.dao;

import com.wepos.common.dto.ShopDto;

public interface MgrDao {
	
	// 매장 정보
	public ShopDto shopInfo(int shopCode);

	// 매장 정보 수정
	public void shopInfoUpdate(ShopDto shop);
	
}
