package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaService;
import dao.StoreService;
import dto.AnsQnaDTO;
import dto.ProductDTO;

@WebServlet("/product/qna")
public class QnaController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int id = Integer.parseInt(request.getParameter("id"));
		String page_ = request.getParameter("p");
		int page =1;
		
		if(page_!=null && !page_.equals("")) page = Integer.parseInt(page_);
		
		
		StoreService service = new StoreService();
		QnaService ansService = new QnaService();

		ProductDTO product = service.getProductDetail(id);
		List<AnsQnaDTO> ans = ansService.getAnswer(id,page);
		int count = ansService.getAnswerCount(id);

		

		request.setAttribute("count",count);
		request.setAttribute("ans", ans);
		request.setAttribute("product",product);
		request.setAttribute("id",id);
		request.getRequestDispatcher("/qnaPage.jsp").forward(request, response);
	}
}
