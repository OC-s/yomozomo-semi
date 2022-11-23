<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

/* idCheckup.jsp?id=aaa */

//1. 한글 처리
request.setCharacterEncoding("UTF-8");

//2. 파라미터 값 가져오기: aaa
String id=request.getParameter("id");

boolean result=true;
//3 MemberDAO 객체
if(id!=null){
	MemberDAO dao=new MemberDAO();
	//4. dao.isExist(id); 존재하면 true, 없으면 false리턴하게 하기
	//참고: isExists(String id, String pw) 참고해서 만들기
	result=dao.isExists(id);	
	dao.close();
}else{
	result=false;
}

//5. 화면에 출력(=이게 response값이 됨)
out.println(result);



%>