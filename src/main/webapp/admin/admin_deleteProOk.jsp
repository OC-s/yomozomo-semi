

<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String no = request.getParameter("id");
		
		out.println(no);
		
		if(no != null){
			
			int P_NUM = Integer.parseInt(no);
			
			ProductDAO dao = new ProductDAO();
			
			
			dao.deleteOne(P_NUM);
			
		}
		response.sendRedirect("/yomozomo/resources/ymzm/p_mngmn.jsp");
%>   
    
 