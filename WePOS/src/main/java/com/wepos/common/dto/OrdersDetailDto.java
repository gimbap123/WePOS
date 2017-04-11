package com.wepos.common.dto;

public class OrdersDetailDto {
  private int orderCode;
  private int productCode;
  private String productName;
  private int orderAmount;
  private int orderPrice;
  private int tableCode;
  
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
  public int getTableCode() {
    return tableCode;
  }
  public void setTableCode( int tableCode ) {
    this.tableCode = tableCode;
  } 
  
  public String getProductName() {
    return productName;
  }
  public void setProductName( String productName ) {
    this.productName = productName;
  }
  @Override
  public String toString() {
    return "OrdersDetail Dto [ "
        + " orderCode = " + orderCode + ","
        + " productCode = " + productCode + ","
        + " productName = " + productName + ","
        + " orderAmount = " + orderAmount + ","
        + " orderPrice = " + orderPrice + ","
        + " tableCode = " + tableCode 
        + " ]";
  }

}
