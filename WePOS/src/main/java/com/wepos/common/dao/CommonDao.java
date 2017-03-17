package com.wepos.common.dao;

import com.wepos.common.dto.UsersDto;

public interface CommonDao {

	// 아이디 찾기
	public String findId(UsersDto user);
	
	// 비밀번호 찾기
	public int findPw(UsersDto user);
	
	// 비밀번호 변경
	public void updatePw(UsersDto user);
	
	// 회원가입
	public int registration(UsersDto user);
	
	// 아이디 중복검사
	public int checkId(UsersDto user);
	
}
