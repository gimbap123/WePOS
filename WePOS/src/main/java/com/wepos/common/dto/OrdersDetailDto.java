package com.wepos.common.dto;

public class OrdersDetailDto {
  private int orderCode;
  private int productCode;
  private int orderAmount;
  private int orderPrice;
  
  public int getOrderCode() {
    return orderCode;
  }
  public void setOrderCode( int orderCode ) {
    this.orderCode = orderCode;
  }
  public int getProductCode() {
    return productCode;
  }
  public void setProductCode( int productCode ) {
    this.productCode = productCode;
  }
  public int getOrderAmount() {
    return orderAmount;
  }
  public void setOrderAmount( int orderAmount ) {
    this.orderAmount = orderAmount;
  }
  public int getOrderPrice() {
    return orderPrice;
  }
  public void setOrderPrice( int orderPrice ) {
    this.orderPrice = orderPrice;
  }
  
  @Override
  public String toString() {
    return "OrdersDetail Dto ["
        + " orderCode = " + orderCode + ","
        + " productCode = " + productCode + ","
        + " orderAmount = " + orderAmount + ","
        + " orderPrice = " + orderPrice
        + "]";
  }
}
