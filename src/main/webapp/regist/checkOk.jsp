<%@page import="kr.co.yomozomo.vo.MemberVO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

String pw=request.getParameter("pw");
out.println(pw);

Object obj=session.getAttribute("vo");
MemberVO vo=(MemberVO)obj;

String realPw=vo.getPASSWORD();
out.println(realPw);

//==쓰면 이상하게 작동함
//equals메서드 쓰니 정상적으로 작동함
if(realPw.equals(pw)){
 	response.sendRedirect("modifyRegister.jsp");
}else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 일치하지 않습니다')");
	script.println("location.href = 'registModifyCheck.jsp'");
	script.println("</script>");
}

%>