package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.admin.dao.SalesService;
import controller.admin.dto.AdminSalesDTO;

@WebServlet("/resources/user/u_sales")
public class SalesMemberController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("cp");
		int page_=1;
		if(page!=null && !page.equals("")) page_ =  Integer.parseInt(request.getParameter("cp")); 
		SalesService sService = new SalesService();
		

		
		List<AdminSalesDTO> list = sService.getMemberSales(page_);
		
		request.setAttribute("list", list);

		request.getRequestDispatcher("/resources/user/u_sales.jsp").forward(request, response);
	}
}
