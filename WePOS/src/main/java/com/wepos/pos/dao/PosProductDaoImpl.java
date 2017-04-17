package com.wepos.pos.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ProductDto;
import com.wepos.mgr.dto.CategoryDto;

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
	
	public List<ProductDto> countOrder(int shopCode){
		return getSqlSession().selectList("countOrder",shopCode);
	}
	
	public int checkName(ProductDto ProductDto){
		return getSqlSession().selectOne("checkProductName",ProductDto);
	}
}
