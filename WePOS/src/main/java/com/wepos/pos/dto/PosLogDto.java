package com.wepos.pos.dto;

import java.sql.Date;

public class PosLogDto {
	private Date orderDate;
	private int tableCode;
	private String productName;
	private String productPrice;
	private int orderAmount;
	private int orderPrice;
	private Date calendarBegin;
	private Date calendarEnd;
	
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getTableCode() {
		return tableCode;
	}
	public void setTableCode(int tableCode) {
		this.tableCode = tableCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public int getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public Date getCalendarBegin() {
		return calendarBegin;
	}
	public void setCalendarBegin(Date calendarBegin) {
		this.calendarBegin = calendarBegin;
	}
	public Date getCalendarEnd() {
		return calendarEnd;
	}
	public void setCalendarEnd(Date calendarEnd) {
		this.calendarEnd = calendarEnd;
	}
		
}
