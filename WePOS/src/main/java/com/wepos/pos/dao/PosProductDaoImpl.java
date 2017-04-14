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
	
	public int deleteProduct(ProductDto productDto){
		return getSqlSession().delete("deleteProduct",productDto);
	}
}
