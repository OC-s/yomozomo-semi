<%@page import="kr.co.yomozomo.dao.CommentsDAO"%>
<%@page import="kr.co.yomozomo.dao.BoardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String no = request.getParameter("c_num");
		String no2 = request.getParameter("b_num");
		
		out.println(no);
		out.println(no2);

		 if(no != null){
			
			int c_num = Integer.parseInt(no);
			int b_num = Integer.parseInt(no2);
		
			
			CommentsDAO dao = new CommentsDAO();
			
			
			dao.deleteOne(c_num);
			
			
		response.sendRedirect("pic_detail.jsp?b_num="+b_num);
		} 
%>   
    
 