package com.wepos.common.dto;

public class SumOrdersDetailDto {
  private int orderCode;
  private int productCode;
  private String productName;
  private int sumOrderAmount;
  private int sumOrderPrice;
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
  public int getSumOrderAmount() {
    return sumOrderAmount;
  }
  public void setSumOrderAmount( int sumOrderAmount ) {
    this.sumOrderAmount = sumOrderAmount;
  }
  public int getSumOrderPrice() {
    return sumOrderPrice;
  }
  public void setSumOrderPrice( int sumOrderPrice ) {
    this.sumOrderPrice = sumOrderPrice;
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
        + " sumOrderAmount = " + sumOrderAmount + ","
        + " sumOrderPrice = " + sumOrderPrice + ","
        + " tableCode = " + tableCode 
        + " ]";
  }

}
