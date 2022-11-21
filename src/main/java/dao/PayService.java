package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PayService {
	String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
	String user = "admin";
	String passWord = "yomozomo";

	public int insertUserOrder(int mnum, String post, String addrs, String addrs2, String oname, String tel, int amount,
			String email, String dname, String dname2, String phone) {
		int result = 0;

		try {
			String sql = "INSERT INTO UserOrder(M_NUM, O_DATE, O_ZIPCODE, O_ADDRESS, O_ADDRESSDETAIL, O_NAME,O_PHONE,O_STATUS,O_TOTAL,O_EMAIL,O_ADDNAME,O_ADDNAME2,O_ADDTEL)"
					+ "	VALUES(?, now(), ?, ?, ?, ?,?,'결제완료',?, ?, ?, ?, ?) ";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, mnum);
			st.setString(2, post);
			st.setString(3, addrs);
			st.setString(4, addrs2);
			st.setString(5, oname);
			st.setString(6, tel);
			st.setInt(7, amount);
			st.setString(8, email);
			st.setString(9, dname);
			st.setString(10, dname2);
			st.setString(11, phone);
			result = st.executeUpdate();

			st.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int getRecentOrderNum(int num) {
		int result = 0;
		try {
			String sql = "SELECT O_NUM FROM UserOrder where m_num=? order by O_date desc LIMIT 1 ";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, num);
			ResultSet rs = st.executeQuery();
			if (rs.next())
				result = rs.getInt("O_NUM");

			st.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int insertUserOrderDetail(int onum,int pnum,int count, int price) {
		int result = 0;

		try {
			String sql = "INSERT INTO UserOrder_detail(O_NUM,P_NUM,OD_COUNT,OD_PRICE)"
					+ " VALUES(?,?,?,?) ";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, onum);
			st.setInt(2, pnum);
			st.setInt(3, count);
			st.setInt(4, price);

			result = st.executeUpdate();

			st.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return result;

	}

	public int getProductPrice(int pnum) {
		int price = 0;
		try {
			String sql = "SELECT ROUND((P_PRICE*(1-P_DISCOUNT/100))) PRICE FROM PRODUCT WHERE P_NUM=? ";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, pnum);
			ResultSet rs = st.executeQuery();
			if (rs.next())
				price = rs.getInt("PRICE");

			st.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return price;
	}
}