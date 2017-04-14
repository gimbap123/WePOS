package com.wepos.pos.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ProductDto;
import com.wepos.mgr.dto.CategoryDto;

public class PosCategoryDaoImpl extends SqlSessionDaoSupport implements PosCategoryDao{
	
	public int createCategory(CategoryDto categoryDto){
		return getSqlSession().insert("createCategory",categoryDto);
	}
	
	public int updateCategory(CategoryDto categoryDto){
		return getSqlSession().update( "updateCategory", categoryDto );
	}
	
	public int deleteCategory(CategoryDto categoryDto){
		return getSqlSession().delete("deleteCategory",categoryDto);
	}
}
