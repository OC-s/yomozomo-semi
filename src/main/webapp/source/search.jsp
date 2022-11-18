

<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.yomozomo.vo.ProductVO"%>
<%@page import="kr.co.yomozomo.dao.OrderDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String txt = request.getParameter("txt");
	
		if(txt != null){
			OrderDAO dao = new OrderDAO();
			ArrayList<ProductVO> list = dao.select(txt);
			
			response.sendRedirect("../store?category=");
/* 			response.sendRedirect("../store?name="+list); */
		}
		
		
	%>

</body>
</html>