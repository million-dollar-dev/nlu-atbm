package entity;

public class CartItem {
	private Product product;
	private int quantity;
	private int price;
	private String size;
	
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public CartItem(Product product, int quantity, int price, String size) {
		super();
		this.product = product;
		this.quantity = quantity;
		this.price = price;
		this.size = size;
	}
	public CartItem(Product product, int quantity, int price) {
		super();
		this.product = product;
		this.quantity = quantity;
		this.price = price;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "CartItem [product=" + product + ", quantity=" + quantity + ", price=" + price + ", size=" + size + "]";
	}
	
	
	@Override
	public boolean equals(Object obj) {
		if (obj == null || !(obj instanceof CartItem))
			return false;
		CartItem that = (CartItem) obj;
		return this.product.equals(that.product) 
				&& this.price == that.price
				&& this.quantity == that.quantity
				&& this.size.equals(that.size);
	}
	
	
	
}
