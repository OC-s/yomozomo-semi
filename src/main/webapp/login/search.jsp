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
	.search_table{
		margin-left:auto;
		margin-right:auto;
		margin-top: 30px;		
	}
	.search_name,.search_phone{
		width:300px;
		height:30px;
		margin-top: 5px;
		margin-bottom: 5px;
		border-radius:10px;
		border-color: silver;
	}	
	#search_btn1{
		width:370px;
		height:50px;
		font-size:15px;
		font-weight:bold;
		border:solid 0px skyblue;
		border-radius:10px;
		background-color: skyblue;
		color: white;
		margin-top: 50px;
	}
	.search_header{
		text-decoration:none;
		margin-top: 200px;
		font-size: 50px;
	}
	.search_header>a{
		text-decoration:none;
		color:#0d6efd;
		font-weight: bold;
	}			
	#email-send{
		border-radius:5px;
		border:none;
		background-color: skyblue;
		color: white;
	}
</style>

</head>
<body>
	
	<div style="text-align: center;">
	<div class="container">

		<div class="search_header">
				<a href="../main/main.jsp"><span id="search_logo">yomozomo</span></a>
		</div>
		
			<table class="search_table">			
				<tr>
					<form action="/yomozomo/login/search/email">
					<th><input type="text" class="search_name" name="email" id="email" placeholder="email" /></th>
					<th><input type="submit" value="보내기" id="email-send"/></th>
					</form>
				</tr>
				
				<tr>
					
					<th><input type="text" class="search_phone" name="userNum" id="number" placeholder="인증번호" /></th>
				</tr>
				<tr>
					<td colspan="4">
					<input type="submit" value="찾기" id="search_btn1" />
					</td>
				</tr>								
			</table>	
		
	</div>
	</div>

	<script>
	const num = ${num}
	let email="${email}"
	
	
	document.getElementById("search_btn1").addEventListener('click',function(){
		const userNum = document.getElementById("number").value;
		if(num == userNum){
			alert("인증성공"); 
			location.href="/yomozomo/login/searchEmail?email="+email;
		}
		else{
			alert("인증실패");
		}
	})
	</script>
</body>
</html>