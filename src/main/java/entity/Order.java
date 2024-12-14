package entity;

public class Order {
	private int id;
	private int userId;
	private String orderDate;
	private int totalAmount;
	private String status;
	public Order(int id, int userId, String orderDate, int totalAmount) {
		super();
		this.id = id;
		this.userId = userId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
	}
	
	
	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Order(int id, int userId, String orderDate, int totalAmount, String status) {
		super();
		this.id = id;
		this.userId = userId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", userId=" + userId + ", orderDate=" + orderDate + ", totalAmount=" + totalAmount
				+ "]";
	}
	
}
