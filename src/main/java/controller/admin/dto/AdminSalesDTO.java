package controller.admin.dto;

public class AdminSalesDTO {
	private int mnum;
	private String id;
	private String name;
	private int total;
	
	
	public AdminSalesDTO() {}
	public AdminSalesDTO(int mnum, String id, String name, int total) {
		this.mnum = mnum;
		this.id = id;
		this.name = name;
		this.total = total;
	}


	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "AdminSalesDTO [mnum=" + mnum + ", id=" + id + ", name=" + name + ", total=" + total + "]";
	}
	
}
