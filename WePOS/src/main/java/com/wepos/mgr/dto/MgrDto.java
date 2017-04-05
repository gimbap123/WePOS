package com.wepos.mgr.dto;

public class MgrDto {

	private String mgrId;
	private int shopCode;
	private String mgrPassword;
	private String mgrName;
	private String mgrPhone;
	
	public String getMgrId() {
		return mgrId;
	}
	public void setMgrId(String mgrId) {
		this.mgrId = mgrId;
	}
	public int getShopCode() {
		return shopCode;
	}
	public void setShopCode(int shopCode) {
		this.shopCode = shopCode;
	}
	public String getMgrPassword() {
		return mgrPassword;
	}
	public void setMgrPassword(String mgrPassword) {
		this.mgrPassword = mgrPassword;
	}
	public String getMgrName() {
		return mgrName;
	}
	public void setMgrName(String mgrName) {
		this.mgrName = mgrName;
	}
	public String getMgrPhone() {
		return mgrPhone;
	}
	public void setMgrPhone(String mgrPhone) {
		this.mgrPhone = mgrPhone;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "ShopMgrDto[mgrId="+mgrId+", shopCode="+shopCode+", mgrPw="+mgrPassword+", mgrName="+mgrName+", mgrPhone="+mgrPhone+"]";
	}
	
}
