package com.to.cdp.board.model;

public class Reply {
	private int replyNo;
	private int articleNo;
	private String replyContent;
	private String replyWriter;
	private String replyPw;
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public String getReplyPw() {
		return replyPw;
	}
	public void setReplyPw(String replyPw) {
		this.replyPw = replyPw;
	}
	
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", articleNo=" + articleNo + ", replyContent=" + replyContent
				+ ", replyWriter=" + replyWriter + ", replyPw=" + replyPw + "]";
	}
}