package com.wepos.pos.dao;

import com.wepos.common.dto.TablesDto;

public interface PosMenuDao {
	
	// 테이블 추가
	public int createMenu(TablesDto tablesDto);

	// 테이블 정보 수정
	public int updateMenu(TablesDto tablesDto);
	
	// 테이블 삭제
	public int deleteMenu(int tableCode);

}

