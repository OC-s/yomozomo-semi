<%@page import="kr.co.yomozomo.dao.QaboardDAO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String no = request.getParameter("qab_num");
		
		if(no != null){
			
			int qab_num = Integer.parseInt(no);
			
			QaboardDAO dao = new QaboardDAO();
			
			
			dao.deleteOne(qab_num);
			
		}
		response.sendRedirect("qa.jsp");
%>   
    
 