<%@page import="kr.co.yomozomo.vo.OrderVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.yomozomo.dao.OrderDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			
			ArrayList<OrderVO> list = dao.selectAll2();
			
			int sum = 0;
			String data = "";
			
			for(OrderVO vo : list) {
				data = vo.getO_DATE().substring(0,7);
				
				/*  11월 매출액  */
				if(data.equals("2022-11")){
					sum += vo.getO_TOTAL();
				}
				
			}
			
		%>



</body>
</html>