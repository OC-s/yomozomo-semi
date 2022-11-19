<%@page import="java.io.PrintWriter"%>
<%@page import="kr.co.yomozomo.vo.MemberVO"%>
<%@page import="kr.co.yomozomo.dao.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
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

	if (user == null) {
		//로그인실패

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원정보를 다시 확인해주세요')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");

	} else {
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