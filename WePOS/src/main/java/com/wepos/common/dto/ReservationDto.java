package com.wepos.common.dto;

public class ReservationDto {

	private int reseNumber;
	private String userId;
	private int shopCode;
	private int resPersons;
	private String resDate;
	private String resDesc;
	private String resState;
	private String resFinalDate;
	
	public int getReseNumber() {
		return reseNumber;
	}

	public void setReseNumber(int reseNumber) {
		this.reseNumber = reseNumber;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getShopCode() {
		return shopCode;
	}

	public void setShopCode(int shopCode) {
		this.shopCode = shopCode;
	}

	public int getResPersons() {
		return resPersons;
	}

	public void setResPersons(int resPersons) {
		this.resPersons = resPersons;
	}

	public String getResDate() {
		return resDate;
	}

	public void setResDate(String resDate) {
		this.resDate = resDate;
	}

	public String getResDesc() {
		return resDesc;
	}

	public void setResDesc(String resDesc) {
		this.resDesc = resDesc;
	}

	public String getResState() {
		return resState;
	}

	public void setResState(String resState) {
		this.resState = resState;
	}

	public String getResFinalDate() {
		return resFinalDate;
	}
	
	public void setResFinalDate(String resFinalDate) {
		this.resFinalDate = resFinalDate;
	}

	@Override
	public String toString() {
		return "ReservationDto[reseNumber="+reseNumber+", userId="+userId+", shopCode="+shopCode+", resPersons="+resPersons
			+", resDate="+resDate+", resDesc="+resDesc+", resState="+resState+"]";
	}
	
}
