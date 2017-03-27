package com.wepos.common.dao;

import java.util.Map;

import com.wepos.common.dto.UsersDto;
import com.wepos.mgr.dto.MgrLoginDto;
import com.wepos.user.dto.UserLoginDto;

public interface CommonDao {

	// 아이디 찾기
	public String findId(UsersDto user);
	
	// 패스워드 찾기
	public int findPw(UsersDto user);
	
	// 패스워드 변경
	public void updatePw(UsersDto user);
	
	// 회원가입
	public int registration(UsersDto user);
	
	// 아이디 중복검사
	public int checkIdFromUsers(UsersDto user);
	public int checkIdFromMgr(UsersDto user);
	
	// 일반 회원 로그인 검사
	public int userLogin(Map<String, String> loginInfo);
	
	// 관리자 로그인 검사
	public int mgrLogin(Map<String, String> loginInfo);
	
	// 일반 회원 로그인 기록
	public void userLoginLog(UserLoginDto userLoginDto);
	
	// 관리자 로그인 기록
	public void mgrLoginLog(MgrLoginDto mgrLoginDto);
	
	// 회원정보 수정
	public UsersDto showUserInfo(UsersDto user);
	public int updateUserInfo(UsersDto user);
}
