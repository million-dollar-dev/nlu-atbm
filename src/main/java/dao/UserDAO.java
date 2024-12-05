package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import entity.User;

public class UserDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public boolean checkUserExist(String username) {
		boolean result = false;
		String query = "select count(*) from users where username = '" + username + "'";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				result = count > 0;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	public boolean checkEmailExist(String email) {
		boolean result = false;
		String query = "select count(*) from users where email = '" + email + "'";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				result = count > 0;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	// getUser()
	public User login(String username, String password) {
		String query = "select * from users where username = '" + username + "' and password = '" + password + "'";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new User(rs.getInt("UserId"), rs.getString("Username"), rs.getString("Password"),
						rs.getString("Email"), rs.getString("PhoneNumber"), rs.getString("Address"),
						rs.getString("Role"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public void createUser(String username, String password, String email, String numberPhone, String address,
			String role) {
		String query = "insert into users(username, password, email, phoneNumber, address, role)"
				+ " values (?, ?, ?, ?, ?, ?)";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.setString(4, numberPhone);
			ps.setString(5, address);
			ps.setString(6, role);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public List<User> getAllUser() {
		List<User> list = new ArrayList<User>();
		String query = "select * from users order by userId";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new User(rs.getInt("UserID"), rs.getString("Username"), rs.getString("Email"),
						rs.getString("PhoneNumber"), rs.getString("Address"), rs.getString("Role")));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public void deleteUserById(String id) {
		String query = "delete from users where userID = " + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public User getUserById(String id) {
		String query = "select * from users where userID = " + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new User(rs.getInt("UserID"), rs.getString("Username"), rs.getString("Email"),
						rs.getString("PhoneNumber"), rs.getString("Address"), rs.getString("Role"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public void updateUserById(String id, String username, String email, String numberPhone, String address,
			String role) {
		String query = "update users set " + "Username = '" + username + "'" + ",Email = '" + email + "'"
				+ ",PhoneNumber = '" + numberPhone + "'" + ",Address = '" + address + "'" + ",Role = '" + role + "'"
				+ " where UserID = " + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void updateUserById(String id, String email, String numberPhone, String address) {
		String query = "update users set " + " Email = '" + email + "'" + " ,PhoneNumber = '" + numberPhone + "'"
				+ " ,Address = N'" + address + "'" + " where UserID = " + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public String getPasswordByEmail(String email) {
		String res = "";
		String query = "select Password from users where email = '" + email + "'";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				res = rs.getString("Password");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return res;
	}

	public static void main(String[] args) {
		UserDAO dao = new UserDAO();
//		List<User> list = dao.getAllUser();
//		for (User u: list) {
//			System.out.println(u.toString());
//		}
		User user = dao.login("seller", "seller123");
		System.out.println(user.toString());

//		dao.createUser("tao", "ky", "nguc@gmail", "04314321", "dsfadsfsd", "seller");
	}
}
