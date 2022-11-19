package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.QnaService;
import dao.StoreService;
import dto.AnsQnaDTO;
import dto.ProductDTO;

@WebServlet("/product/review")
public class ReviewController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setCharacterEncoding("utf-8");
		StoreService service = new StoreService();
		QnaService ansService = new QnaService();

		ProductDTO product = service.getProductDetail(id);
		List<AnsQnaDTO> ans = ansService.getAnswer(id);
	
		HttpSession session = request.getSession();
		Object s = session.getAttribute("userNum");
		System.out.println(s);

		request.setAttribute("ans", ans);
		request.setAttribute("product",product);
		request.setAttribute("id",id);
		request.getRequestDispatcher("/review.jsp").forward(request, response);
		
	}
}
