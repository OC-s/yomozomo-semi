package dto;

public class AnsQnaDTO {
	private String title;
	private String qcontents;
	private String acontents;
	
	public AnsQnaDTO() {}
	
	public AnsQnaDTO(String title, String qcontents,String acontents) {
		this.title = title;
		this.qcontents = qcontents;
		this.acontents = acontents;
	}

	
	public String getQcontents() {
		return qcontents;
	}

	public void setQcontents(String qcontents) {
		this.qcontents = qcontents;
	}

	public String getAcontents() {
		return acontents;
	}

	public void setAcontents(String acontents) {
		this.acontents = acontents;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "AnsQnaDTO [title=" + title + ", Qcontents=" + qcontents + ", Acontents=" + acontents + "]";
	}

	
	
	
	
}
