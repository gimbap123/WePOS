package com.wepos.pos.dao;

import java.util.List;

import com.wepos.mgr.dto.CategoryDto;

public interface PosCategoryDao {
	
	// 상품분류 조회
	public List<CategoryDto> selectCategory(int shopCode);
	
	// 상품분류에 등록된 상품 개수 조회
	public List<CategoryDto> countProduct(int shopCode);
	
	// 상품분류 추가
	public int createCategory(CategoryDto categoryDto);

	// 상품분류 수정
	public int updateCategory(CategoryDto categoryDto);
	
	// 상품분류 삭제
	public int deleteCategory(CategoryDto categoryDto);

}

