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
import kr.co.yomozomo.vo.QacmtjoinVO;
import kr.co.yomozomo.vo.QacommentsVO;

public class QacommentsDAO {

	// 1.변수설정
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
	String user = "admin";
	String password = "yomozomo";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	public QacommentsDAO() {
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
	public ArrayList<QacommentsVO> selectAll() {
		ArrayList<QacommentsVO> list = new ArrayList<QacommentsVO>();

		sb.setLength(0);
		sb.append("SELECT * FROM QACMT ORDER BY QAC_NUM DESC");
		QacommentsVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int M_NUM = rs.getInt("M_NUM");
				int QAB_NUM = rs.getInt("QAB_NUM");
				String QAC_CONTENTS = rs.getString("QAC_CONTENTS");
				int QAC_NUM = rs.getInt("QAC_NUM");
				String QAC_REGDATE = rs.getString("QAC_REGDATE");
				String QAC_SECRET = rs.getString("QAC_SECRET");
				vo = new QacommentsVO(M_NUM, QAB_NUM, QAC_CONTENTS, QAC_NUM, QAC_REGDATE, QAC_SECRET );
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 전체조회(join)
		public ArrayList<QacmtjoinVO> joinAll() {
			ArrayList<QacmtjoinVO> list = new ArrayList<QacmtjoinVO>();

			sb.setLength(0);
			sb.append("SELECT * FROM QACMT ");
			sb.append("INNER JOIN MEMBER ON QACMT.M_NUM = MEMBER.M_NUM ");
			sb.append("ORDER BY QAC_NUM DESC ");
			
			QacmtjoinVO vo = null;

			try {
				pstmt = conn.prepareStatement(sb.toString());
				rs = pstmt.executeQuery();

				while (rs.next()) {
					int M_NUM = rs.getInt("M_NUM");
					int QAB_NUM = rs.getInt("QAB_NUM");
					String QAC_CONTENTS = rs.getString("QAC_CONTENTS");
					int QAC_NUM = rs.getInt("QAC_NUM");
					String QAC_REGDATE = rs.getString("QAC_REGDATE");
					String QAC_SECRET = rs.getString("QAC_SECRET");

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
					vo = new QacmtjoinVO(M_NUM, QAB_NUM, QAC_CONTENTS, QAC_NUM, QAC_REGDATE, QAC_SECRET, ADDRESS, ADDRESSDETAIL, EMAIL, ID, NAME, NICKNAME, PASSWORD, PHONE, REGDATE, ZIPCODE );
					list.add(vo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}

	// 1건조회
	public QacommentsVO selectOne(int QAC_NUM) {
		sb.setLength(0);
		sb.append("SELECT * FROM QACMT WHERE QAC_NUM = ?");
		QacommentsVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, QAC_NUM);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int M_NUM = rs.getInt("M_NUM");
				int QAB_NUM = rs.getInt("QAB_NUM");
				String QAC_CONTENTS = rs.getString("QAC_CONTENTS");
				String QAC_REGDATE = rs.getString("QAC_REGDATE");
				String QAC_SECRET = rs.getString("QAC_SECRET");

				vo = new QacommentsVO(M_NUM, QAB_NUM, QAC_CONTENTS, QAC_NUM, QAC_REGDATE, QAC_SECRET );

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	// 1건추가
	public void insertOne(QacommentsVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO QACMT ");
		sb.append("(M_NUM, QAB_NUM, QAC_CONTENTS, QAC_REGDATE, QAC_SECRET ) ");
		sb.append("VALUES (?, ?, ?, NOW(), 'N' ) ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getM_NUM());
			pstmt.setInt(2, vo.getQAB_NUM());
			pstmt.setString(3, vo.getQAC_CONTENTS());


			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int getTotal() {
		sb.setLength(0);
		sb.append("SELECT count(*) cnt FROM QACMT");
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
	
	// 전체조회(join)+페이징
		public ArrayList<QacmtjoinVO> joinpageAll(int startNo, int endNo) {
			ArrayList<QacmtjoinVO> list = new ArrayList<QacmtjoinVO>();
			

			sb.setLength(0);
			sb.append("SELECT * FROM QACMT ");
			sb.append("INNER JOIN MEMBER ON QACMT.M_NUM = MEMBER.M_NUM ");
			sb.append("ORDER BY QAC_NUM DESC ");
			sb.append("LIMIT ?, ? ");
			
			QacmtjoinVO vo = null;

			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, startNo-1);
				pstmt.setInt(2, endNo);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					int M_NUM = rs.getInt("M_NUM");
					int QAB_NUM = rs.getInt("QAB_NUM");
					String QAC_CONTENTS = rs.getString("QAC_CONTENTS");
					int QAC_NUM = rs.getInt("QAC_NUM");
					String QAC_REGDATE = rs.getString("QAC_REGDATE");
					String QAC_SECRET = rs.getString("QAC_SECRET");

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
					vo = new QacmtjoinVO(M_NUM, QAB_NUM, QAC_CONTENTS, QAC_NUM, QAC_REGDATE, QAC_SECRET, ADDRESS, ADDRESSDETAIL, EMAIL,
							ID, NAME, NICKNAME, PASSWORD, PHONE, REGDATE, ZIPCODE);
					list.add(vo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}

	// 수정
	public void updateOne(QacommentsVO vo) {
		sb.setLength(0);
		sb.append("UPDATE QACMT ");
		sb.append("SET QAC_CONTENTS = ? ");
		sb.append("WHERE QAC_NUM = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getQAC_CONTENTS());
			pstmt.setInt(2, vo.getQAC_NUM());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 삭제
	public void deleteOne(int QAC_NUM) {
		sb.setLength(0);
		sb.append("DELETE FROM QACMT WHERE QAC_NUM = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, QAC_NUM);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
