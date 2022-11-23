package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.admin.dao.QnaService;

@WebServlet("/deleteQna")
public class DeleteQna extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int qnum = Integer.parseInt(req.getParameter("id"));
		System.out.println(qnum);
		QnaService service = new QnaService();
		int result1 = service.deleteAns(qnum);
		int result2 =service.deleteQna(qnum);

		resp.sendRedirect("/yomozomo/resources/ymzm/q_mngmn");
	}
}
