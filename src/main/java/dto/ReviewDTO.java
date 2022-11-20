package dto;

import java.sql.Date;

public class ReviewDTO {
	private Date regdate;
	private int scope;
	private String image;
	private String contents;
	private int mnum;
	public ReviewDTO() {}
	
	public ReviewDTO(Date regdate, int scope, String image, String contents, int mnum) {

		this.regdate = regdate;
		this.scope = scope;
		this.image = image;
		this.contents = contents;
		this.mnum = mnum;
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
	
	
}
