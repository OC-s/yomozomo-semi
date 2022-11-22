package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewService;
import dao.StoreService;
import dto.ProductDTO;
import dto.ReviewDTO;

@WebServlet("/product/review")
public class ReviewController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		int mnum_=0;
		String mnum = String.valueOf(session.getAttribute("userNum"));
		
		if (mnum!=null && !mnum.equals("null")) mnum_ = Integer.parseInt(mnum);
	

		StoreService service = new StoreService();
		ReviewService serviceReview = new ReviewService();
		
		boolean check = serviceReview.getCheckProduct(mnum_,id);
		ProductDTO product = service.getProductDetail(id);
		List<ReviewDTO> review = serviceReview.getReview(id); 
		
		request.setAttribute("mnum",mnum);
		request.setAttribute("review", review);
		request.setAttribute("check",check);
		request.setAttribute("product",product);
		request.setAttribute("id",id);
		request.getRequestDispatcher("/review.jsp").forward(request, response);
		
	}
}
