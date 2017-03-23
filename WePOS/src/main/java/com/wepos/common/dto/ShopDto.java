package com.wepos.common.dto;

public class ShopDto {
  private int shopCode;
  private int shopTypeCode;
  private int cityCode;
  private int localCode;
  private String shopName;
  private String shopDesc;
  private String shopAddress;
  public int getShopCode() {
    return shopCode;
  }
  public void setShopCode( int shopCode ) {
    this.shopCode = shopCode;
  }
  public int getShopTypeCode() {
    return shopTypeCode;
  }
  public void setShopTypeCode( int shopTypeCode ) {
    this.shopTypeCode = shopTypeCode;
  }
  public int getCityCode() {
    return cityCode;
  }
  public void setCityCode( int cityCode ) {
    this.cityCode = cityCode;
  }
  public int getLocalCode() {
    return localCode;
  }
  public void setLocalCode( int localCode ) {
    this.localCode = localCode;
  }
  public String getShopName() {
    return shopName;
  }
  public void setShopName( String shopName ) {
    this.shopName = shopName;
  }
  public String getShopDesc() {
    return shopDesc;
  }
  public void setShopDesc( String shopDesc ) {
    this.shopDesc = shopDesc;
  }
  public String getShopAddress() {
    return shopAddress;
  }
  public void setShopAddress( String shopAddress ) {
    this.shopAddress = shopAddress;
  }
  
}