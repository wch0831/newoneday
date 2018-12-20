package com.oneday.review;

public class ReviewVO {

	private int rSeq;
	private int oSeq;
	private int mSeq;
	private String rContent;
	private String rRegdate;
	private String oTitle;
	private String mNick;
	
	public int getrSeq() {
		return rSeq;
	}
	public void setrSeq(int rSeq) {
		this.rSeq = rSeq;
	}
	public int getoSeq() {
		return oSeq;
	}
	public void setoSeq(int oSeq) {
		this.oSeq = oSeq;
	}
	public int getmSeq() {
		return mSeq;
	}
	public void setmSeq(int mSeq) {
		this.mSeq = mSeq;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrRegdate() {
		return rRegdate;
	}
	public void setrRegdate(String rRegdate) {
		this.rRegdate = rRegdate;
	}
	public String getoTitle() {
		return oTitle;
	}
	public void setoTitle(String oTitle) {
		this.oTitle = oTitle;
	}
	public String getmNick() {
		return mNick;
	}
	public void setmNick(String mNick) {
		this.mNick = mNick;
	}
	
	

	
}
