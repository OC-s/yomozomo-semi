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

<style>
	.searchOk_table{

		margin-left:auto;
		margin-right:auto;
		margin-top: 30px;		
	}
	.searchOk_name,.searchOk_phone{
		width:300px;
		height:30px;
		margin-top: 5px;
		margin-bottom: 5px;
		border-radius:10px;
		border-color: silver;
	}	
	#searchOk_btn1{
		width:300px;
		height:50px;
		font-size:15px;
		font-weight:bold;
		border:solid 0px skyblue;
		border-radius:10px;
		background-color: skyblue;
		color: white;
		margin-top: 50px;
	}
	.searchOk_header{
		text-decoration:none;
		margin-top: 200px;
		font-size: 50px;
	}
	.searchOk_header>a{
		text-decoration:none;
		color:#0d6efd;
		font-weight: bold;

	}			

</style>

</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String phone = request.getParameter("phone");

	MemberDAO dao = new MemberDAO();

	MemberVO user = dao.searchOne(name, phone);

	if (user == null) {
		//로그인실패

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원정보를 다시 확인해주세요')");
		script.println("location.href = 'search.jsp'");
		script.println("</script>");

	} else {
	%>	
		
	<div style="text-align: center;">
	<div class="container">

		<div class="searchOk_header">
				<a href="../main/main.jsp"><span id="searchOk_logo">yomozomo</span></a>
		</div>
			<table class="searchOk_table">			
				<tr>
					<th>아이디 : <%=user.getID() %> </th>
				</tr>
				<tr>
					<th>비밀번호 : <%=user.getPASSWORD() %></th>
				</tr>
				<tr>
					<td colspan="2">
					<a href="login.jsp"><input type="button" value="로그인" id="searchOk_btn1" /></a>
					</td>
				</tr>								
			</table>		
	</div>
	</div>
		
		
	<%	
	}
	%>



</body>
</html>