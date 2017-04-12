package com.wepos.pos.dao;

import com.wepos.common.dto.TablesDto;

public interface PosTableDao {
	
	// 테이블 추가
	public int createTable(TablesDto tablesDto);

	// 테이블 정보 수정
	public int updateTable(TablesDto tablesDto);
	
	// 테이블 삭제
	public int deleteTable(int tableCode);

}

