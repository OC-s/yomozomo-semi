package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.ProductVO;

public class ProductDAO {
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
	String user = "admin";
	String password = "yomozomo";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	public ProductDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ProductVO selectOne(int pnum) {
		sb.setLength(0);
		sb.append("SELECT * FROM PRODUCT ");
		sb.append("WHERE P_NUM=? ");
		ProductVO vo=null;
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pnum);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String pname=rs.getString("P_NAME");
				int pprice=rs.getInt("P_PRICE");
				int pdiscount=rs.getInt("P_DISCOUNT");
				int pstock=rs.getInt("P_STOCK");
				String pcategory=rs.getString("P_CATEGORY");
				String pthumbnail=rs.getString("P_THUMBNAIL");
				String pimage=rs.getString("P_IMAGE");
				
				vo=new ProductVO(pnum, pname, pprice, pdiscount, pstock, pcategory, pthumbnail, pimage);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
