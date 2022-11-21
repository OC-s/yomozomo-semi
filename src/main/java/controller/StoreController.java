package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewService;
import dao.StoreService;
import dto.ProductDTO;

@WebServlet("/store")
public class StoreController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cate = request.getParameter("category");
		if (cate.equals("전체"))
			cate = "";

		StoreService service = new StoreService();
		ReviewService serviceReview=new ReviewService();
		
		
		List<ProductDTO> list = service.getProduct(cate);		
		int count = service.getCountProduct(cate);


		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/store.jsp").forward(request, response);

	}
}
