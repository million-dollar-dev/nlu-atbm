package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import entity.Category;

public class CategoryDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public List<Category> getAllCategory() {
		List<Category> list = new ArrayList<>();
		String query = "select * from categories";
		try {
			conn = DBContext.getInstance().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Category(rs.getInt("CategoryID"), 
								rs.getString("CategoryName")));
			}
		} catch (Exception e) {
			System.out.println(e);
		}		
		return list;
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
		CategoryDAO dao = new CategoryDAO();
		System.out.println(dao.getCategoryById(2).toString());
	}
}
