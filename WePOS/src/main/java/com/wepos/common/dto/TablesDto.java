package com.wepos.common.dto;

public class TablesDto {
  private int tableCode;
  private int shopCode;
  private String tableName;
  private String tableDesc;
  private char tableState;
  private int tableMax;
  
  public int getTableCode() {
    return tableCode;
  }
  public void setTableCode( int tableCode ) {
    this.tableCode = tableCode;
  }
  public int getShopCode() {
    return shopCode;
  }
  public void setShopCode( int shopCode ) {
    this.shopCode = shopCode;
  }
  public String getTableName() {
    return tableName;
  }
  public void setTableName( String tableName ) {
    this.tableName = tableName;
  }
  public String getTableDesc() {
    return tableDesc;
  }
  public void setTableDesc( String tableDesc ) {
    this.tableDesc = tableDesc;
  }
  public char getTableState() {
    return tableState;
  }
  public void setTableState( char tableState ) {
    this.tableState = tableState;
  }
  public int getTableMax() {
    return tableMax;
  }
  public void setTableMax( int tableMax ) {
    this.tableMax = tableMax;
  }
  
  @Override
  public String toString() {
    return "Tables Dto ["
        + " tableCode = " + tableCode + ","
        + " shopCode = " + shopCode + ","
        + " tableName = " + tableName + ","
        + " tableDesc = " + tableDesc + ","
        + " tableState = " + tableState + "," 
        + " tableMax = " + tableMax 
        + "]";
  }
}
