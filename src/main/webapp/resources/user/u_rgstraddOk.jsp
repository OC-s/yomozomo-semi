<%@page import="kr.co.yomozomo.dao.MemberDAO"%>
<%@page import="kr.co.yomozomo.vo.MemberVO"%>
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
		
		String name = request.getParameter("NAME");
		String id = request.getParameter("ID");
		String password = request.getParameter("PASSWORD");
		String phone = request.getParameter("PHONE");
		String email = request.getParameter("EMAIL");
		String nickname = request.getParameter("NICKNAME");
		String zipcode = request.getParameter("ZIPCODE");
		String add = request.getParameter("ADDRESS");
		String add2 = request.getParameter("ADDRESSDETAIL");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = new MemberVO();
		vo.setNAME(name);
		vo.setID(id);
		vo.setPASSWORD(password);
		vo.setPHONE(phone);
		vo.setEMAIL(email);
		vo.setNICKNAME(nickname);
		vo.setZIPCODE(zipcode);
		vo.setADDRESS(add);
		vo.setADDRESSDETAIL(add2);
		
		dao.insertOne(vo);
		
		dao.close();
		
		response.sendRedirect("u_rgstr.jsp");
		
	%>
	







</body>
</html>