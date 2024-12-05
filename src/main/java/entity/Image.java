package entity;

public class Image {
	private int id;
	private int productId;
	private String path;
	public Image(int id, int productId, String path) {
		super();
		this.id = id;
		this.productId = productId;
		this.path = path;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	@Override
	public String toString() {
		return "Image [id=" + id + ", productId=" + productId + ", path=" + path + "]";
	}
	
	
}
