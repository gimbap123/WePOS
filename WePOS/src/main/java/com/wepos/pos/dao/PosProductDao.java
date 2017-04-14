package com.wepos.pos.dao;

import com.wepos.common.dto.ProductDto;

public interface PosProductDao {
	
	// 테이블 추가
	public int createProduct(ProductDto productDto);

	// 테이블 정보 수정
	public int updateProduct(ProductDto productDto);
	
	// 테이블 삭제
	public int deleteProduct(int productCode);

}

