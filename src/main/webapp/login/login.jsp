<%@page import="kr.co.yomozomo.vo.MemberVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<meta name="viewport" content="width=device=widht, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	.login_table{
		margin-left:auto;
		margin-right:auto;
		margin-top: 30px;		
	}
	.login_id,.login_pw{
		width:300px;
		height:30px;
		margin-top: 5px;
		margin-bottom: 5px;
		border-radius:10px;
		border-color: silver;
	}	
	#login_btn1{
		width:300px;
		height:50px;
		font-size:15px;
		font-weight:bold;
		border:solid 0px skyblue;
		border-radius:10px;
		background-color: skyblue;
		color: white;
	}
	.login_header{
		text-decoration:none;
		margin-top: 200px;
		font-size: 50px;
	}
	.login_header>a{
		text-decoration:none;
		color:#0d6efd;
		font-weight: bold;

	}			
</style>

</head>
<body>
	
	<div style="text-align: center;">
	<div class="container">

		<div class="login_header">
				<a href="../main/main.jsp"><span id="login_logo">yomozomo</span></a>
		</div>
	<form action="loginOk.jsp" method="post" >
			<table class="login_table">			
				<tr>
					<th><input type="text" class="login_id" name="id" id="id" placeholder="아이디" /></th>
				</tr>
				<tr>
					<th><input type="password" class="login_pw" name="pw" id="pw" placeholder="비밀번호" /></th>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="로그인" id="login_btn1" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<a href="">아이디를 잃어버리셨나요?</a>ㅣ
					<a href="../regist/regist.jsp" id="login_btn2">회원가입</a>
					</td>
				</tr>				
			</table>	
		</form>
	</div>
	</div>
	
</body>
</html>