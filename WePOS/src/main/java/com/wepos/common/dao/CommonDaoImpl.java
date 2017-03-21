package com.wepos.common.dao;

import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.UsersDto;
import com.wepos.mgr.dto.MgrLoginDto;
import com.wepos.user.dto.UserLoginDto;

public class CommonDaoImpl extends SqlSessionDaoSupport implements CommonDao {

	public String findId(UsersDto user) {		
		return getSqlSession().selectOne("findId", user);
	}
	
	public int findPw(UsersDto user) {
		return getSqlSession().selectOne("findPw", user);
	}
	
	public void updatePw(UsersDto user) {
		getSqlSession().update("updatePw", user);
	}
	
	public int registration(UsersDto user) {
		return getSqlSession().insert("registration",user);
	}
	
	public int checkId(UsersDto user) {
		return getSqlSession().selectOne("checkId",user);
	}
	
	public int userLogin(Map<String, String> loginInfo) {
		return getSqlSession().selectOne("userLogin", loginInfo);
	}
	
	public int mgrLogin(Map<String, String> loginInfo) {
		return getSqlSession().selectOne("mgrLogin", loginInfo);
	}
	
	public void userLoginLog(UserLoginDto userLoginDto) {
		getSqlSession().insert("userLoginLog", userLoginDto);		
	}
	
	public void mgrLoginLog(MgrLoginDto mgrLoginDto) {
		getSqlSession().insert("mgrLoginLog", mgrLoginDto);		
	}

}
