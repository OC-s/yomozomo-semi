package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CartVO;

public class CartDAO {
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
	String user = "admin";
	String password = "yomozomo";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	public CartDAO() {
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
	
	public void insertOne(CartVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO CART ");
		sb.append("(M_NUM, P_NUM, P_NAME, COUNT, PRICE) ");
		sb.append("VALUES (?, ?, ?, ?, ?) ");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, vo.getMnum());
			pstmt.setInt(2, vo.getPnum());
			pstmt.setString(3, vo.getPname());
			pstmt.setInt(4, vo.getCount());
			pstmt.setInt(5, vo.getPrice());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<CartVO> selectAll(){
		ArrayList<CartVO> list=new ArrayList<>();
		
		sb.setLength(0);
		sb.append("SELECT * FROM CART ");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int cartnum=rs.getInt("CART_NUM");
				int mnum=rs.getInt("M_NUM");
				int pnum=rs.getInt("P_NUM");
				String pname=rs.getString("P_NAME");
				int count=rs.getInt("COUNT");
				int price=rs.getInt("PRICE");
				
				CartVO vo=new CartVO(cartnum, mnum, pnum, pname, count, price);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
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
