package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.AnsQnaDTO;
import dto.QnaDTO;

public class QnaService {
	String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
	String user = "admin";
	String passWord = "yomozomo";

	public List<AnsQnaDTO> getAnswer(int id) {
		return getAnswer(id, 1);
	}

	public List<AnsQnaDTO> getAnswer(int id, int page) {
		List<AnsQnaDTO> list = new ArrayList<AnsQnaDTO>();
		AnsQnaDTO a = null;

		try {
			String sql = "SELECT Q.Q_TITLE, Q.Q_CONTENTS, A.A_CONTENTS FROM( "
					+ " (SELECT * FROM QNA Q WHERE P_NUM= ?) Q LEFT JOIN ANS A " + " ON  A.Q_NUM =Q.Q_NUM "
					+ " )ORDER BY Q.Q_REGDATE DESC " + " LIMIT ?,?";
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			st.setInt(2, (page - 1) * 10);
			st.setInt(3, page * 10);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String title = rs.getString("Q_TITLE");
				String acontents = rs.getString("A_CONTENTS");
				String qcontents = rs.getString("Q_CONTENTS");

				a = new AnsQnaDTO(title, qcontents, acontents);
				list.add(a);

			}
			rs.close();
			st.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getAnswerCount(int id) {
		int result = 0;
		try {
			String sql = "SELECT count(*) COUNT FROM QNA where p_num =?";
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);

			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				result = rs.getInt("COUNT");

			}
			rs.close();
			st.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<QnaDTO> getQna(int id) {
		List<QnaDTO> list = new ArrayList<QnaDTO>();
		QnaDTO q = null;

		try {
			String sql = "SELECT * FROM QNA " + " WHERE P_NUM =? ORDER BY Q_REGDATE DESC" + " LIMIT ? , ?";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int qnum = rs.getInt("Q_NUM");
				int mnum = rs.getInt("M_NUM");
				int pnum = rs.getInt("P_NUM");
				String title = rs.getString("Q_TITLE");
				Date regdate = rs.getDate("Q_REGDATE");
				String contents = rs.getString("Q_CONTENTS");
				String image = rs.getString("Q_IMAGE");
				String secret = rs.getString("Q_secret");
				q = new QnaDTO(qnum, mnum, pnum, title, regdate, contents, image, secret);
				list.add(q);
			}
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getMemberId(String userId) {
		int result = 0;
		try {
			String sql = "SELECT M_NUM FROM MEMBER WHERE ID =?";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, userId);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				result = rs.getInt("M_NUM");
			}
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int setReview(int mnum, int pnum, String title, String contents, String image, String secret) {
		int result = 0;
		try {
			String sql = "INSERT INTO QNA(M_NUM, P_NUM,Q_TITLE,Q_REGDATE, "
					+ " Q_CONTENTS, Q_IMAGE, Q_SECRET) VALUES(?,?,?,NOW(),?,?,? " + " )";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, mnum);
			st.setInt(2, pnum);
			st.setString(3, title);
			st.setString(4, contents);
			st.setString(5, image);
			st.setString(6, secret);

			result = st.executeUpdate();
			st.close();
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int setReview( int pnum, String title, String contents, String image, String secret) {
		int result = 0;
		try {
			String sql = "INSERT INTO QNA(M_NUM, P_NUM,Q_TITLE,Q_REGDATE, "
					+ " Q_CONTENTS, Q_IMAGE, Q_SECRET) VALUES(null,?,?,NOW(),?,?,? " + " )";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, pnum);
			st.setString(2, title);
			st.setString(3, contents);
			st.setString(4, image);
			st.setString(5, secret);

			result = st.executeUpdate();
			st.close();
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}
}
