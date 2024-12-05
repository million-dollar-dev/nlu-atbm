package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import entity.Image;

public class ImageDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public List<Image> getAllImageByProductId(int id) {
		List<Image> list = new ArrayList<>();
		String query = "select * from ProductImages where ProductID = ?";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Image(rs.getInt("ImageID"), rs.getInt("ProductID"), rs.getString("ImagePath")));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public void deleteImageByProductId(String id) {
		String query = "delete from ProductImages where ProductID = " + id;
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
		
	public void insertImageForProductId(String id, String path) {
		String query = "insert into ProductImages(ProductID, ImagePath) values (" + id + ",'" + path + "')";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
