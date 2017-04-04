package com.wepos.common.dto;

public class ProductDto {
  private int productCode;
  private int shopCode;
  private int categoryCode;
  private String productName;
  private int productPrice;
  private int productStock;
  private String productDesc;
  
  public int getProductCode() {
    return productCode;
  }
  public void setProductCode( int productCode ) {
    this.productCode = productCode;
  }
  public int getShopCode() {
    return shopCode;
  }
  public void setShopCode( int shopCode ) {
    this.shopCode = shopCode;
  }
  public int getCategoryCode() {
    return categoryCode;
  }
  public void setCategoryCode( int categoryCode ) {
    this.categoryCode = categoryCode;
  }
  public String getProductName() {
    return productName;
  }
  public void setProductName( String productName ) {
    this.productName = productName;
  }
  public int getProductPrice() {
    return productPrice;
  }
  public void setProductPrice( int productPrice ) {
    this.productPrice = productPrice;
  }
  public int getProductStock() {
    return productStock;
  }
  public void setProductStock( int productStock ) {
    this.productStock = productStock;
  }
  public String getProductDesc() {
    return productDesc;
  }
  public void setProductDesc( String productDesc ) {
    this.productDesc = productDesc;
  }
}