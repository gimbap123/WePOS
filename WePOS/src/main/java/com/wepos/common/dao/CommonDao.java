package com.wepos.common.dao;

import com.wepos.common.dto.UsersDto;

public interface CommonDao {

	// 아이디 찾기
	public String findId(UsersDto user);
	
	// 회원가입
	public int registration(UsersDto user);
	
	// 아이디 중복검사
	public String checkId(UsersDto user);
	
}
