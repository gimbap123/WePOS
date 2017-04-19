package com.wepos.user.dao;

import java.util.List;
import java.util.Map;

import com.wepos.user.dto.ProductGradeDto;

public interface UserDao {
	
	// 상품 평점 주기
	public void productGradeWrite(ProductGradeDto productGrade);
	
	// 등록한 상점 평점 가져오기
	public List<ProductGradeDto> productGradeList(Map<String, Object> map);
	
	// 상품 평점 수정
	public void productGradeUpdate(ProductGradeDto productGrade);
	
	// 상품 평점 삭제
	public void productGradeDelete(ProductGradeDto productGrad);
}
