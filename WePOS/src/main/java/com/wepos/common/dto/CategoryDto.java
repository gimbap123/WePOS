package com.wepos.common.dto;

public class CategoryDto {
  private int shopCode;
  private int categoryCode;
  private String categoryName;
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
  public String getCategoryName() {
    return categoryName;
  }
  public void setCategoryName( String categoryName ) {
    this.categoryName = categoryName;
  }
  
  @Override
  public String toString(){
    return "CategoryDto [" +
        " shopCode : " + shopCode +
        " categoryCode : " + categoryCode +
        " categoryName : " + categoryName +
        " ]";
  }
}
