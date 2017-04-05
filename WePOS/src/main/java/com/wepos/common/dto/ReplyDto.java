package com.wepos.common.dto;

import java.sql.Date;

public class ReplyDto {

	private int replyNumber;
	private int boardNumber;
	private String totalId;
	private String replyContent;
	private Date replyDate;
	
	public int getReplyNumber() {
		return replyNumber;
	}
	public void setReplyNumber(int replyNumber) {
		this.replyNumber = replyNumber;
	}
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getTotalId() {
		return totalId;
	}
	public void setTotalId(String totalId) {
		this.totalId = totalId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	
	@Override
	public String toString() {
		return "replyDto[replyNumber="+replyNumber+", boardNumber="+boardNumber+", totalId="+totalId+", replyContent="+replyContent+"]";
	}

}
