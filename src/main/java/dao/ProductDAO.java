package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	//추가
		public void insertOne(ProductVO vo) {
			sb.setLength(0);
			sb.append("INSERT INTO PRODUCT (P_NAME, P_PRICE, P_DISCOUNT, P_STOCK, P_CATEGORY, P_THUMBNAIL, P_IMAGE) ");
			sb.append("VALUES (?,?,?,?,?,?,?) ");
			
			try {
				pstmt=conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getPname());
				pstmt.setInt(2, vo.getPprice());
				pstmt.setInt(3, vo.getPdiscount());
				pstmt.setInt(4, vo.getPstock());
				pstmt.setString(5, vo.getPcategory());
				pstmt.setString(6, vo.getPthumbnail());
				pstmt.setString(7, vo.getPimage());

				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		public int getTotal() {
			sb.setLength(0);
			sb.append("SELECT count(*) cnt FROM PRODUCT");
			int count = 1;
			try {
				pstmt = conn.prepareStatement(sb.toString());
				rs = pstmt.executeQuery();
				rs.next();
				count = rs.getInt("cnt");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return count;		
		}
		
		//상품번호가 큰순으로 출력
				public ArrayList<ProductVO> selectAll(int startNo, int endNo){
					ArrayList<ProductVO> list = new ArrayList<ProductVO>();		
					sb.setLength(0);
									
					sb.append("SELECT * ");
					sb.append("FROM PRODUCT ");			
					sb.append("ORDER BY P_NUM desc ");
					sb.append("LIMIT ?, ? ");
						
					try {
						pstmt = conn.prepareStatement(sb.toString());
						pstmt.setInt(1, startNo-1);
						pstmt.setInt(2, endNo);
						rs = pstmt.executeQuery();
						while(rs.next()) {
							int pnum = rs.getInt("P_NUM");
							String pname=rs.getString("P_NAME");
							int pprice=rs.getInt("P_PRICE");
							int pdiscount=rs.getInt("P_DISCOUNT");
							int pstock=rs.getInt("P_STOCK");
							String pcategory=rs.getString("P_CATEGORY");
							String pthumbnail=rs.getString("P_THUMBNAIL");
							String pimage=rs.getString("P_IMAGE");
							
							ProductVO vo = new ProductVO(pnum, pname, pprice, pdiscount, pstock, pcategory, pthumbnail, pimage);
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
