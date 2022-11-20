<%@page import="java.io.PrintWriter"%>
<%@page import="kr.co.yomozomo.vo.CommentsVO"%>
<%@page import="kr.co.yomozomo.dao.CommentsDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	// 1. 파라미터값 가져오기
	String no = request.getParameter("c_num");
	String no2 = request.getParameter("b_num");
	String contents = request.getParameter("contents");
	
	
	// 2. no가 null 아니면  나머지 파라미터값과 dao,vo 객체생성
	if(no != null && contents!=""){
		int c_num = Integer.parseInt(no);
		int b_num = Integer.parseInt(no2);
	
		CommentsDAO dao = new CommentsDAO();
		
		CommentsVO vo = new CommentsVO();
		vo.setC_CONTENTS(contents);
		vo.setC_NUM(c_num);

		
		// 3. dao.updateOne(BoardVO vo);
		dao.updateOne(vo);
		
		  //out.println(vo);

	response.sendRedirect("pic_detail.jsp?b_num="+b_num);
	
	}else{
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글을 작성해 주세요')");
		script.println("history.back()");
		script.println("</script>");
	}

	
	
%>