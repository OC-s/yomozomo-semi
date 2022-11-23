<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Object obj = session.getAttribute("vo");

if(obj!=null){
%>
<h2>비밀번호를 입력하세요</h2>
<form action="checkOk.jsp" method="post">
<input type="text" name="pw" id="" />
<button type="submit" class="btn btn-primary">제출</button>
</form>

<%
}else{
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인 한 회원만 이용 가능합니다')");
	script.println("location.href = '../login/login.jsp'");
	script.println("</script>");
}
%>
</body>
</html>