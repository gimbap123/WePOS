package com.wepos.common.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ProductDto;

public class ProductDaoImpl extends SqlSessionDaoSupport implements ProductDao {

	public int searchProductCount(Map<String, Object> map) {
		return getSqlSession().selectOne("searchProductCount", map);
	}
	
	public List<ProductDto> searchProduct(Map<String, Object> map) {
		List<ProductDto> productList = getSqlSession().selectList("searchProduct", map);
		return productList;
	}

}
