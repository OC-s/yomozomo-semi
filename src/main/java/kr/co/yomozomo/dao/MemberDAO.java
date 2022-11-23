package kr.co.yomozomo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.AnsQnaDTO;
import kr.co.yomozomo.vo.MemberVO;

//dao
public class MemberDAO {
	// 1.변수설정
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
	String user = "admin";
	String password = "yomozomo";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	public MemberDAO() {
		try {
			// 2.드라이버 로딩
			Class.forName(driver);
			// 3/connection 객체 생성
			conn = DriverManager.getConnection(url, user, password);
			System.out.println(conn);

		} catch (ClassNotFoundException e1) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
	}

	// 로그인
	public MemberVO isExists(String ID, String PASSWORD) {
		// id와 pw를 가지고 있는사람의 데이터를 vo로 리턴
		sb.setLength(0);
		sb.append(
				"SELECT ADDRESS, ADDRESSDETAIL, EMAIL, ID, M_NUM, NAME, NICKNAME, PASSWORD, PHONE, REGDATE, ZIPCODE ");
		sb.append("FROM MEMBER ");
		sb.append("WHERE ID = ? ");
		sb.append("AND PASSWORD  = ? ");

		MemberVO vo = null;
		// 5.문장객체
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, ID);
			pstmt.setString(2, PASSWORD);

			// 6.실행
			rs = pstmt.executeQuery();
			// 7.레코드별 로직 처리
			if (rs.next()) {

				String ADDRESS = rs.getString("ADDRESS");
				String ADDRESSDETAIL = rs.getString("ADDRESSDETAIL");
				String EMAIL = rs.getString("EMAIL");
				int M_NUM = rs.getInt("M_NUM");
				String NAME = rs.getString("NAME");
				String NICKNAME = rs.getString("NICKNAME");
				String PHONE = rs.getString("PHONE");
				String REGDATE = rs.getString("REGDATE");
				String ZIPCODE = rs.getString("ZIPCODE");
				vo = new MemberVO(ADDRESS, ADDRESSDETAIL, EMAIL, ID, M_NUM, NAME, NICKNAME, PASSWORD, PHONE, REGDATE,
						ZIPCODE);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo; // vo null이라면 존재하지 않는 회원
		// vo에 참조값이 있으면 존재하는 회원

	}

	// 추가
	public void insertOne(MemberVO vo) {
		// 4.sql문 작성
		sb.setLength(0);
		sb.append("INSERT INTO MEMBER ");
		sb.append("(ADDRESS, ADDRESSDETAIL, EMAIL, ID, NAME, NICKNAME, PASSWORD, PHONE, ZIPCODE) ");
		sb.append("VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ? )");

		try {
			// 5.문장객체 생성
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getADDRESS());
			pstmt.setString(2, vo.getADDRESSDETAIL());
			pstmt.setString(3, vo.getEMAIL());
			pstmt.setString(4, vo.getID());
			pstmt.setString(5, vo.getNAME());
			pstmt.setString(6, vo.getNICKNAME());
			pstmt.setString(7, vo.getPASSWORD());
			pstmt.setString(8, vo.getPHONE());
			pstmt.setString(9, vo.getZIPCODE());
			// 6.실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// 1건조회
	public MemberVO selectOne(int M_NUM) {
		// 4.sql문
		sb.setLength(0);
		sb.append("SELECT * FROM MEMBER WHERE M_NUM = ?");
		MemberVO vo = null;

		try {
			// 5.문장객체 생성
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, M_NUM);
			// 6.실행
			rs = pstmt.executeQuery();
			// 7.레코드별 로직 처리
			while (rs.next()) {
				String ADDRESS = rs.getString("ADDRESS");
				String ADDRESSDETAIL = rs.getString("ADDRESSDETAIL");
				String EMAIL = rs.getString("EMAIL");
				String ID = rs.getString("ID");
				String NAME = rs.getString("NAME");
				String NICKNAME = rs.getString("NICKNAME");
				String PASSWORD = rs.getString("PASSWORD");
				String PHONE = rs.getString("PHONE");
				String REGDATE = rs.getString("REGDATE");
				String ZIPCODE = rs.getString("ZIPCODE");
				vo = new MemberVO(ADDRESS, ADDRESSDETAIL, EMAIL, ID, M_NUM, NAME, NICKNAME, PASSWORD, PHONE, REGDATE,
						ZIPCODE);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	// 회원찾기
		public MemberVO searchOne(String NAME, String PHONE ) {
			// 4.sql문
			sb.setLength(0);
			sb.append("SELECT * FROM MEMBER WHERE NAME = ? ");
			sb.append("AND PHONE = ? ");
			MemberVO vo = null;

			try {
				// 5.문장객체 생성
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, NAME);
				pstmt.setString(2, PHONE);
				// 6.실행
				rs = pstmt.executeQuery();
				// 7.레코드별 로직 처리
				while (rs.next()) {
					String ADDRESS = rs.getString("ADDRESS");
					String ADDRESSDETAIL = rs.getString("ADDRESSDETAIL");
					String EMAIL = rs.getString("EMAIL");
					int M_NUM = rs.getInt("M_NUM");
					String ID = rs.getString("ID");
					String NICKNAME = rs.getString("NICKNAME");
					String PASSWORD = rs.getString("PASSWORD");
					String REGDATE = rs.getString("REGDATE");
					String ZIPCODE = rs.getString("ZIPCODE");
					vo = new MemberVO(ADDRESS, ADDRESSDETAIL, EMAIL, ID, M_NUM, NAME, NICKNAME, PASSWORD, PHONE, REGDATE,
							ZIPCODE);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return vo;
		}

	public int userNum(String id) {
		int num =0;
		try {
			String sql =  "SELECT M_NUM FROM MEMBER WHERE ID=?";
			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();

			if (rs.next()) {
				num = rs.getInt("M_NUM");

			}
			rs.close();
			st.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	public String getUserId(String email) {
		String id ="";
		try {
			String sql =  "SELECT ID FROM MEMBER WHERE EMAIL = ?";
			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();

			if (rs.next()) {
				id= rs.getString("ID");
			}
			rs.close();
			st.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	public int checkAdmin(String id,String pw) {
		int result = 0;
		try {
			String sql =  "SELECT ADMIN FROM MEMBER WHERE ID=? AND PASSWORD =?";
			Connection con = DriverManager.getConnection(url, user, password);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			st.setString(2, pw);
			ResultSet rs = st.executeQuery();

			if (rs.next()) {
				result = rs.getInt("ADMIN");

			}
			rs.close();
			st.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	// 삭제
	public void deleteOne(int mnum) {
		sb.setLength(0);
		sb.append("DELETE FROM MEMBER ");
		sb.append("WHERE M_NUM = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, mnum);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// 수정
	public void updateOne(MemberVO vo) {
		// 4.sql문 작성
		sb.setLength(0);
		sb.append("UPDATE MEMBER ");
		sb.append("SET NAME = ?, NICKNAME = ?, ID = ?, PASSWORD = ?, EMAIL = ?, PHONE = ?, ZIPCODE = ? ,ADDRESS = ? , ADDRESSDETAIL = ? ");
		sb.append("WHERE M_NUM = ? ");

		try {
			// 5.문장객체 생성
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getNAME());
			pstmt.setString(2, vo.getNICKNAME());
			pstmt.setString(3, vo.getID());
			pstmt.setString(4, vo.getPASSWORD());
			pstmt.setString(5, vo.getEMAIL());
			pstmt.setString(6, vo.getPHONE());
			pstmt.setString(7, vo.getZIPCODE());
			pstmt.setString(8, vo.getADDRESS());
			pstmt.setString(9, vo.getADDRESSDETAIL());
			pstmt.setInt(10, vo.getM_NUM());
			
			// 6.실행
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// 자원반납
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}