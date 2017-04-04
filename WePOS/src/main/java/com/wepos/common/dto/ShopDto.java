package com.wepos.common.dto;

import org.springframework.web.multipart.MultipartFile;

public class ShopDto {
  private int shopCode;
  private int shopTypeCode;
  private int cityCode;
  private int localCode;
  private String shopName;
  private String shopDesc;
  private String shopAddress;
  private String shopPhone;
  private String shopFile;
  private MultipartFile upload;
  
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
  public String getShopPhone() {
		return shopPhone;
	}
  public void setShopPhone(String shopPhone) {
	this.shopPhone = shopPhone;
  }  
  public String getShopFile() {
	return shopFile;
  }
  public void setShopFile(String shopFile) {
	this.shopFile = shopFile;
  }
  public MultipartFile getUpload() {
	return upload;
  }
  public void setUpload(MultipartFile upload) {
	this.upload = upload;
  }
  
}
