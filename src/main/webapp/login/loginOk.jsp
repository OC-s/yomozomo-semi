<%@page import="java.io.PrintWriter"%>
<%@page import="kr.co.yomozomo.vo.MemberVO"%>
<%@page import="kr.co.yomozomo.dao.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginOk.jsp</title>

</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	MemberDAO dao = new MemberDAO();

	MemberVO user = dao.isExists(id, pw);
	int mnum = dao.userNum(id);
	int admin = dao.checkAdmin(id, pw);

	if (user == null) {
		//로그인실패

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원정보를 다시 확인해주세요')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");

	} 
	else if(admin ==1 ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../admin/main/main.jsp'");
		script.println("</script>");
		session.setAttribute("vo", user);
		session.setAttribute("userNum", mnum);
	}
	else {
		//로그인 성공		

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../main/main.jsp'");
		script.println("</script>");


		session.setAttribute("vo", user);
		session.setAttribute("userNum", mnum);
	}
	%>



</body>
</html>