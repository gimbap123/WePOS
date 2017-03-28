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
	
	public int checkIdFromUsers(String userId) {
		return getSqlSession().selectOne("checkIdFromUsers",userId);
	}
	
	public int checkIdFromMgr(String mgrId) {
		return getSqlSession().selectOne("checkIdFromMgr",mgrId);
	}
	
	public int checkIdFromDeletedId(String deletedId) {
		return getSqlSession().selectOne("checkIdFromDeletedId",deletedId);
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
	
	public int deleteUserInfoFromUserLogin(String userId) {
		return getSqlSession().delete("deleteUserInfoFromUserLogin",userId);
	}
	
	public int deleteUserInfoFromUsers(String userId) {
		return getSqlSession().delete("deleteUserInfoFromUsers",userId);
	}
	
	public int deleteUserInfoFromMgrLogin(String mgrId) {
		return getSqlSession().delete("deleteUserInfoFromMgrLogin",mgrId);
	}
	
	public int deleteUserInfoFromMgr(String mgrId) {
		return getSqlSession().delete("deleteUserInfoFromMgr",mgrId);
	}
	
	public int deletedId(String userId) {
		return getSqlSession().insert("deletedId", userId);
	}

}
