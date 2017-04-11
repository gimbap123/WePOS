package com.wepos.common.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ShopBoardDto {
	
	private int boardNumber;
	private int shopCode;
	private String totalId;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private int boardReadCnt;
	private String boardFile;
	private MultipartFile upload;	
		
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	public int getShopCode() {
		return shopCode;
	}
	public void setShopCode(int shopCode) {
		this.shopCode = shopCode;
	}
	public String getTotalId() {
		return totalId;
	}
	public void setTotalId(String totalId) {
		this.totalId = totalId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardReadCnt() {
		return boardReadCnt;
	}
	public void setBoardReadCnt(int boardReadCnt) {
		this.boardReadCnt = boardReadCnt;
	}
	public String getBoardFile() {
		return boardFile;
	}
	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
}
