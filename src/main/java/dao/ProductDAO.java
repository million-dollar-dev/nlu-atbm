package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

import context.DBContext;
import entity.Category;
import entity.Image;
import entity.InventoryRow;
import entity.Product;
import entity.Review;
import entity.User;

public class ProductDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public List<Product> getAllProduct() {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products inner join Categories on Products.CategoryID = Categories.CategoryID"
				+ " order by Products.productID asc";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product aProduct = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"),
						rs.getInt("sale"), rs.getString("Description"), rs.getString("Status"));
				aProduct.setCategory(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
				ImageDAO imgDao = new ImageDAO();
				List<Image> imgs = imgDao.getAllImageByProductId(rs.getInt("ProductID"));
				aProduct.setImages(imgs);
				list.add(aProduct);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public List<Product> getTopLastProduct(int number) {
		List<Product> list = new ArrayList<>();
		String query = "select top " + number + " * from products inner join Categories "
				+ "on Products.CategoryID = Categories.CategoryID where status = N'Đang bán' order by ProductID desc";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product aProduct = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"),
						rs.getInt("sale"), rs.getString("Description"), rs.getString("Status"));
				aProduct.setCategory(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
				ImageDAO imgDao = new ImageDAO();
				List<Image> imgs = imgDao.getAllImageByProductId(rs.getInt("ProductID"));
				aProduct.setImages(imgs);
				list.add(aProduct);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public List<Product> getTopProduct(int number) {
		List<Product> list = new ArrayList<>();
		String query = "select top " + number + " * from products inner join Categories "
				+ "on Products.CategoryID = Categories.CategoryID where status = N'Đang bán' order by ProductID asc";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product aProduct = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"),
						rs.getInt("sale"), rs.getString("Description"), rs.getString("Status"));
				aProduct.setCategory(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
				ImageDAO imgDao = new ImageDAO();
				List<Image> imgs = imgDao.getAllImageByProductId(rs.getInt("ProductID"));
				aProduct.setImages(imgs);
				list.add(aProduct);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public List<Product> getAllShoe(int categoryId) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products inner join Categories "
				+ "on Products.CategoryID = Categories.CategoryID where products.CategoryID <= " + categoryId
				+ " order by Products.ProductID desc";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product aProduct = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"),
						rs.getInt("sale"), rs.getString("Description"), rs.getString("Status"));
				aProduct.setCategory(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
				ImageDAO imgDao = new ImageDAO();
				List<Image> imgs = imgDao.getAllImageByProductId(rs.getInt("ProductID"));
				aProduct.setImages(imgs);
				list.add(aProduct);
			}
		} catch (Exception e) {
			System.out.println(e);

		}
		return list;
	}

	public List<Product> getAllShoe(int categoryId, int index) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products inner join Categories "
				+ "on Products.CategoryID = Categories.CategoryID where products.CategoryID <= " + categoryId
				+ " order by Products.ProductID desc" + " offset " + (index - 1) * 8 + " rows fetch next 8 rows only";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product aProduct = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"),
						rs.getInt("sale"), rs.getString("Description"), rs.getString("Status"));
				aProduct.setCategory(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
				ImageDAO imgDao = new ImageDAO();
				List<Image> imgs = imgDao.getAllImageByProductId(rs.getInt("ProductID"));
				aProduct.setImages(imgs);
				list.add(aProduct);
			}
		} catch (Exception e) {
			System.out.println(e);

		}
		return list;
	}

	public List<Product> getOtherProduct(int categoryId) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products inner join Categories "
				+ "on Products.CategoryID = Categories.CategoryID where products.CategoryID >= " + categoryId
				+ " order by Products.ProductID desc";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product aProduct = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"),
						rs.getInt("sale"), rs.getString("Description"), rs.getString("Status"));
				aProduct.setCategory(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
				ImageDAO imgDao = new ImageDAO();
				List<Image> imgs = imgDao.getAllImageByProductId(rs.getInt("ProductID"));
				aProduct.setImages(imgs);
				list.add(aProduct);
			}
		} catch (Exception e) {
			System.out.println(e);

		}
		return list;
	}

	public List<Product> getOtherProduct(int categoryId, int index) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products inner join Categories "
				+ "on Products.CategoryID = Categories.CategoryID where products.CategoryID >= " + categoryId
				+ " order by Products.ProductID desc" + " offset " + (index - 1) * 8 + " rows fetch next 8 rows only";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product aProduct = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"),
						rs.getInt("sale"), rs.getString("Description"), rs.getString("Status"));
				aProduct.setCategory(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
				ImageDAO imgDao = new ImageDAO();
				List<Image> imgs = imgDao.getAllImageByProductId(rs.getInt("ProductID"));
				aProduct.setImages(imgs);
				list.add(aProduct);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public List<Product> getProductByCategoryId(int categoryId) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products inner join Categories "
				+ "on Products.CategoryID = Categories.CategoryID where products.CategoryID = " + categoryId
				+ " order by Products.ProductID desc";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product aProduct = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"),
						rs.getInt("sale"), rs.getString("Description"), rs.getString("Status"));
				aProduct.setCategory(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
				ImageDAO imgDao = new ImageDAO();
				List<Image> imgs = imgDao.getAllImageByProductId(rs.getInt("ProductID"));
				aProduct.setImages(imgs);
				list.add(aProduct);
			}
		} catch (Exception e) {
			System.out.println(e);

		}
		return list;
	}

	public List<Product> getProductByCategoryId(int categoryId, int index) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products inner join Categories "
				+ "on Products.CategoryID = Categories.CategoryID where products.CategoryID = " + categoryId
				+ " order by Products.ProductID desc" + " offset " + (index - 1) * 8 + " rows fetch next 8 rows only";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product aProduct = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"),
						rs.getInt("sale"), rs.getString("Description"), rs.getString("Status"));
				aProduct.setCategory(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
				ImageDAO imgDao = new ImageDAO();
				List<Image> imgs = imgDao.getAllImageByProductId(rs.getInt("ProductID"));
				aProduct.setImages(imgs);
				list.add(aProduct);
			}
		} catch (Exception e) {
			System.out.println(e);

		}
		return list;
	}

	public Product getProductById(int id) {
		String query = "select * from Products inner join Categories on "
				+ "Products.CategoryID = Categories.CategoryID where ProductID = ?";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product aProduct = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"),
						rs.getInt("sale"), rs.getString("Description"), rs.getString("Status"));
				aProduct.setCategory(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
				ImageDAO imgDao = new ImageDAO();
				List<Image> imgs = imgDao.getAllImageByProductId(rs.getInt("ProductID"));
				aProduct.setImages(imgs);
				return aProduct;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public List<Product> searchByName(String name) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products inner join Categories on "
				+ "Products.CategoryID = Categories.CategoryID where ProductName like '%" + name + "%'";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);

			rs = ps.executeQuery();
			while (rs.next()) {
				Product aProduct = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"),
						rs.getInt("sale"), rs.getString("Description"), rs.getString("Status"));
				aProduct.setCategory(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
				ImageDAO imgDao = new ImageDAO();
				List<Image> imgs = imgDao.getAllImageByProductId(rs.getInt("ProductID"));
				aProduct.setImages(imgs);
				list.add(aProduct);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public int countProductByCategoryId(int id) {
		int count = 0;
		String query = "select count(*) from Products where CategoryID = " + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);

			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return count;
	}

	public void deleteProductById(String id) {
		String query = "delete from Products where ProductID = " + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void insertProduct(String name, int categoryID, int price, int sale, String description) {
		String query = "INSERT INTO Products (ProductName, Price, Sale, CategoryID, Description)"
				+ " VALUES(?, ?, ?, ?, ?)";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setInt(2, price);
			ps.setInt(3, sale);
			ps.setInt(4, categoryID);
			ps.setString(5, description);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void updateProduct(String id, String name, int categoryID, String status, int price, int sale,
			String description) {
		String query = "update Products " + "set ProductName = N'" + name + "'" + ", price = " + price + ", sale = "
				+ sale + ", CategoryID = " + categoryID + ", Description = N'" + description + "' ,Status=" + "N'"
				+ status + "' " + "where ProductID = " + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public List<Product> getAllProductDesc() {
		List<Product> list = new ArrayList<>();
		String query = "select * from Products inner join Categories on Products.CategoryID = Categories.CategoryID"
				+ " order by Products.productID desc";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product aProduct = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("Price"),
						rs.getInt("sale"), rs.getString("Description"), rs.getString("Status"));
				aProduct.setCategory(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
				ImageDAO imgDao = new ImageDAO();
				List<Image> imgs = imgDao.getAllImageByProductId(rs.getInt("ProductID"));
				aProduct.setImages(imgs);
				list.add(aProduct);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public List<String> getSizeListById(int id) {
		List<String> list = new ArrayList<String>();
		String query = "select size from ProductInventory where ProductID = " + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getString("size"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public int getQuantityBySizeAndId(String size, int id) {
		String res = "0";
		String query = "select Quantity from ProductInventory where ProductID = " + id + " and size = '" + size + "'";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				res = rs.getString("Quantity");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return Integer.parseInt(res);
	}

	public void hiddenProduct(int id) {
		String query = "update products set status = N'Ngưng bán' where productId=" + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public List<InventoryRow> getInventory() {
		List<InventoryRow> list = new ArrayList<>();
		String query = "select * from Products inner join "
				+ "(select ProductID, SUM(Quantity) as Quantity from ProductInventory group by ProductID) "
				+ "as temp on temp.ProductID = Products.ProductID";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getInt("price"));
				InventoryRow aRow = new InventoryRow(p, rs.getInt("Quantity"));
				list.add(aRow);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public TreeMap<String, Integer> getInventoryById(String id) {
		TreeMap map = new TreeMap<>();
		String query = "select * from ProductInventory where ProductID = " + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				map.put(rs.getString("Size"), rs.getInt("Quantity"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return map;
	}

	public void updateInventory(String id, String size, int quantity) {
		String query = "update ProductInventory set Quantity = " + quantity + " where ProductID = " + id
				+ " and Size = N'" + size + "'";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void createInventory(int id, String size, int quantity) {
		String query = "insert into ProductInventory(ProductId, size, quantity) " + " values(?, ?, ?)";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.setString(2, size);
			ps.setInt(3, quantity);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void deleteInventory(int id) {
		String query = "delete from productInventory where productId = " + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public List<Review> getAllReviewByProductId(String id) {
		List<Review> list = new ArrayList<>();
		String query = "select CONVERT(VARCHAR, ReviewDate, 103) AS FormattedDate, * from Reviews where ProductID = "
				+ id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserDAO dao = new UserDAO();
				User user = dao.getUserById(rs.getInt("UserID") + "");
				list.add(new Review(rs.getInt("ProductID"), user, rs.getInt("Rating"), rs.getString("Comment"),
						rs.getString("FormattedDate")));

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public void createReview(int userId, int productId, int rating, String comment) {
		String query = "INSERT INTO Reviews(ProductID, UserID, ReviewDate, Rating, Comment) " + "VALUES (?, ?, ?, ?, N'"
				+ comment + "')";
		LocalDate curDate = LocalDate.now();
		String reviewDate = curDate.toString();
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, productId);
			ps.setInt(2, userId);
			ps.setString(3, reviewDate);
			ps.setInt(4, rating);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static void main(String[] args) {
		ProductDAO dao = new ProductDAO();
//		List<Product> list = dao.getAllProduct();
//		
//		for(Product p: list) {
//			System.out.println(p.toString());
//		}
//		System.out.println(dao.getProductById(1).toString());
		List<Product> list = dao.getAllProductDesc();
		for (Product p : list) {
			System.out.println(p.toString());
		}
//		System.out.println(dao.getTopLastProduct(1).toString());
//		System.out.println(dao.countProductByCategoryId(2));
//		dao.deleteProductById("20");
//		List<Review> l = dao.getAllReviewByProductId("1");
//		for (Review p : l) {
//			System.out.println(p.toString());
//		}
//		dao.updateProduct("39", "ABC", 2, 10000, 5, "Không có des");
		dao.createInventory(41, "40", 1);
	}
}
