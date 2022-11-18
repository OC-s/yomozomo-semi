package kr.co.yomozomo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.yomozomo.vo.QaboardVO;
import kr.co.yomozomo.vo.QajoinVO;
import kr.co.yomozomo.vo.joinVO;

public class QaboardDAO {

	// 1.변수설정
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
	String user = "admin";
	String password = "yomozomo";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	public QaboardDAO() {
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
	
	//조회수 1증가
			public void raiseHits(int QAB_NUM) {
				//hits의 값을 1증가 시킴
				sb.setLength(0);		
				sb.append("UPDATE QABOARD ");
				sb.append("SET QAB_HIT = QAB_HIT+1 ");
				sb.append("WHERE QAB_NUM = ? ");
				
				try {
					pstmt = conn.prepareStatement(sb.toString());
					pstmt.setInt(1, QAB_NUM);
					pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}

	public int getTotal() {
		sb.setLength(0);
		sb.append("SELECT count(*) cnt FROM QABOARD");
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

	// 게시물번호가 큰순으로 출력
	public ArrayList<QaboardVO> selectAll(int startNo, int endNo) {
		ArrayList<QaboardVO> list = new ArrayList<QaboardVO>();
		sb.setLength(0);

		sb.append("SELECT * ");
		sb.append("FROM QABOARD ");
		sb.append("ORDER BY QAB_NUM desc ");
		sb.append("LIMIT ?, ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, startNo - 1);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int M_NUM = rs.getInt("M_NUM");
				String QAB_CONTENTS = rs.getString("QAB_CONTENTS");
				int QAB_HIT = rs.getInt("QAB_HIT");
				String QAB_IMAGE = rs.getString("QAB_IMAGE");
				int QAB_NUM = rs.getInt("QAB_NUM");
				String QAB_REGDATE = rs.getString("QAB_REGDATE");
				String QAB_TITLE = rs.getString("QAB_TITLE");

				QaboardVO qaboardvo = new QaboardVO(M_NUM, QAB_CONTENTS, QAB_HIT, QAB_IMAGE, QAB_NUM, QAB_REGDATE,
						QAB_TITLE);
				list.add(qaboardvo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// 전체조회
	public ArrayList<QaboardVO> selectAll() {
		ArrayList<QaboardVO> list = new ArrayList<QaboardVO>();

		sb.setLength(0);
		sb.append("SELECT * FROM QABOARD ORDER BY QAB_NUM DESC");
		QaboardVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int M_NUM = rs.getInt("M_NUM");
				String QAB_CONTENTS = rs.getString("QAB_CONTENTS");
				int QAB_HIT = rs.getInt("QAB_HIT");
				String QAB_IMAGE = rs.getString("QAB_IMAGE");
				int QAB_NUM = rs.getInt("QAB_NUM");
				String QAB_REGDATE = rs.getString("QAB_REGDATE");
				String QAB_TITLE = rs.getString("QAB_TITLE");
				vo = new QaboardVO(M_NUM, QAB_CONTENTS, QAB_HIT, QAB_IMAGE, QAB_NUM, QAB_REGDATE, QAB_TITLE);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//전체조회(join)
	public ArrayList<QajoinVO> joinAll(int startNo2, int endNo2){
		ArrayList<QajoinVO> list = new ArrayList<QajoinVO>();
		
		sb.setLength(0);
		//sb.append("SELECT * FROM BOARD INNER JOIN MEMBER ON BOARD.M_NUM = MEMBER.M_NUM ORDER BY B_NUM DESC");
		sb.append("SELECT * ");
		sb.append("FROM QABOARD ");	
		sb.append("INNER JOIN MEMBER ON QABOARD.M_NUM = MEMBER.M_NUM ");
		sb.append("ORDER BY QAB_NUM desc ");
		sb.append("LIMIT ?, ? ");
		
		QajoinVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, startNo2-1);
			pstmt.setInt(2, endNo2);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int M_NUM = rs.getInt("M_NUM");
				String QAB_CONTENTS = rs.getString("QAB_CONTENTS");
				int QAB_HIT = rs.getInt("QAB_HIT");
				String QAB_IMAGE = rs.getString("QAB_IMAGE");
				int QAB_NUM = rs.getInt("QAB_NUM");
				String QAB_REGDATE = rs.getString("QAB_REGDATE");
				String QAB_TITLE = rs.getString("QAB_TITLE");
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
				vo = new QajoinVO(M_NUM, QAB_CONTENTS, QAB_HIT, QAB_IMAGE, QAB_NUM, QAB_REGDATE, QAB_TITLE, ADDRESS, ADDRESSDETAIL, EMAIL, ID, NAME, NICKNAME, PASSWORD, PHONE, REGDATE, ZIPCODE);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// 1건 조회
	public QaboardVO selectOne(int QAB_NUM) {
		sb.setLength(0);
		sb.append("SELECT * FROM QABOARD WHERE QAB_NUM = ?");
		QaboardVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, QAB_NUM);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int M_NUM = rs.getInt("M_NUM");
				String QAB_CONTENTS = rs.getString("QAB_CONTENTS");
				int QAB_HIT = rs.getInt("QAB_HIT");
				String QAB_IMAGE = rs.getString("QAB_IMAGE");
				String QAB_REGDATE = rs.getString("QAB_REGDATE");
				String QAB_TITLE = rs.getString("QAB_TITLE");
				vo = new QaboardVO(M_NUM, QAB_CONTENTS, QAB_HIT, QAB_IMAGE, QAB_NUM, QAB_REGDATE, QAB_TITLE);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	//1건 조회(join)
	public QajoinVO joinOne(int QAB_NUM) {
		sb.setLength(0);
		sb.append("SELECT * FROM QABOARD ");
		sb.append("INNER JOIN MEMBER ON QABOARD.M_NUM = MEMBER.M_NUM ");
		sb.append("WHERE QAB_NUM = ? ");
		QajoinVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, QAB_NUM);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {	
				int M_NUM = rs.getInt("M_NUM");
				String QAB_CONTENTS = rs.getString("QAB_CONTENTS");
				int QAB_HIT = rs.getInt("QAB_HIT");
				String QAB_IMAGE = rs.getString("QAB_IMAGE");
				String QAB_REGDATE = rs.getString("QAB_REGDATE");
				String QAB_TITLE = rs.getString("QAB_TITLE");
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
				vo = new QajoinVO(M_NUM, QAB_CONTENTS, QAB_HIT, QAB_IMAGE, QAB_NUM, QAB_REGDATE, QAB_TITLE, ADDRESS, ADDRESSDETAIL, EMAIL, ID, NAME, NICKNAME, PASSWORD, PHONE, REGDATE, ZIPCODE);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;		
	}
	

	// 1건추가
	public void insertOne(QaboardVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO QABOARD ");
		sb.append("(M_NUM, QAB_CONTENTS, QAB_HIT, QAB_IMAGE, QAB_REGDATE, QAB_TITLE) ");
		sb.append("VALUES (?, ?, 0, ?, NOW(), ? ) ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getM_NUM());
			pstmt.setString(2, vo.getQAB_CONTENTS());
			pstmt.setString(3, vo.getQAB_IMAGE());
			pstmt.setString(4, vo.getQAB_TITLE());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 수정
	public void updateOne(QaboardVO vo) {
		sb.setLength(0);
		sb.append("UPDATE QABOARD ");
		sb.append("SET QAB_CONTENTS = ?, QAB_IMAGE = ?, QAB_TITLE = ? ");
		sb.append("WHERE QAB_NUM = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getQAB_CONTENTS());
			pstmt.setString(2, vo.getQAB_IMAGE());
			pstmt.setString(3, vo.getQAB_TITLE());
			pstmt.setInt(4, vo.getQAB_NUM());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 삭제
	public void deleteOne(int QAB_NUM) {
		sb.setLength(0);
		sb.append("DELETE FROM QABOARD WHERE QAB_NUM = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, QAB_NUM);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
