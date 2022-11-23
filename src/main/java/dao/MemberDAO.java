package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.MemberVO;

public class MemberDAO {
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
	String user = "admin";
	String password = "yomozomo";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	public MemberDAO() {
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
	
	public boolean isExists(String id) {

		// id와 pw를 가지고 있는 사람의 데이터를 vo로 리턴
		sb.setLength(0);
		sb.append("SELECT * FROM MEMBER ");
		sb.append("WHERE ID=? ");
		// boolean 변수를 만들어주기
		boolean isOk = false;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			// 바인드 변수 채워주는 과정 거쳐야 함
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			// 데이터가 있다면 isOk에 true를 넣어주기
			isOk = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isOk; // false라면 존재하지 않는 회원
		// true라면 존재하는 회원
	}
	
	public void insertOne(MemberVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO MEMBER (ID, PASSWORD, EMAIL, NICKNAME, PHONE, NAME, ZIPCODE, ADDRESS, ADDRESSDETAIL) ");
		sb.append("VALUES (?,?,?,?,?,?,?,?,?) ");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getNickname());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getName());
			pstmt.setString(7, vo.getZipcode());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getAddrsDetail());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	public MemberVO selectOne(int mnum) {
		sb.setLength(0);
		sb.append("SELECT * FROM MEMBER ");
		sb.append("WHERE M_NUM=? ");
		MemberVO vo=null;
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, mnum);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String id=rs.getString("ID");
				String password=rs.getString("PASSWORD");
				String email=rs.getString("EMAIL");
				String nickname=rs.getString("NICKNAME");
				String regdate=rs.getString("PHONE");
				String name=rs.getString("NAME");
				String zipcode=rs.getString("ZIPCODE");
				String address=rs.getString("ADDRESS");
				String addrsDetail=rs.getString("ADDRESSDETAIL");
				vo=new MemberVO(mnum, id, password, email, nickname, regdate, regdate, name, zipcode, address, addrsDetail);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	//비밀번호 확인
	public boolean isExistsPw(String pw) {

		// id와 pw를 가지고 있는 사람의 데이터를 vo로 리턴
		sb.setLength(0);
		sb.append("SELECT * FROM MEMBER ");
		sb.append("WHERE PASSWORD=? ");
		// boolean 변수를 만들어주기
		boolean isOk = false;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			// 바인드 변수 채워주는 과정 거쳐야 함
			pstmt.setString(1, pw);

			rs = pstmt.executeQuery();
			// 데이터가 있다면 isOk에 true를 넣어주기
			isOk = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isOk; // false라면 존재하지 않는 회원
		// true라면 존재하는 회원
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
