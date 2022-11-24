<%@page import="java.util.List"%>
<%@page import="kr.co.yomozomo.vo.OrdermtVO"%>
<%@page import="kr.co.yomozomo.vo.MemberVO"%>
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
		OrderDAO dao = new OrderDAO();
			
		List<OrdermtVO> list = dao.monthTotal();
		
		for(OrdermtVO vo : list){
			
			out.print(vo.getDate());
			out.print(vo.getTotal());
			
		}
		
		%>

</body>
</html>