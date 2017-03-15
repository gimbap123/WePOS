package com.wepos.common.dao;

import com.wepos.common.dto.UsersDto;

public interface CommonDao {

	// 아이디 찾기
	public String findId(UsersDto user);
	
}
