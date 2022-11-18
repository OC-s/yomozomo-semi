<%@page import="kr.co.yomozomo.dao.BoardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String no = request.getParameter("b_num");
		
		if(no != null){
			
			int b_num = Integer.parseInt(no);
			
			BoardDAO dao = new BoardDAO();
			
			
			dao.deleteOne(b_num);
			
		}
		response.sendRedirect("pic.jsp");
%>   
    
 