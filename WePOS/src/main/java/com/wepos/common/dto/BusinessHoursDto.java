package com.wepos.common.dto;

// 영업 시간을 저장하는 Dto
public class BusinessHoursDto {
		
	private String startHourType;
	private String startHour;
	private String startMinute;
	private String endHourType;
	private String endHour;
	private String endMinute;
	
	public String getStartHourType() {
		return startHourType;
	}
	public void setStartHourType(String startHourType) {
		this.startHourType = startHourType;
	}
	public String getStartHour() {
		return startHour;
	}
	public void setStartHour(String startHour) {
		this.startHour = startHour;
	}
	public String getStartMinute() {
		return startMinute;
	}
	public void setStartMinute(String startMinute) {
		this.startMinute = startMinute;
	}
	public String getEndHourType() {
		return endHourType;
	}
	public void setEndHourType(String endHourType) {
		this.endHourType = endHourType;
	}
	public String getEndHour() {
		return endHour;
	}
	public void setEndHour(String endHour) {
		this.endHour = endHour;
	}
	public String getEndMinute() {
		return endMinute;
	}
	public void setEndMinute(String endMinute) {
		this.endMinute = endMinute;
	}

}