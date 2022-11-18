package dto;

import java.sql.Date;

public class QnaDTO {
	private int Qnum;
	private int Mnum;
	private int Pnum;
	private String title;
	private Date regdate;
	private String contents;
	private String image;
	private String secret;
	
	
	public QnaDTO() {};
	public QnaDTO(int qnum, int mnum, int pnum, String title, Date regdate, String contents, String image,
			String secret) {
		Qnum = qnum;
		Mnum = mnum;
		Pnum = pnum;
		this.title = title;
		this.regdate = regdate;
		this.contents = contents;
		this.image = image;
		this.secret = secret;
	}
	public int getQnum() {
		return Qnum;
	}
	public void setQnum(int qnum) {
		Qnum = qnum;
	}
	public int getMnum() {
		return Mnum;
	}
	public void setMnum(int mnum) {
		Mnum = mnum;
	}
	public int getPnum() {
		return Pnum;
	}
	public void setPnum(int pnum) {
		Pnum = pnum;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	@Override
	public String toString() {
		return "QnaDTO [Qnum=" + Qnum + ", Mnum=" + Mnum + ", Pnum=" + Pnum + ", title=" + title + ", regdate="
				+ regdate + ", contents=" + contents + ", image=" + image + ", secret=" + secret + "]";
	}
	
	
}
