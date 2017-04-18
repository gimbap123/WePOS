package com.wepos.user.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.user.dto.ProductGradeDto;

public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {

	public void insertProductGrade(ProductGradeDto productGrade) {
		getSqlSession().insert("insertProductGrade", productGrade);	
	}
}
