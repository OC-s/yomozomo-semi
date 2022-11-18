package dto;

public class ProductDTO {
	private int num;
	private String name;
	private int price;
	private int discount;
	private int stock;
	private String category;
	private String thumbnail;
	private String image;
	private int hit;
	public ProductDTO() {}
	
	public ProductDTO(int num, String name, int price, int discount, int stock, String category, String thumbnail,
			String image, int hit) {
		super();
		this.num = num;
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.stock = stock;
		this.category = category;
		this.thumbnail = thumbnail;
		this.image = image;
		this.hit = hit;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "ProductDTO [num=" + num + ", name=" + name + ", price=" + price + ", discount=" + discount + ", stock="
				+ stock + ", category=" + category + ", thumbnail=" + thumbnail + ", image=" + image + ", hit=" + hit
				+ "]";
	}
	
}