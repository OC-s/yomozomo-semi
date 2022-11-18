package dto;

public class AnsQnaDTO {
	private String title;
	private String contents;
	
	public AnsQnaDTO() {}
	
	public AnsQnaDTO(String title, String contents) {
		this.title = title;
		this.contents = contents;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "AnsQnaDTO [title=" + title + ", contents=" + contents + "]";
	}
	
	
	
}
