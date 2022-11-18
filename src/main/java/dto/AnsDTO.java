package dto;

import java.sql.Date;

public class AnsDTO {
	private int anum;
	private int qnum;
	private String contents;
	private Date regdate;
	
	
	public AnsDTO() {}
	public AnsDTO(int anum, int qnum, String contents, Date regdate) {

		this.anum = anum;
		this.qnum = qnum;
		this.contents = contents;
		this.regdate = regdate;
	}
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "AnsDTO [anum=" + anum + ", qnum=" + qnum + ", contents=" + contents + ", regdate=" + regdate + "]";
	}
	
	

}
