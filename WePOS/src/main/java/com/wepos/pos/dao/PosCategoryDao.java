package com.wepos.pos.dao;

import com.wepos.mgr.dto.CategoryDto;

public interface PosCategoryDao {
	
	// 테이블 추가
	public int createCategory(CategoryDto categoryDto);

	// 테이블 정보 수정
	public int updateCategory(CategoryDto categoryDto);
	
	// 테이블 삭제
	public int deleteCategory(CategoryDto categoryDto);

}

