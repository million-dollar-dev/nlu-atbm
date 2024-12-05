package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import entity.Cart;
import entity.CartItem;
import entity.Category;
import entity.Image;
import entity.OrderRow;
import entity.Product;
import entity.User;

public class OrderDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public void addOrderDetail(int orderId, int productId, int quantity, int price) {
		String query = "INSERT INTO OrderDetails(OrderID, ProductID, Quantity, Price) VALUES" + "(?, ?, ?, ?)";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, orderId);
			ps.setInt(2, productId);
			ps.setInt(3, quantity);
			ps.setInt(4, price);
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void createOrder(User user, Cart cart) {
		LocalDate curDate = LocalDate.now();
		String orderDate = curDate.toString();
		String query = "INSERT INTO Orders(UserID, OrderDate, TotalAmount, OrderStatus) VALUES" + " (?, ?, ?, N'Chờ xác nhận')";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, user.getUserId());
			ps.setString(2, orderDate);
			ps.setInt(3, cart.getTotalAmount());
			ps.executeUpdate();

			int orderId = getLastOrderId();
			
			for (CartItem c : cart.getItems()) {
				int price = c.getQuantity() * (c.getPrice() / 100 * (100 - c.getProduct().getSale()));
				addOrderDetail(orderId, c.getProduct().getId(), c.getQuantity(), price);
			}

			for (CartItem c : cart.getItems()) {
				updateProductQuantity(c.getProduct().getId(), c.getSize(), -c.getQuantity());
			}

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void updateProductQuantity(int productId, String size, int quantity) {
		String query = "update ProductInventory " + "set Quantity = quantity  + ? where ProductID = ? and Size = '"
				+ size + "'";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, quantity);
			ps.setInt(2, productId);
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public int getLastOrderId() {
		int res = 0;
		String query = "select top 1 * from Orders order by OrderID desc";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next())
				res = rs.getInt("OrderID");

		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}
	
	public void setOrderStatus(int id, String status) {
		String query = "update orders set orderstatus = N'" + status + "' where orderid=" + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public List<OrderRow> getListAllOrder() {
		List<OrderRow> list = new ArrayList<>();
		String query = "select CONVERT(VARCHAR, Orders.OrderDate, 103) AS FormattedDate,"
				+ " * from Orders inner join Users on Users.UserID = Orders.UserID "
				+ "order by Orders.OrderID desc";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User(rs.getString("Username"),
						rs.getString("Email"), 
						rs.getString("PhoneNumber"), 
						rs.getString("Address"));
				OrderRow aOrderRow = new OrderRow(rs.getString("OrderID"),
						user,
						rs.getString("FormattedDate"),
						rs.getInt("TotalAmount"), 
						rs.getString("OrderStatus"));
				
				list.add(aOrderRow);
			}
		} catch (Exception e) {
			System.out.println(e);
		}		
		return list;
	}
	
	public List<OrderRow> getListAllOrderByUserId(int id) {
		List<OrderRow> list = new ArrayList<>();
		String query = "select CONVERT(VARCHAR, Orders.OrderDate, 103) AS FormattedDate,"
				+ " * from Orders where userid=" + id
				+ " order by Orders.OrderID desc";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserDAO userDao = new UserDAO();
				User user = userDao.getUserById(id + "");
				OrderRow aOrderRow = new OrderRow(rs.getString("OrderID"),
						user,
						rs.getString("FormattedDate"),
						rs.getInt("TotalAmount"), 
						rs.getString("OrderStatus"));
				
				list.add(aOrderRow);
			}
		} catch (Exception e) {
			System.out.println(e);
		}		
		return list;
	}

	public static void main(String[] args) {
		OrderDAO dao = new OrderDAO();
//		dao.addOrderDetail(2, 13, 1, 1000000);
//		System.out.println(dao.getLastOrderId());

		List<OrderRow> list = dao.getListAllOrderByUserId(6);
		for (OrderRow i: list) {
			System.out.println(i.toString());
		}
	}
}
