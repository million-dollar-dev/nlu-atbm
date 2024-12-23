package entity;

public class InventoryRow {
	private Product product;
	private int quantity;
	public InventoryRow(Product product, int quantity) {
		super();
		this.product = product;
		this.quantity = quantity;
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
	@Override
	public String toString() {
		return "InventoryRow [product=" + product + ", quantity=" + quantity + "]";
	}
	
}
