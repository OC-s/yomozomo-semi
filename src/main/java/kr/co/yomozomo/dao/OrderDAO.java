package kr.co.yomozomo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.yomozomo.vo.BoardVO;
import kr.co.yomozomo.vo.OrderVO;
import kr.co.yomozomo.vo.ProductVO;

public class OrderDAO {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
	String user = "admin";
	String password = "yomozomo";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	
	public OrderDAO() {
		try {
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url, user, password);
			System.out.println(conn+ ": 연결성공" );
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	/*
	 		SELECT * FROM UserOrder uo
			RIGHT OUTER JOIN MEMBER m on (m.M_NUM = uo.M_num)
			
		 ALTER TABLE UserOrder ADD COLUMN O_EMAIL VARCHAR(20) NOT NULL; 
		 ALTER TABLE UserOrder ADD COLUMN O_ADDNAME VARCHAR(20) NOT NULL; 
		 ALTER TABLE UserOrder ADD COLUMN O_ADDNAME2 VARCHAR(20) NOT NULL; 
		 ALTER TABLE UserOrder ADD COLUMN O_ADDTEL VARCHAR(20) NOT NULL; 
		 
		 INSERT INTO UserOrder (M_NUM, O_DATE, O_ZIPCODE, O_ADDRESS, O_ADDRESSDETAIL, O_NAME, O_PHONE, O_STATUS, O_TOTAL, O_EMAIL, O_ADDNAME , O_ADDNAME2 , O_ADDTEL) VALUES
		 (2,DEFAULT,'2','2','2','2','2',DEFAULT,13000,'ddddddd','ddd','ddd','ddd');
	*/
	
	
	// ---------------주문정보db추가
	public void insertOne(OrderVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO UserOrder ");
		sb.append("(M_NUM, O_DATE, O_ZIPCODE, O_ADDRESS, O_ADDRESSDETAIL, O_NAME, O_PHONE, O_STATUS, O_TOTAL, O_EMAIL, O_ADDNAME , O_ADDNAME2 , O_ADDTEL) ");
		sb.append("VALUES (?,DEFAULT,?,?,?,?,?,DEFAULT,?,?,?,?,? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, vo.getM_num());
			pstmt.setString(2, vo.getO_ZIPCODE());
			pstmt.setString(3, vo.getO_ADDRESS());
			pstmt.setString(4, vo.getO_ADDRESSDETAIL());
			pstmt.setString(5, vo.getO_NAME());
			pstmt.setString(6, vo.getO_PHONE());
			pstmt.setInt(7, vo.getO_TOTAL());
			pstmt.setString(8, vo.getO_EMAIL());
			pstmt.setString(9, vo.getO_ADDNAME());
			pstmt.setString(10, vo.getO_ADDNAME2());
			pstmt.setString(11, vo.getO_ADDTEL());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	// ---------------상품 전체조회
	public ArrayList<ProductVO> selectAll(){
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		
		sb.setLength(0);
		sb.append("SELECT * FROM PRODUCT ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int P_NUM = rs.getInt("P_NUM");
				String P_NAME = rs.getString("P_NAME");
				int P_PRICE = rs.getInt("P_PRICE");
				int P_DISCOUNT = rs.getInt("P_DISCOUNT");
				String P_CATEGORY = rs.getString("P_CATEGORY");
				String P_THUMBNAIL = rs.getString("P_THUMBNAIL");
				String P_IMAGE = rs.getString("P_IMAGE");
				
				ProductVO vo = new ProductVO(P_NUM,P_NAME, P_PRICE,P_DISCOUNT, P_CATEGORY,P_THUMBNAIL, P_IMAGE);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/* SELECT * FROM PRODUCT ORDER BY HIT DESC LIMIT 4 */
	// ---------------상품 조회수 상위 4개
	public ArrayList<ProductVO> selectHit(){
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		
		sb.setLength(0);
		sb.append("SELECT * FROM PRODUCT ORDER BY HIT DESC LIMIT 4 ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int P_NUM = rs.getInt("P_NUM");
				String P_NAME = rs.getString("P_NAME");
				int P_PRICE = rs.getInt("P_PRICE");
				int P_DISCOUNT = rs.getInt("P_DISCOUNT");
				String P_CATEGORY = rs.getString("P_CATEGORY");
				String P_THUMBNAIL = rs.getString("P_THUMBNAIL");
				String P_IMAGE = rs.getString("P_IMAGE");
				
				ProductVO vo = new ProductVO(P_NUM,P_NAME, P_PRICE,P_DISCOUNT, P_CATEGORY,P_THUMBNAIL, P_IMAGE);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// SELECT * FROM BOARD ORDER BY B_HIT DESC LIMIT 4
	// ---------------게시판 사진 조회수 상위 4개
	public ArrayList<BoardVO> selectPic(){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		sb.setLength(0);
		sb.append("SELECT * FROM BOARD ORDER BY B_HIT DESC LIMIT 4 ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String B_CONTENTS = rs.getString("B_CONTENTS");
				int B_HIT = rs.getInt("B_HIT");
				String B_IMAGE = rs.getString("B_IMAGE");
				int B_NUM = rs.getInt("B_NUM");
				String B_REGDATE = rs.getString("B_REGDATE");
				String B_TITLE = rs.getString("B_TITLE");
				int M_NUM = rs.getInt("M_NUM");
				
				BoardVO vo = new BoardVO(B_CONTENTS,B_HIT, B_IMAGE,B_NUM, B_REGDATE,B_TITLE, M_NUM);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
    // SELECT * FROM PRODUCT WHERE P_CATEGORY = '장난감' ORDER BY HIT DESC LIMIT 4
	// ---------------상품 카테고리 조회수 상위 4개
	public ArrayList<ProductVO> selectPc(){
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		
		sb.setLength(0);
		sb.append("SELECT * FROM PRODUCT WHERE P_CATEGORY = '장난감' ORDER BY HIT DESC LIMIT 4 ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int P_NUM = rs.getInt("P_NUM");
				String P_NAME = rs.getString("P_NAME");
				int P_PRICE = rs.getInt("P_PRICE");
				int P_DISCOUNT = rs.getInt("P_DISCOUNT");
				String P_CATEGORY = rs.getString("P_CATEGORY");
				String P_THUMBNAIL = rs.getString("P_THUMBNAIL");
				String P_IMAGE = rs.getString("P_IMAGE");
				
				ProductVO vo = new ProductVO(P_NUM,P_NAME, P_PRICE,P_DISCOUNT, P_CATEGORY,P_THUMBNAIL, P_IMAGE);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	/* SELECT * FROM PRODUCT ORDER BY P_DISCOUNT DESC LIMIT 4 */
	// ---------------상품 할인높은순 4개
	public ArrayList<ProductVO> selectDis(){
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		
		sb.setLength(0);
		sb.append("SELECT * FROM PRODUCT ORDER BY P_DISCOUNT DESC LIMIT 4 ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int P_NUM = rs.getInt("P_NUM");
				String P_NAME = rs.getString("P_NAME");
				int P_PRICE = rs.getInt("P_PRICE");
				int P_DISCOUNT = rs.getInt("P_DISCOUNT");
				String P_CATEGORY = rs.getString("P_CATEGORY");
				String P_THUMBNAIL = rs.getString("P_THUMBNAIL");
				String P_IMAGE = rs.getString("P_IMAGE");
				
				ProductVO vo = new ProductVO(P_NUM,P_NAME, P_PRICE,P_DISCOUNT, P_CATEGORY,P_THUMBNAIL, P_IMAGE);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	// ---------------상품명조회
	public ArrayList<ProductVO> select(String str){
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		
		sb.setLength(0);
		sb.append("SELECT * FROM PRODUCT WHERE P_NAME LIKE ? ");
		
		ProductVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, "%" + str + "%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int P_NUM = rs.getInt("P_NUM");
				String P_NAME = rs.getString("P_NAME");
				int P_PRICE = rs.getInt("P_PRICE");
				int P_DISCOUNT = rs.getInt("P_DISCOUNT");
				String P_CATEGORY = rs.getString("P_CATEGORY");
				String P_THUMBNAIL = rs.getString("P_THUMBNAIL");
				String P_IMAGE = rs.getString("P_IMAGE");
				
				vo = new ProductVO(P_NUM, P_NAME, P_PRICE,P_DISCOUNT, P_CATEGORY,P_THUMBNAIL, P_IMAGE);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// ---------------상품 한건조회
	public ProductVO selectOne(int P_NUM) {
		sb.length();
		sb.append("SELECT * FROM PRODUCT WHERE P_NUM = ? ");
		
		ProductVO vo =null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, P_NUM);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String P_NAME = rs.getString("P_NAME");
				int P_PRICE = rs.getInt("P_PRICE");
				int P_DISCOUNT = rs.getInt("P_DISCOUNT");
				String P_CATEGORY = rs.getString("P_CATEGORY");
				String P_THUMBNAIL = rs.getString("P_THUMBNAIL");
				String P_IMAGE = rs.getString("P_IMAGE");
				
				vo = new ProductVO(P_NUM, P_NAME, P_PRICE, P_DISCOUNT, P_CATEGORY, P_THUMBNAIL, P_IMAGE);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
		
	

}
