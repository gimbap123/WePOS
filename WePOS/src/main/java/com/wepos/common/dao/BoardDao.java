package com.wepos.common.dao;

import java.util.List;
import java.util.Map;

import com.wepos.common.dto.BoardDto;

public interface BoardDao {

	//글 목록보기
	public List<BoardDto> list();
	
	//총 레코드 수 구하기
	public int getRowCount();	
	
}
