package com.wepos.user.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.user.dto.ProductGradeDto;

public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {

	public void productGradeWrite(ProductGradeDto productGrade) {
		getSqlSession().insert("productGradeWrite", productGrade);	
	}
	
	public List<ProductGradeDto> productGradeList(Map<String, Object> map) {
		List<ProductGradeDto> productGradeList = getSqlSession().selectList("productGradeList", map);
		return productGradeList;
	}
	
	public void productGradeUpdate(ProductGradeDto productGrade) {
		getSqlSession().update("productGradeUpdate", productGrade);
	}
	
	public void productGradeDelete(ProductGradeDto productGrad) {
		getSqlSession().delete("productGradeDelete", productGrad);
	}
	
	public int productGradeCount(int productCode) {		
		return getSqlSession().selectOne("productGradeCount", productCode);
	}
	
	public List<ProductGradeDto> productGradeModalList(Map<String, Object> map) {
		List<ProductGradeDto> productGradeModalList = getSqlSession().selectList("productGradeModalList", map);
		return productGradeModalList;
	}
	
}
