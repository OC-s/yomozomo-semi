<%@page import="java.io.PrintWriter"%>
<%@page import="kr.co.yomozomo.vo.BoardVO"%>
<%@page import="kr.co.yomozomo.dao.BoardDAO"%>
<%@page import="java.io.File" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	//upload 디렐토리 실제경로얻어오기
	String saveDir = application.getRealPath("/upload");
	//out.println(saveDir);
	
	//첨부파일의 최대 크기
	int maxFileSize = 1024*1024*10;
	
	//파라미터값가져오기
	MultipartRequest mr = new MultipartRequest(request,saveDir,maxFileSize,"UTF-8",new DefaultFileRenamePolicy());

	
	String no= mr.getParameter("b_num");
		
	//원래 파일의 이름
	String f = mr.getOriginalFileName("filename");
	
	String realf = mr.getFilesystemName("filename"); 
	
	String writer = mr.getParameter("writer");
	String title = mr.getParameter("title");
	String contents = mr.getParameter("contents");
	
	if(title != null && contents != null && f != null){
		
		int b_num = Integer.parseInt(no);
				
		int m_num = Integer.parseInt(writer);
		
		BoardDAO dao = new BoardDAO();
		
		BoardVO vo = new BoardVO();
		
		vo.setB_NUM(b_num);
		vo.setB_CONTENTS(contents);
		vo.setB_IMAGE("../upload/"+f);
		vo.setB_TITLE(title);
		
		
		dao.updateOne(vo);
		
		response.sendRedirect("pic.jsp");
	
	}else if(title == null){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('제목을 작성해 주세요')");
		script.println("history.back()");
		script.println("</script>");
		
	}else if(contents == null){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('내용을 작성해 주세요')");
		script.println("history.back()");
		script.println("</script>");
		
	}else if(f == null){
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('사진을 올려 주세요')");
		script.println("history.back()");
		script.println("</script>");
		
	}



%>