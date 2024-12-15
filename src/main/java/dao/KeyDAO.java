package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
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

	public UserKey getKeyByUserId(int id) {
		String query = "select * from userPublicKeys where UserId = " + id;
		Timestamp timestamp = null;
		Date createdAt = null, updatedAt = null, expiresAt = null;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				timestamp = rs.getTimestamp("CreatedAt");
				if (timestamp != null) {
					createdAt = new Date(timestamp.getTime());
				}
				timestamp = rs.getTimestamp("UpdatedAt");
				if (timestamp != null) {
					updatedAt = new Date(timestamp.getTime());
				}

				timestamp = rs.getTimestamp("ExpiresAt");
				if (timestamp != null) {
					expiresAt = new Date(timestamp.getTime());
				}
				boolean isActive = rs.getString("IsActive").equalsIgnoreCase("Active") ? true : false;
				return new UserKey(Integer.toString(id), rs.getString("PublicKey"), rs.getString("KeyType"),
						rs.getInt("KeySize"), createdAt, updatedAt, expiresAt, isActive);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public Category getCategoryById(int id) {
		String query = "select * from categories where CategoryID = ?";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Category(rs.getInt(1), rs.getString(2));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public static void main(String[] args) {
		KeyDAO dao = new KeyDAO();
		System.out.println(dao.getCategoryById(2).toString());
	}
}
