package com.wepos.pos.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ProductDto;

public class PosProductDaoImpl extends SqlSessionDaoSupport implements PosProductDao{
	
	public int createProduct(ProductDto productDto){
		return getSqlSession().insert("createProduct",productDto);
	}
	
	public int updateProduct(ProductDto productDto){
		return getSqlSession().update( "updateProduct", productDto );
	}
	
	public int deleteProduct(int productCode){
		return getSqlSession().delete("deleteProduct",productCode);
	}
}
