package com.oneday.place;

public class PlaceHoldVO {
	private int hSeq;
	private String hTitle;
	private String hTmapImg;
	private int mSeq;
	private String hRegdate;
	private String hDel;
	
	public int gethSeq() {
		return hSeq;
	}
	public void sethSeq(int hSeq) {
		this.hSeq = hSeq;
	}
	public String gethTitle() {
		return hTitle;
	}
	public void sethTitle(String hTitle) {
		this.hTitle = hTitle;
	}
	public String gethTmapImg() {
		return hTmapImg;
	}
	public void sethTmapImg(String hTmapImg) {
		this.hTmapImg = hTmapImg;
	}
	public int getmSeq() {
		return mSeq;
	}
	public void setmSeq(int mSeq) {
		this.mSeq = mSeq;
	}
	public String gethRegdate() {
		return hRegdate;
	}
	public void sethRegdate(String hRegdate) {
		this.hRegdate = hRegdate;
	}
	public String gethDel() {
		return hDel;
	}
	public void sethDel(String hDel) {
		this.hDel = hDel;
	}
	
}
