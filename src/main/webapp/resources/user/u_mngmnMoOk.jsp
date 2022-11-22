<%@page import="kr.co.yomozomo.vo.MemberVO"%>
<%@page import="kr.co.yomozomo.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String num = request.getParameter("mnum");
		
		if (num !=null){
			int mnum = Integer.parseInt(num);
			
			String name = request.getParameter("name");
			String nickname = request.getParameter("nickname");
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String zipcode = request.getParameter("zipcode");
			String add = request.getParameter("add");
			String add2 = request.getParameter("add2");
    		
			MemberDAO dao = new MemberDAO();
			
			MemberVO vo = new MemberVO();
			vo.setNAME(name);
			vo.setNICKNAME(nickname);
			vo.setID(id);
			vo.setPASSWORD(password);
			vo.setEMAIL(email);
			vo.setPHONE(phone);
			vo.setZIPCODE(zipcode);
			vo.setADDRESS(add);
			vo.setADDRESSDETAIL(add2);
			vo.setM_NUM(mnum);
			
			dao.updateOne(vo);
			
		}
		
		response.sendRedirect("u_mngmn.jsp");
    
    %>