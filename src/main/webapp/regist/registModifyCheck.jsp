<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
div#maindiv2{
	text-align: center;
	background-color: #eeeeee;
	position: relative;
	top: 110px;
	padding: 100px;
}
div#pw{
	position: relative;
	left: 480px;
	width: 300px;
}
</style>

</head>
<link rel="stylesheet" href="../css/main.css" />
<body>
<jsp:include page="../source/header.jsp"></jsp:include>
<%
Object obj = session.getAttribute("vo");

if(obj!=null){
%>
<div id="maindiv2">
<form action="checkOk.jsp" method="post">
	<span>비밀번호를 입력하세요</span>
<div id="pw" class="input-group mb-3">
  	<input type="password" class="form-control" name="pw" placeholder="비밀번호 입력" aria-label="Recipient's username" aria-describedby="button-addon2">
  	<button class="btn btn-outline-secondary" type="submit" id="button-addon2">확인</button>
</div>
</form>
</div>
<jsp:include page="../source/footer.jsp"></jsp:include>
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