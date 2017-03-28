package com.wepos.pos.dto;

public class PosMainDto {
  private int shopCode;
  private String shopName;
  private int tableCode;
  private String tableName;
  
  public int getShopCode() {
    return shopCode;
  }
  public void setShopCode( int shopCode ) {
    this.shopCode = shopCode;
  }
  public String getShopName() {
    return shopName;
  }
  public void setShopName( String shopName ) {
    this.shopName = shopName;
  }
  public int getTableCode() {
    return tableCode;
  }
  public void setTableCode( int tableCode ) {
    this.tableCode = tableCode;
  }
  public String getTableName() {
    return tableName;
  }
  public void setTableName( String tableName ) {
    this.tableName = tableName;
  }
  @Override
  public String toString() {
    return "PosMainDto [shopCode = " + shopCode + ", shopName = " + shopName + ", tableCode = " + tableCode + ", tableName = " + tableName 
        + "]";
  }
}
