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
	
	public int checkIdFromUsers(UsersDto user) {
		return getSqlSession().selectOne("checkIdFromUsers",user);
	}
	
	public int checkIdFromMgr(UsersDto user) {
		return getSqlSession().selectOne("checkIdFromMgr",user);
	}
	
	public int checkIdFromDeletedId(UsersDto user) {
		return getSqlSession().selectOne("checkIdFromDeletedId",user);
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
	
	public UsersDto showUserInfo(UsersDto user){
		return getSqlSession().selectOne("showUserInfo",user);
	}
	
	public int updateUserInfo(UsersDto user) {
		return getSqlSession().update("updateUserInfo",user);		
	}
	
	public int deleteUserInfoFromUserLogin(String user) {
		return getSqlSession().delete("deleteUserInfoFromUserLogin",user);
	}
	
	public int deleteUserInfoFromUsers(String user) {
		return getSqlSession().delete("deleteUserInfoFromUsers",user);
	}
	
	public int deleteUserInfoFromMgrLogin(String user) {
		return getSqlSession().delete("deleteUserInfoFromMgrLogin",user);
	}
	
	public int deleteUserInfoFromMgr(String user) {
		return getSqlSession().delete("deleteUserInfoFromMgr",user);
	}
	
	public int deletedId(String user) {
		return getSqlSession().insert("deletedId", user);
	}

}
