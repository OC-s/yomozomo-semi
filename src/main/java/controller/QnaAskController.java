package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaService;

@WebServlet("/product/qna/qq")
public class QnaAskController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title =request.getParameter("title");
		String contents =request.getParameter("contents");
		String secret = request.getParameter("secret");
		if (secret==null ||secret.equals("")) secret="N";
		
		int pnum = Integer.parseInt(request.getParameter("id"));
		
		System.out.println(title+" "+ contents+" "+secret+" id :"+pnum);
		
		QnaService service = new QnaService();
		int mnum = service.getMemberId("rudnf9605"); //세션으로 userId 얻어와서 넣으면 됨
		
//		image넣는거 시간되면 
		int result = service.setReview(mnum, pnum, title, contents, "", secret);
//		System.out.println(result);
		
		response.sendRedirect("/yomozomo/product/qna?id="+pnum);
	}
}
