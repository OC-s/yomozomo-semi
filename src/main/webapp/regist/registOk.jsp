
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/order2.css" />
<link rel="stylesheet" href="../css/footer.css" />
<style>
div#main{
	position: relative;
	top: 110px;
	background-color: #eeeeee;
	padding: 100px;
}
div#msg{
	text-align: center;
}
div#login{
	text-align: center;
}
div#footer{
	position: relative;
	top: 150px;
}
</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

String id=request.getParameter("id");
String email=request.getParameter("email1")+"@"+request.getParameter("email2");
String password=request.getParameter("pw");
String nickname=request.getParameter("nickname");
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String zipcode=request.getParameter("zipcode");
String address=request.getParameter("address");
String addrsDetail=request.getParameter("addrsDetail");

MemberDAO dao=new MemberDAO();
MemberVO vo=new MemberVO();
vo.setId(id);
vo.setEmail(email);
vo.setPassword(password);
vo.setNickname(nickname);
vo.setName(name);
vo.setPhone(phone);
vo.setZipcode(zipcode);
vo.setAddress(address);
vo.setAddrsDetail(addrsDetail);
dao.insertOne(vo);
dao.close();
%>
<jsp:include page="../layout/header.html"></jsp:include>
<div id="main">
	<div id="msg"><%=name %>님, 회원가입이 완료되었습니다.</div> <br />
	<div id="login"><a href="login.jsp">로그인 페이지로 돌아가기</a></div>
</div>
<jsp:include page="../layout/footer.html"></jsp:include>
</body>
</html>