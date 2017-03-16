package com.wepos.common.dto;

import java.sql.Date;

public class BoardDto {

	private int boardNumber;
	private String boardTitle;
	private String totalId;
	private Date boardDate;
	private int boardReadCnt;
	private int boardTypeCode;
	private String boardContent;
	private String boardFile;
	
	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getTotalId() {
		return totalId;
	}

	public void setTotalId(String totalId) {
		this.totalId = totalId;
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

	public int getBoardTypeCode() {
		return boardTypeCode;
	}

	public void setBoardTypeCode(int boardTypeCode) {
		this.boardTypeCode = boardTypeCode;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardFile() {
		return boardFile;
	}

	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "BoardDto[boardNumber="+boardNumber+", boardTitle="+boardTitle+", totalId="
				+totalId+", Date="+boardDate+", readCnt="+boardReadCnt+"]";
	}
	
}
