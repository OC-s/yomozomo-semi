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

@WebServlet("/detail")
public class DetailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		
		StoreService service = new StoreService();
		QnaService ansService = new QnaService();
		
		
		ProductDTO product = service.getProductDetail(id);
		List<AnsQnaDTO> ans = ansService.getAnswer(id);
		int result = service.updateProductHit(id);

		request.setAttribute("ans",ans);
		request.setAttribute("product",product);
		request.getRequestDispatcher("/detail.jsp").forward(request, response);
		
		
		
	}
}
