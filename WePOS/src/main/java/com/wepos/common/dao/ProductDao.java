package com.wepos.common.dao;

import java.util.List;
import java.util.Map;

import com.wepos.common.dto.ProductDto;

public interface ProductDao {
	
	// 상품 갯수
	public int searchProductCount(Map<String, Object> map);
	
	// 상품 리스트
	public List<ProductDto> searchProduct(Map<String, Object> map);

}
