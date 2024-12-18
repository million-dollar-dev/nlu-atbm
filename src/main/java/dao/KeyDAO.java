package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import context.DBContext;
import entity.Category;
import entity.UserKey;

public class KeyDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public UserKey getKeyActiveByUserId(int id) {
		String query = "select * from userPublicKeys where UserId = " + id + " and isActive = 'Active'";
		Timestamp timestamp = null;
		Date createdAt = null, expiresAt = null;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				timestamp = rs.getTimestamp("CreatedAt");
				if (timestamp != null) {
					createdAt = new Date(timestamp.getTime());
				}
				timestamp = rs.getTimestamp("ExpiresAt");
				if (timestamp != null) {
					expiresAt = new Date(timestamp.getTime());
				}
				boolean isActive = rs.getString("IsActive").equalsIgnoreCase("Active") ? true : false;
				return new UserKey(Integer.toString(id), rs.getString("PublicKey"), rs.getString("KeyType"),
						rs.getInt("KeySize"), createdAt, expiresAt, isActive);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public UserKey getKeyActiveByKeyId(int id) {
		String query = "select * from userPublicKeys where KeyId = " + id + " and isActive = 'Active'";
		Timestamp timestamp = null;
		Date createdAt = null, expiresAt = null;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				timestamp = rs.getTimestamp("CreatedAt");
				if (timestamp != null) {
					createdAt = new Date(timestamp.getTime());
				}
				timestamp = rs.getTimestamp("ExpiresAt");
				if (timestamp != null) {
					expiresAt = new Date(timestamp.getTime());
				}
				boolean isActive = rs.getString("IsActive").equalsIgnoreCase("Active") ? true : false;
				return new UserKey(Integer.toString(id), rs.getString("PublicKey"), rs.getString("KeyType"),
						rs.getInt("KeySize"), createdAt, expiresAt, isActive);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public int createKey(String userId, String publicKey, String keyType, int keySize, long expireTime) {
		String query = "insert into UserPublicKeys(UserId, PublicKey, KeyType, KeySize, CreatedAt, ExpiresAt, IsActive)"
				+ " values (?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, userId);
			ps.setString(2, publicKey);
			ps.setString(3, keyType);
			ps.setInt(4, keySize);
			LocalDateTime now = LocalDateTime.now();
			Timestamp timestampCreate = Timestamp.valueOf(now);
			ps.setTimestamp(5, timestampCreate);
			LocalDateTime expireDate = now.plusDays(expireTime);
			Timestamp timestampExpire = Timestamp.valueOf(expireDate);
			ps.setTimestamp(6, timestampExpire);
			ps.setString(7, "Active");
			int affectedRows = ps.executeUpdate();
			if (affectedRows == 0) {
				throw new SQLException("Creating user failed, no rows affected.");
			}
			try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
				if (generatedKeys.next()) {
					int id = generatedKeys.getInt(1);
					// Trả về đối tượng User vừa tạo
					return id;
				} else {
					throw new SQLException("Creating user failed, no ID obtained.");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public int createKey(String userId, String publicKey, String keyType, int keySize) {
		String query = "insert into UserPublicKeys(UserId, PublicKey, KeyType, KeySize, CreatedAt, ExpiresAt, IsActive)"
				+ " values (?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, userId);
			ps.setString(2, publicKey);
			ps.setString(3, keyType);
			ps.setInt(4, keySize);
			LocalDateTime now = LocalDateTime.now();
			Timestamp timestampCreate = Timestamp.valueOf(now);
			ps.setTimestamp(5, timestampCreate);
			Timestamp expireDate = Timestamp.valueOf(LocalDateTime.of(9999, 12, 31, 23, 59, 59));
			ps.setTimestamp(6, expireDate);
			ps.setString(7, "Active");
			int affectedRows = ps.executeUpdate();
			if (affectedRows == 0) {
				throw new SQLException("Creating user failed, no rows affected.");
			}
			try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
				if (generatedKeys.next()) {
					int id = generatedKeys.getInt(1);
					// Trả về đối tượng User vừa tạo
					return id;
				} else {
					throw new SQLException("Creating user failed, no ID obtained.");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public void deactivateKeys(String userId) {
		String query = "UPDATE UserPublicKeys SET IsActive = ? WHERE UserId = " + userId;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, "InActive");
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static void main(String[] args) {
		KeyDAO dao = new KeyDAO();
		dao.createKey("2", "123", "DSA", 1024, 5);
	}
}
