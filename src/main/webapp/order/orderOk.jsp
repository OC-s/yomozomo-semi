
<%@page import="kr.co.yomozomo.vo.OrderVO"%>
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
		response.setContentType("text/html;charset=UTF-8");
		String dname = request.getParameter("dname");
		String dname2 = request.getParameter("dname2");
		String tel = request.getParameter("tel");
		String post = request.getParameter("post");
		String addrs = request.getParameter("addrs");
		String addrs2 = request.getParameter("addrs2");
		String oname = request.getParameter("oname");
		String tel2 = request.getParameter("tel2")+request.getParameter("tel3");
		String email = request.getParameter("email1")+'@'+request.getParameter("email2");
		
		OrderDAO dao = new OrderDAO();
		
		OrderVO vo = new OrderVO();
		vo.setO_ZIPCODE(post);
		vo.setO_ADDRESS(addrs);
		vo.setO_ADDRESSDETAIL(addrs2);
		vo.setO_NAME(oname);
		vo.setO_PHONE(tel2);
		vo.setO_EMAIL(email);
		vo.setO_ADDNAME(dname);
		vo.setO_ADDNAME2(dname2);
		vo.setO_ADDTEL(tel);
		
		dao.insertOne(vo);	
		
/* 		response.sendRedirect("../order/orderComplete.jsp"); */
    	
		pageContext.forward("orderComplete.jsp");	
	
	%>
	



</body>
</html>