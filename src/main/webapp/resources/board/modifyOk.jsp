<%@page import="kr.co.yomozomo.vo.BoardVO"%>
<%@page import="kr.co.yomozomo.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

//1. 파라미터 값 가져오기
String no = request.getParameter("bnum");

//파라미터 값이 null이 아닐 때
if (no!=null) {
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	//dao, vo 만들기
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	
	//가져온 bno를 형변환 해주기
	int bno = Integer.parseInt(no);
	
	//db에 저장돼있던 정보를 위의 파라미터 값으로 변경해주기
	vo.setWriter(writer);
	vo.setTitle(title);
	vo.setContents(contents);
	vo.setBno(bno);
	
	//업데이트 메서드로 db업데이트 하기
	dao.updateOne(vo);
	
	dao.close();
	
	//완료되었으면 list.jsp로 리다이렉트 하도록 설정
	response.sendRedirect("list.jsp");
}


%>