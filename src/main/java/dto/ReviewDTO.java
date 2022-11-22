package dto;

import java.sql.Date;

public class ReviewDTO {
	private Date regdate;
	private int scope;
	private String image;
	private String contents;
	private int mnum;
	private int rnum;
	private int pnum;
	public ReviewDTO() {}
	
	public ReviewDTO(Date regdate, int scope, String image, String contents, int mnum, int rnum, int pnum) {
		super();
		this.regdate = regdate;
		this.scope = scope;
		this.image = image;
		this.contents = contents;
		this.mnum = mnum;
		this.rnum = rnum;
		this.pnum = pnum;
	}

	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getScope() {
		return scope;
	}
	public void setScope(int scope) {
		this.scope = scope;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	
	
	
	
}
