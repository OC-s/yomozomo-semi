<%@page import="kr.co.yomozomo.dao.QacommentsDAO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String no = request.getParameter("qac_num");
		String no2 = request.getParameter("qab_num");
		
		out.println(no);
		out.println(no2);

		 if(no != null){
			
			int qac_num = Integer.parseInt(no);
			int qab_num = Integer.parseInt(no2);
		
			
			QacommentsDAO dao = new QacommentsDAO();
			
			
			dao.deleteOne(qac_num);
			
			
		response.sendRedirect("qa_detail.jsp?qab_num="+qab_num);
		} 
%>   
    
 