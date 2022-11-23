<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.yomozomo.vo.BoardVO"%>
<%@page import="kr.co.yomozomo.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

//1. 파라미터 값 가져오기

//파라미터 값이 null이 아닐 때
	
	String saveDir = application.getRealPath("/upload");
	
	String realFolder = "C:\\Users\\gkw\\git\\yomozomo\\src\\main\\webapp\\uploadPic";
	
	int maxFileSize = 1024*1024*10;
	
	MultipartRequest mr = new MultipartRequest(request,realFolder,maxFileSize,"UTF-8",new DefaultFileRenamePolicy());
	
	String no=mr.getParameter("bnum");
	
	String f = mr.getOriginalFileName("filename");
	
	String realf = mr.getFilesystemName("filename"); 
	
	String title=mr.getParameter("title");
	String contents=mr.getParameter("contents");
	
	//dao, vo 만들기
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	
	int b=Integer.parseInt(no);
	
	//db에 저장돼있던 정보를 위의 파라미터 값으로 변경해주기
	vo.setB_CONTENTS(contents);
	vo.setB_TITLE(title);
	vo.setB_IMAGE("/yomozomo/uploadPic/"+f);
	vo.setB_NUM(b);
	
	//업데이트 메서드로 db업데이트 하기
	dao.updateOne(vo);
	
	dao.close();
	
	//완료되었으면 list.jsp로 리다이렉트 하도록 설정
	response.sendRedirect("b_mngmn1.jsp");

%>