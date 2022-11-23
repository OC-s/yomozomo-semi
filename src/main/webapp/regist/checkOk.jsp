<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

String pw=request.getParameter("pw");



if(result){
	response.sendRedirect("modifyRegister.jsp");
}else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 일치하지 않습니다')");
	script.println("location.href = 'registModifyCheck.jsp'");
	script.println("</script>");
}

%>