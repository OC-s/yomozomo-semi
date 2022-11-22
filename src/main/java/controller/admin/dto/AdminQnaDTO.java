package controller.admin.dto;

import java.sql.Date;

public class AdminQnaDTO {
	private int qnum;
	private int mnum;
	private int pnum;
	private String title;
	private Date regdate;
	private String contents;
	private String acontents;
	
	public AdminQnaDTO() {}
	public AdminQnaDTO(int qnum, int mnum, int pnum, String title, Date regdate, String contents, String acontents) {
		this.qnum = qnum;
		this.mnum = mnum;
		this.pnum = pnum;
		this.title = title;
		this.regdate = regdate;
		this.contents = contents;
		this.acontents = acontents;
	}
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getAcontents() {
		return acontents;
	}
	public void setAcontents(String acontents) {
		this.acontents = acontents;
	}
	@Override
	public String toString() {
		return "AdminQnaDTO [qnum=" + qnum + ", mnum=" + mnum + ", pnum=" + pnum + ", title=" + title + ", regdate="
				+ regdate + ", contents=" + contents + ", acontents=" + acontents + "]";
	}
	
}
