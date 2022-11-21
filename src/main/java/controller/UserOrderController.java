package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PayService;

@WebServlet("/order/orderOok")
public class UserOrderController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dname =request.getParameter("dname"); // 배송지명
		String dname2 =request.getParameter("dname2");//받는사람
		String tel =request.getParameter("tel"); // 연락처
		String post =request.getParameter("post"); //주소
		String addrs =request.getParameter("addrs");//주소
		String addrs2 =request.getParameter("addrs2");//상세주소
		String oname =request.getParameter("oname");// 주문자이름
		String email1 =request.getParameter("email1");// 이메일 
		String email2 =request.getParameter("email2"); // @naver
		String tel2 =request.getParameter("tel2");//010
		String tel3 =request.getParameter("tel3");//뒷번호
		int amount =Integer.parseInt(request.getParameter("amount")); //총 금액
		String email = email1+email2;
		String phone =tel2+tel3;
		HttpSession s = request.getSession();
		int userId = (int) s.getAttribute("userNum");
		
		PayService payService = new PayService();
		
		int result = payService.insertUserOrder(userId, post, addrs, addrs2, oname, tel, amount,email,dname,dname2,phone);
		int recentNum = payService.getRecentOrderNum(userId);
		
		
		


		
		
		HashMap<Integer, Integer>  ss = (HashMap<Integer, Integer>) s.getAttribute("cart");
		for(java.util.Map.Entry<Integer, Integer> entry :ss.entrySet()) {
			int price = payService.getProductPrice(entry.getKey());
			int pnum = entry.getKey();
			int count = entry.getValue();
			int result2 = payService.insertUserOrderDetail(recentNum, pnum, count, price);
//			System.out.println(result2);
		}
		
		
		s.removeAttribute("cart");
		
		PrintWriter out = response.getWriter();
		out.print("y");
	}
}