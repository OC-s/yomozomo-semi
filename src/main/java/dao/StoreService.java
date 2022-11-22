package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ProductDTO;

public class StoreService {
	String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
	String user ="admin";
	String passWord = "yomozomo";

	public List<ProductDTO> getProduct(String cate) {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		ProductDTO p = null;
		try {
			String sql = "SELECT * FROM PRODUCT WHERE P_CATEGORY LIKE ?";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con =DriverManager.getConnection(url,user,passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%"+cate+"%");
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("P_NUM");
				String name = rs.getString("P_NAME");
				int price = rs.getInt("P_PRICE");
				int discount =rs.getInt("P_DISCOUNT");
				int stock = rs.getInt("P_STOCK");
				String category = rs.getString("P_CATEGORY");
				String thumbnail = rs.getString("P_THUMBNAIL");
				String image = rs.getString("P_IMAGE");
				int hit =rs.getInt("HIT");
				p = new ProductDTO(num,name,price,discount,stock,category,thumbnail,image,hit);
				list.add(p);
			}
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public int getCountProduct(String cate) {
		ProductDTO p = null;
		int count=0;
		try {
			String sql = "select count(P_NUM)COUNT from PRODUCT where P_CATEGORY LIKE ?";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con =DriverManager.getConnection(url,user,passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%"+cate+"%");
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public ProductDTO getProductDetail(int id) {
		ProductDTO p= null;
		try {
			String sql = "SELECT * FROM PRODUCT WHERE P_NUM =?";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con =DriverManager.getConnection(url,user,passWord);
			PreparedStatement st = con.prepareStatement(sql);

			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				int num = rs.getInt("P_NUM");
				String name = rs.getString("P_NAME");
				int price = rs.getInt("P_PRICE");
				int discount =rs.getInt("P_DISCOUNT");
				int stock = rs.getInt("P_STOCK");
				String category = rs.getString("P_CATEGORY");
				String thumbnail = rs.getString("P_THUMBNAIL");
				String image = rs.getString("P_IMAGE");
				int hit =rs.getInt("HIT");
				p = new ProductDTO(num,name,price,discount,stock,category,thumbnail,image,hit);
			}
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return p;
		
	}
	public int updateProductHit(int id) {
		int result =0;
		try {
			String sql = "UPDATE PRODUCT "
					+ " SET HIT = HIT+1 "
					+ " WHERE P_NUM=? ";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con =DriverManager.getConnection(url,user,passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			result = st.executeUpdate();
			st.close();
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int getCountReview(int id) {
		int count=0;
		try {
			String sql = "SELECT count(*) c FROM REVIEW WHERE P_NUM= ?";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con =DriverManager.getConnection(url,user,passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				count = rs.getInt("c");
			}
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}
