package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.QnaService;

@WebServlet("/product/qna/qq")
public class QnaAskController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String secret = request.getParameter("secret");
		if (secret == null || secret.equals(""))
			secret = "N";

		int pnum = Integer.parseInt(request.getParameter("id"));

		System.out.println(title + " " + contents + " " + secret + " id :" + pnum);

		QnaService service = new QnaService();

		HttpSession session = request.getSession();
		int mnum_ = 0;
		String mnum = String.valueOf(session.getAttribute("userNum"));

		if (mnum != null && !mnum.equals("null")) {
			mnum_ = Integer.parseInt(mnum);
			int result = service.setReview(mnum_, pnum, title, contents, "", secret);
		}
		else {
			int result = service.setReview(pnum, title, contents, "", secret);
		}

//		System.out.println(result);

		response.sendRedirect("/yomozomo/product/qna?id=" + pnum);
	}
}
