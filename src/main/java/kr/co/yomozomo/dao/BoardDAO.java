package kr.co.yomozomo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.yomozomo.vo.BoardVO;
import kr.co.yomozomo.vo.joinVO;



public class BoardDAO {

	// 1.변수설정
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
		String user = "admin";
		String password = "yomozomo";
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;

		public BoardDAO() {
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
		public void raiseHits(int B_NUM) {
			//hits의 값을 1증가 시킴
			sb.setLength(0);		
			sb.append("UPDATE BOARD ");
			sb.append("SET B_HIT = B_HIT+1 ");
			sb.append("WHERE B_NUM = ? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, B_NUM);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		public int getTotal() {
			sb.setLength(0);
			sb.append("SELECT count(*) cnt FROM BOARD");
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
		
				
		//게시물번호가 큰순으로 출력
		public ArrayList<BoardVO> selectAll(int startNo, int endNo){
			ArrayList<BoardVO> list = new ArrayList<BoardVO>();		
			sb.setLength(0);
			
			
			//sb.append("SELECT @ROWNUM := @ROWNUM + 1 AS RN, B_CONTENTS, B_HIT, B_IMAGE, B_NUM, B_REGDATE, B_TITLE, M_NUM ");
			//sb.append("FROM (SELECT RN, B_CONTENTS, B_HIT, B_IMAGE, B_NUM, B_REGDATE, B_TITLE, M_NUM ");
			//sb.append("FROM (SELECT B_CONTENTS, B_HIT, B_IMAGE, B_NUM, B_REGDATE, B_TITLE, M_NUM ");
			//sb.append("FROM BOARD ");
			//sb.append("WHERE ORDER BY B_NUM DESC)A)A ");			
			//sb.append("WHERE RN <= ? AND RN >= ? ");
			
			sb.append("SELECT * ");
			sb.append("FROM BOARD ");			
			sb.append("ORDER BY B_NUM desc ");
			sb.append("LIMIT ?, ? ");
				
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, startNo-1);
				pstmt.setInt(2, endNo);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String B_CONTENTS = rs.getString("B_CONTENTS");
					int B_HIT = rs.getInt("B_HIT");
					String B_IMAGE = rs.getString("B_IMAGE");
					int B_NUM = rs.getInt("B_NUM");
					String B_REGDATE = rs.getString("B_REGDATE");
					String B_TITLE = rs.getString("B_TITLE");
					int M_NUM = rs.getInt("M_NUM");
					BoardVO vo = new BoardVO(B_CONTENTS, B_HIT, B_IMAGE, B_NUM, B_REGDATE, B_TITLE, M_NUM);
					list.add(vo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		
		//조회수가 큰순으로 출력
				public ArrayList<BoardVO> selectHit(int startNo2, int endNo2){
					ArrayList<BoardVO> list = new ArrayList<BoardVO>();		
					sb.setLength(0);
					
					
					//sb.append("SELECT @ROWNUM := @ROWNUM + 1 AS RN, B_CONTENTS, B_HIT, B_IMAGE, B_NUM, B_REGDATE, B_TITLE, M_NUM ");
					//sb.append("FROM (SELECT RN, B_CONTENTS, B_HIT, B_IMAGE, B_NUM, B_REGDATE, B_TITLE, M_NUM ");
					//sb.append("FROM (SELECT B_CONTENTS, B_HIT, B_IMAGE, B_NUM, B_REGDATE, B_TITLE, M_NUM ");
					//sb.append("FROM BOARD ");
					//sb.append("WHERE ORDER BY B_NUM DESC)A)A ");			
					//sb.append("WHERE RN <= ? AND RN >= ? ");
					
					sb.append("SELECT * ");
					sb.append("FROM BOARD ");			
					sb.append("ORDER BY B_HIT desc ");
					sb.append("LIMIT ?, ? ");
						
					try {
						pstmt = conn.prepareStatement(sb.toString());
						pstmt.setInt(1, startNo2-1);
						pstmt.setInt(2, endNo2);
						rs = pstmt.executeQuery();
						while(rs.next()) {
							String B_CONTENTS = rs.getString("B_CONTENTS");
							int B_HIT = rs.getInt("B_HIT");
							String B_IMAGE = rs.getString("B_IMAGE");
							int B_NUM = rs.getInt("B_NUM");
							String B_REGDATE = rs.getString("B_REGDATE");
							String B_TITLE = rs.getString("B_TITLE");
							int M_NUM = rs.getInt("M_NUM");
							BoardVO vo = new BoardVO(B_CONTENTS, B_HIT, B_IMAGE, B_NUM, B_REGDATE, B_TITLE, M_NUM);
							list.add(vo);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return list;
				}
		
		//전체조회
		public ArrayList<BoardVO> selectAll(){
			ArrayList<BoardVO> list = new ArrayList<BoardVO>();
			
			sb.setLength(0);
			sb.append("SELECT * FROM BOARD ORDER BY B_NUM DESC");
			BoardVO vo = null;
			
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
					vo = new BoardVO(B_CONTENTS, B_HIT, B_IMAGE, B_NUM, B_REGDATE, B_TITLE, M_NUM);
					list.add(vo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		
		//전체조회(join)
				public ArrayList<joinVO> joinAll(int startNo3, int endNo3){
					ArrayList<joinVO> list = new ArrayList<joinVO>();
					
					sb.setLength(0);
					//sb.append("SELECT * FROM BOARD INNER JOIN MEMBER ON BOARD.M_NUM = MEMBER.M_NUM ORDER BY B_NUM DESC");
					sb.append("SELECT * ");
					sb.append("FROM BOARD ");	
					sb.append("INNER JOIN MEMBER ON BOARD.M_NUM = MEMBER.M_NUM ");
					sb.append("ORDER BY B_NUM desc ");
					sb.append("LIMIT ?, ? ");
					
					joinVO vo = null;
					
					try {
						pstmt = conn.prepareStatement(sb.toString());
						pstmt.setInt(1, startNo3-1);
						pstmt.setInt(2, endNo3);
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							String B_CONTENTS = rs.getString("B_CONTENTS");
							int B_HIT = rs.getInt("B_HIT");
							String B_IMAGE = rs.getString("B_IMAGE");
							int B_NUM = rs.getInt("B_NUM");
							String B_REGDATE = rs.getString("B_REGDATE");
							String B_TITLE = rs.getString("B_TITLE");
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
							vo = new joinVO(B_CONTENTS, B_HIT, B_IMAGE, B_NUM, B_REGDATE, B_TITLE, M_NUM, ADDRESS, ADDRESSDETAIL, EMAIL, ID, NAME, NICKNAME, PASSWORD, PHONE, REGDATE, ZIPCODE);
							list.add(vo);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return list;
				}
		
		//1건 조회
		public BoardVO selectOne(int B_NUM) {
			sb.setLength(0);
			sb.append("SELECT * FROM BOARD WHERE B_NUM = ?");
			BoardVO vo = null;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, B_NUM);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {	
					String B_CONTENTS = rs.getString("B_CONTENTS");
					int B_HIT = rs.getInt("B_HIT");
					String B_IMAGE = rs.getString("B_IMAGE");
					String B_REGDATE = rs.getString("B_REGDATE");
					String B_TITLE = rs.getString("B_TITLE");
					int M_NUM = rs.getInt("M_NUM");
					vo = new BoardVO(B_CONTENTS, B_HIT, B_IMAGE, B_NUM, B_REGDATE, B_TITLE, M_NUM);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return vo;		
		}
		
		//1건 조회(join)
				public joinVO joinOne(int B_NUM) {
					sb.setLength(0);
					sb.append("SELECT * FROM BOARD ");
					sb.append("INNER JOIN MEMBER ON BOARD.M_NUM = MEMBER.M_NUM ");
					sb.append("WHERE B_NUM = ? ");
					joinVO vo = null;
					
					try {
						pstmt = conn.prepareStatement(sb.toString());
						pstmt.setInt(1, B_NUM);
						
						rs = pstmt.executeQuery();
						
						while(rs.next()) {	
							String B_CONTENTS = rs.getString("B_CONTENTS");
							int B_HIT = rs.getInt("B_HIT");
							String B_IMAGE = rs.getString("B_IMAGE");
							String B_REGDATE = rs.getString("B_REGDATE");
							String B_TITLE = rs.getString("B_TITLE");
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
							vo = new joinVO(B_CONTENTS, B_HIT, B_IMAGE, B_NUM, B_REGDATE, B_TITLE, M_NUM, ADDRESS, ADDRESSDETAIL, EMAIL, ID, NAME, NICKNAME, PASSWORD, PHONE, REGDATE, ZIPCODE);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return vo;		
				}
		
		
		
		//1건추가
		public void insertOne(BoardVO vo) {
			sb.setLength(0);
			sb.append("INSERT INTO BOARD ");
			sb.append("(B_CONTENTS, B_HIT, B_IMAGE, B_REGDATE, B_TITLE, M_NUM) ");
			sb.append("VALUES (?, 0, ?, NOW(), ?, ?) ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getB_CONTENTS());
				pstmt.setString(2, vo.getB_IMAGE());
				pstmt.setString(3, vo.getB_TITLE());	
				pstmt.setInt(4, vo.getM_NUM());	

				pstmt.executeUpdate();			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//수정
		public void updateOne(BoardVO vo) {
			sb.setLength(0);
			sb.append("UPDATE BOARD ");
			sb.append("SET B_CONTENTS = ?, B_IMAGE = ?, B_TITLE = ? ");
			sb.append("WHERE B_NUM = ? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getB_CONTENTS());
				pstmt.setString(2, vo.getB_IMAGE());
				pstmt.setString(3, vo.getB_TITLE());
				pstmt.setInt(4, vo.getB_NUM());
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		
		//삭제
		public void deleteOne(int B_NUM) {
			sb.setLength(0);
			sb.append("DELETE FROM BOARD WHERE B_NUM = ? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, B_NUM);
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
		
		//자원반납
		public void close() {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
	}
	

