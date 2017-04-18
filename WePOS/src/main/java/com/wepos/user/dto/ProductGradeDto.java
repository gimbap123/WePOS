package com.wepos.user.dto;

public class ProductGradeDto {
	
	private String userId;
	private int productCode;
	private int grade;
	private String gradeComment;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getGradeComment() {
		return gradeComment;
	}
	public void setGradeComment(String gradeComment) {
		this.gradeComment = gradeComment;
	}

}
