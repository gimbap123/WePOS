package com.wepos.common.dto;

import java.util.Date;

public class OrdersDto {
  private int orderCode;
  private int shopCode;
  private int tableCode;
  private String userId;
  private int paymentCode;
  private Date orderDate;
  private char orderState;
  
  public int getOrderCode() {
    return orderCode;
  }
  public void setOrderCode( int orderCode ) {
    this.orderCode = orderCode;
  }
  public int getShopCode() {
    return shopCode;
  }
  public void setShopCode( int shopCode ) {
    this.shopCode = shopCode;
  }
  public int getTableCode() {
    return tableCode;
  }
  public void setTableCode( int tableCode ) {
    this.tableCode = tableCode;
  }
  public String getUserId() {
    return userId;
  }
  public void setUserId( String userId ) {
    this.userId = userId;
  }
  public int getPaymentCode() {
    return paymentCode;
  }
  public void setPaymentCode( int paymentCode ) {
    this.paymentCode = paymentCode;
  }
  public Date getOrderDate() {
    return orderDate;
  }
  public void setOrderDate( Date orderDate ) {
    this.orderDate = orderDate;
  }
  public char getOrderState() {
    return orderState;
  }
  public void setOrderState( char orderState ) {
    this.orderState = orderState;
  }
  
  @Override
  public String toString() {
    return "Orders Dto ["
        + " orderCode = " + orderCode + ","
        + " shopCode = " + shopCode + ","
        + " tableCode = " + tableCode + ","
        + " userId = " + userId + ","
        + " paymentCode = " + paymentCode + "," 
        + " orderDate = " + orderDate + "," 
        + " orderState = " + orderState 
        + "]";
  }
} 
