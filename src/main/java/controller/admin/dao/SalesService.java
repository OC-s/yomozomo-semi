package controller.admin.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import controller.admin.dto.AdminSalesDTO;

public class SalesService {
	String url = "jdbc:mysql://db1.c8obnk8nkf9s.ap-northeast-2.rds.amazonaws.com:3306/yomozomo";
	String user = "admin";
	String passWord = "yomozomo";

	public List<AdminSalesDTO> getMemberSales(int page) {
		List<AdminSalesDTO> list = new ArrayList<AdminSalesDTO>();
		AdminSalesDTO a = null;
		try {
			String sql = "SELECT M.M_NUM, M.ID, M.NAME, SUM(U.O_TOTAL) TOTAL "
					+ "FROM MEMBER M LEFT JOIN UserOrder U "
					+ "ON M.M_NUM = U.M_NUM "
					+ "GROUP BY M.M_NUM "
					+ "order by total desc "
					+ "LIMIT ?,? ";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, (1+(page-1)*15)-1);
			st.setInt(2, page*15);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int mnum = rs.getInt("M_NUM");
				String id = rs.getString("ID");
				String name = rs.getString("NAME");
				int total =rs.getInt("TOTAL");
				a = new AdminSalesDTO(mnum, id, name, total);
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
	public int getCountSales() {
		int count =0;
		try {
			String sql = "SELECT M.M_NUM, M.ID, M.NAME, SUM(U.O_TOTAL) TOTAL, count(*) COUNT "
					+ "FROM MEMBER M LEFT JOIN UserOrder U "
					+ "ON M.M_NUM = U.M_NUM "
					+ "GROUP BY M.M_NUM  "
					+ "order by total desc";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passWord);
			PreparedStatement st = con.prepareStatement(sql);

			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				count = rs.getInt("COUNT");
			}
			rs.close();
			st.close();
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return count;
	}
}
