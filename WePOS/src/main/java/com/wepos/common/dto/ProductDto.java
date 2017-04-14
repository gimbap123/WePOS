package com.wepos.common.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDto {
  private int productCode;
  private int shopCode;
  private int categoryCode;
  private String categoryName;
  private String productName;
  private int productPrice;
  private int productStock;
  private String productDesc;
  private String productFile;
  private MultipartFile upload;
  
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
  public String getCategoryName() {
	return categoryName;
}
public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
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
  public String getProductFile() {
	return productFile;
  }
  public void setProductFile(String productFile) {
	this.productFile = productFile;
  }
  public MultipartFile getUpload() {
	return upload;
  }
  public void setUpload(MultipartFile upload) {
	this.upload = upload;
  }
  
}
