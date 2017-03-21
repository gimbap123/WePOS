package com.wepos.mgr.dto;

import java.sql.Date;

public class MgrLoginDto {
	
	private String mgrId;
	private Date mgrLoginDate;
	// 0 - 로그아웃, 1 - 로그인
	private char mgrLoginState;
	
	public String getMgrId() {
		return mgrId;
	}	
	public void setMgrId(String mgrId) {
		this.mgrId = mgrId;
	}
	public Date getMgrLoginDate() {
		return mgrLoginDate;
	}
	public void setMgrLoginDate(Date mgrLoginDate) {
		this.mgrLoginDate = mgrLoginDate;
	}
	public char getMgrLoginState() {
		return mgrLoginState;
	}
	public void setMgrLoginState(char mgrLoginState) {
		this.mgrLoginState = mgrLoginState;
	}

}
