package kr.co.yomozomo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.yomozomo.vo.BoardVO;
import kr.co.yomozomo.vo.CmtjoinVO;
import kr.co.yomozomo.vo.CommentsVO;

public class CommentsDAO {

	// 1.변수설정
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
	String user = "admin";
	String password = "yomozomo";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	public CommentsDAO() {
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

	// 전체조회
	public ArrayList<CommentsVO> selectAll() {
		ArrayList<CommentsVO> list = new ArrayList<CommentsVO>();

		sb.setLength(0);
		sb.append("SELECT * FROM COMMENTS ORDER BY C_NUM DESC");
		CommentsVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int B_NUM = rs.getInt("B_NUM");
				String C_CONTENTS = rs.getString("C_CONTENTS");
				int C_NUM = rs.getInt("C_NUM");
				String C_REGDATE = rs.getString("C_REGDATE");
				String C_SECRET = rs.getString("C_SECRET");
				int M_NUM = rs.getInt("M_NUM");
				vo = new CommentsVO(B_NUM, C_CONTENTS, C_NUM, C_REGDATE, C_SECRET, M_NUM );
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 전체조회(join)
		public ArrayList<CmtjoinVO> joinAll() {
			ArrayList<CmtjoinVO> list = new ArrayList<CmtjoinVO>();

			sb.setLength(0);
			sb.append("SELECT * FROM COMMENTS ");
			sb.append("INNER JOIN MEMBER ON COMMENTS.M_NUM = MEMBER.M_NUM ");
			sb.append("ORDER BY C_NUM DESC ");
			
			CmtjoinVO vo = null;

			try {
				pstmt = conn.prepareStatement(sb.toString());
				rs = pstmt.executeQuery();

				while (rs.next()) {
					int B_NUM = rs.getInt("B_NUM");
					String C_CONTENTS = rs.getString("C_CONTENTS");
					int C_NUM = rs.getInt("C_NUM");
					String C_REGDATE = rs.getString("C_REGDATE");
					String C_SECRET = rs.getString("C_SECRET");
					int M_NUM = rs.getInt("M_NUM");

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
					vo = new CmtjoinVO(B_NUM, C_CONTENTS, C_NUM, C_REGDATE, C_SECRET, M_NUM, ADDRESS, ADDRESSDETAIL, EMAIL, ID, NAME, NICKNAME, PASSWORD, PHONE, REGDATE, ZIPCODE );
					list.add(vo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}

	// 1건조회
	public CommentsVO selectOne(int C_NUM) {
		sb.setLength(0);
		sb.append("SELECT * FROM COMMENTS WHERE C_NUM = ?");
		CommentsVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, C_NUM);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int B_NUM = rs.getInt("B_NUM");
				String C_CONTENTS = rs.getString("C_CONTENTS");
				String C_REGDATE = rs.getString("C_REGDATE");
				String C_SECRET = rs.getString("C_SECRET");
				int M_NUM = rs.getInt("M_NUM");

				vo = new CommentsVO(B_NUM, C_CONTENTS, C_NUM, C_REGDATE, C_SECRET, M_NUM );

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	// 1건추가
	public void insertOne(CommentsVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO COMMENTS ");
		sb.append("(B_NUM, C_CONTENTS, C_REGDATE, C_SECRET, M_NUM ) ");
		sb.append("VALUES (?, ?, NOW(), 'N', ? ) ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getB_NUM());
			pstmt.setString(2, vo.getC_CONTENTS());
			pstmt.setInt(3, vo.getM_NUM());


			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 수정
	public void updateOne(CommentsVO vo) {
		sb.setLength(0);
		sb.append("UPDATE COMMENTS ");
		sb.append("SET C_CONTENTS = ? ");
		sb.append("WHERE C_NUM = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getC_CONTENTS());
			pstmt.setInt(2, vo.getC_NUM());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 삭제
	public void deleteOne(int C_NUM) {
		sb.setLength(0);
		sb.append("DELETE FROM COMMENTS WHERE C_NUM = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, C_NUM);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
