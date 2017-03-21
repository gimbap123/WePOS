package com.wepos.user.dto;

import java.sql.Date;

public class UserLoginDto {
	
	private String userId;
	private Date userLoginDate;
	// 0 - 로그아웃, 1 - 로그인
	private char userLoginState;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getUserLoginDate() {
		return userLoginDate;
	}
	public void setUserLoginDate(Date userLoginDate) {
		this.userLoginDate = userLoginDate;
	}
	public char getUserLoginState() {
		return userLoginState;
	}
	public void setUserLoginState(char userLoginState) {
		this.userLoginState = userLoginState;
	}
	
}
