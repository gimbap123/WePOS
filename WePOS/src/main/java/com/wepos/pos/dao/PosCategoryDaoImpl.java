package com.wepos.pos.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.mgr.dto.CategoryDto;

public class PosCategoryDaoImpl extends SqlSessionDaoSupport implements PosCategoryDao{
	
	public List<CategoryDto> selectCategory(int shopCode){
		return getSqlSession().selectList("selectCategory",shopCode);
	}
	
	public List<CategoryDto> countProduct(int shopCode){
		return getSqlSession().selectList("countProduct",shopCode);
	}
	
	public int createCategory(CategoryDto categoryDto){
		return getSqlSession().insert("createCategory",categoryDto);
	}
	
	public int updateCategory(CategoryDto categoryDto){
		return getSqlSession().update( "updateCategory", categoryDto );
	}
	
	public int deleteCategory(CategoryDto categoryDto){
		return getSqlSession().delete("deleteCategory",categoryDto);
	}
	
	public int checkName(CategoryDto categoryDto){
		return getSqlSession().selectOne("checkCategoryName",categoryDto);
	}
	
}
