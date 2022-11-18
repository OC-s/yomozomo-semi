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

	
	String writer = mr.getParameter("writer");
	String title = mr.getParameter("title");
	String contents = mr.getParameter("contents");
	String num= mr.getParameter("m_num");
	
		
	//원래 파일의 이름
	String f = mr.getOriginalFileName("filename");
	
	String realf = mr.getFilesystemName("filename"); 
	
	if(writer != null && title != null && contents != null){
		
		int m_num = Integer.parseInt(num);
		
		BoardDAO dao = new BoardDAO();
		
		BoardVO vo = new BoardVO();
			
		vo.setB_TITLE(title);
		vo.setB_CONTENTS(contents);
		vo.setM_NUM(m_num);
		vo.setB_IMAGE("../yomozomo_test/upload/"+f);
		
		
		dao.insertOne(vo);
	}
	response.sendRedirect("pic.jsp");



%>