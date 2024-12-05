package entity;

import java.util.List;

public class Product {
	private int id;
	private String name;
	private int price;
	private int sale;
	private String description;
	private Category category;
	private List<Image> images;
	private String status;
	
	public Product(int id, String name, int price) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
	}
	public Product(String name, int price) {
		super();
		this.name = name;
		this.price = price;
	}
	public Product(String name, int price, int sale, String description) {
		super();
		this.name = name;
		this.price = price;
		this.sale = sale;
		this.description = description;
	}
	public Product(int id, String name, int price, int sale, String description) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.sale = sale;
		this.description = description;
	}
	public Product(int id, String name, int price, int sale, String description, Category category,
			List<Image> images) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.sale = sale;
		this.description = description;
		this.category = category;
		this.images = images;
	}
	
	public Product(int id, String name, int price, int sale, String description, String status) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.sale = sale;
		this.description = description;
		this.status = status;
	}
	public Product(int id, String name, int price, int sale, String description, Category category, String status) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.sale = sale;
		this.description = description;
		this.category = category;
		this.status = status;
	}
	public Product(int id, String name, int price, int sale, String description, Category category, List<Image> images,
			String status) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.sale = sale;
		this.description = description;
		this.category = category;
		this.images = images;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public List<Image> getImages() {
		return images;
	}
	public void setImages(List<Image> images) {
		this.images = images;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", sale=" + sale + ", description="
				+ description + ", category=" + category + ", images=" + images + "]";
	}
	
	
	@Override
	public boolean equals(Object obj) {
		if (obj == null || !(obj instanceof Product))
			return false;
		Product that = (Product) obj;
		return this.id == that.id
				&& this.name.equals(that.name)
				&& this.price == that.price
				&& this.sale == that.sale
				&& this.description.equals(that.description)
				&& this.category.equals(that.category);
	}
	
	
}
