package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.yomozomo.dao.MemberDAO;

@WebServlet("/login/searchEmail")
public class EmailOkController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
	
		MemberDAO service = new MemberDAO();
		String id = service.getUserId(email);
		
		req.setAttribute("id", id);
		req.getRequestDispatcher("/login/searchEmail.jsp").forward(req, resp);
		
	}
}
