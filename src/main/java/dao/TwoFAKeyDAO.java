package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import context.DBContext;
import entity.Category;
import entity.UserKey;

public class TwoFAKeyDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public boolean isGenKey(String id) {
		String query = "select * from User2FAKeys where user_Id = " + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public boolean isActive(String id) {
		String query = "select * from User2FAKeys where user_Id = " + id + " and isActive = 'active'";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public String getSecretKey(String id) {
		String query = "SELECT secret_key FROM User2FAKeys WHERE user_id = " + id;
		try  {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next())
				return rs.getString("secret_key");

		} catch (Exception e) {
			System.out.println("Error while fetching secret_key: " + e.getMessage());
		}
		return null;
	}

	public boolean createKey(String userId, String secretKey) {
		String query = "INSERT INTO User2FAKeys (user_id, secret_key, created_at, isActive) VALUES (?, ?, ?, ?)";
		try (Connection conn = DBContext.getInstance().getConnection();
				PreparedStatement ps = conn.prepareStatement(query)) {
			String currentTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
			ps.setString(1, userId);
			ps.setString(2, secretKey);
			ps.setString(3, currentTime);
			ps.setString(4, "InActive");
			int rowsInserted = ps.executeUpdate();
			return rowsInserted > 0; 

		} catch (Exception e) {
			System.out.println("Error while inserting into User2FAKeys: " + e.getMessage());
		}
		return false;
	}

	public static void main(String[] args) {
		TwoFAKeyDAO dao = new TwoFAKeyDAO();
		System.out.println(dao.isActive("1"));
		System.out.println(dao.getSecretKey("1000"));
	}
}
