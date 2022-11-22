package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.admin.dao.QnaService;

@WebServlet("/product/qna/admin")
public class QnaAnswerController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnum = Integer.parseInt(request.getParameter("q_num"));
		int pnum = Integer.parseInt(request.getParameter("p_num"));
		String contents = request.getParameter("content");
		
		QnaService qService = new QnaService();
		int result = qService.insertAns(qnum, pnum, contents);
		
		response.sendRedirect("/yomozomo/product/qna?id="+pnum);
	}
}
