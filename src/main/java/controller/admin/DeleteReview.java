package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.admin.dao.QnaService;



@WebServlet("/deleteReview")
public class DeleteReview extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rnum = Integer.parseInt(req.getParameter("rnum"));
		int id = Integer.parseInt(req.getParameter("id"));
		QnaService qService = new QnaService();
		int result = qService.deleteReview(rnum);
		System.out.println(result);
		resp.sendRedirect("/yomozomo/product/review?id="+id);
	}
}
