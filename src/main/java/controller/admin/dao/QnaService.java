package controller.admin.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import controller.admin.dto.AdminQnaDTO;

public class QnaService {
	String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
	String user = "admin";
	String passWord = "yomozomo";

	public List<AdminQnaDTO> getAnswer(int page) {
		List<AdminQnaDTO> list = new ArrayList<AdminQnaDTO>();
		AdminQnaDTO a = null;
		try {
			String sql = "SELECT *  FROM( " + " (SELECT * FROM QNA Q) Q LEFT JOIN ANS A  ON  A.Q_NUM =Q.Q_NUM "
					+ " )ORDER BY Q.Q_REGDATE DESC" + " LIMIT ?,?";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, (1+(page-1)*15)-1);
			st.setInt(2, page*15);
			
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int qnum = rs.getInt("Q_NUM");
				int mnum = rs.getInt("M_NUM");
				int pnum = rs.getInt("P_NUM");
				String title = rs.getString("Q_TITLE");
				Date regdate = rs.getDate("Q_REGDATE");
				String contents = rs.getString("Q_CONTENTS");
				String acontents = rs.getString("A_CONTENTS");
				a = new AdminQnaDTO(qnum, mnum, pnum, title, regdate, contents, acontents);
				list.add(a);

			}
			rs.close();
			st.close();
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getCountAnswer() {
		int result = 0;
		try {
			String sql = "SELECT count(*) COUNT FROM QNA";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);

			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				result = rs.getInt("COUNT");
			}
			rs.close();
			st.close();
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return result;
	}

}
