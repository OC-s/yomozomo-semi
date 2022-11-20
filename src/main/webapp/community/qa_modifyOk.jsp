<%@page import="java.io.PrintWriter"%>
<%@page import="kr.co.yomozomo.vo.QaboardVO"%>
<%@page import="kr.co.yomozomo.dao.QaboardDAO"%>
<%@page import="java.io.File" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	String num= request.getParameter("qab_num");
	
	
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	if(title != "" && contents != "" ){
		
		int qab_num = Integer.parseInt(num);
		
		
		int m_num = Integer.parseInt(writer);
		
		QaboardDAO dao = new QaboardDAO();
		
		QaboardVO vo = new QaboardVO();
		
		vo.setQAB_NUM(qab_num);
		vo.setQAB_CONTENTS(contents);
		vo.setQAB_TITLE(title);
		
		
		dao.updateOne(vo);
		
		response.sendRedirect("qa.jsp");
	}else if(title == ""){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('제목을 작성해 주세요')");
		script.println("history.back()");
		script.println("</script>");
		
	}else if(contents == ""){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('내용을 작성해 주세요')");
		script.println("history.back()");
		script.println("</script>");
		
	}

%>