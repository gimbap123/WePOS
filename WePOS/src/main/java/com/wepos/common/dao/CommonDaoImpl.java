package com.wepos.common.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.UsersDto;

public class CommonDaoImpl extends SqlSessionDaoSupport implements CommonDao {

	public String findId(UsersDto user) {		
		return getSqlSession().selectOne("findId", user);
	}
	
	public int registration(UsersDto user) {
		return getSqlSession().insert("registration",user);
	}
	
	public String checkId(UsersDto user) {
		return getSqlSession().selectOne("checkId",user);
	}

}
