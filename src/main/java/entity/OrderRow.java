package entity;

public class OrderRow {
	private String id;
	private User user;
	private String orderDate;
	private int totalAmount;
	private String orderStatus;
	public OrderRow(String id, User user, String orderDate, int totalAmount) {
		super();
		this.id = id;
		this.user = user;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
	}
	
	public OrderRow(String id, User user, String orderDate, int totalAmount, String orderStatus) {
		super();
		this.id = id;
		this.user = user;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.orderStatus = orderStatus;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
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
	
	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	@Override
	public String toString() {
		return "OrderRow [id=" + id + ", user=" + user + ", orderDate=" + orderDate + ", totalAmount=" + totalAmount
				+ ", orderStatus=" + orderStatus + "]";
	}

	
	
}
