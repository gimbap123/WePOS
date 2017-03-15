package com.wepos.common.dto;

import java.sql.Date;

public class BoardDto {

	private int boardNumber;
	private String boardTitle;
	private String totalId;
	private Date date;
	private int readCnt;
	
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "BoardDto[boardNumber="+boardNumber+", boardTitle="+boardTitle+", totalId="
				+totalId+", Date="+date+", readCnt="+readCnt+"]";
	}
	
}
