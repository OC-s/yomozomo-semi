<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device=widht, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
</style>
<title>Insert title here</title>
<style>
 body{
 	margin: 0:
 }
 
 a{
  	text-decoration: none;
  	color: #2F3438;
  	padding-right: 30px;

 }
 
 .navbar_head{
 	display: flex;
 	justify-content: space-between;
 	align-items:center;
 	background-color:white;
 	padding: 8px 100px;
 	border-top: solid 1px #EAEDEF;
 	border-bottom: solid 1px #EAEDEF;
 	font-size: 20px;
 	font-weight: 500;
 	position: relative;
 	font-family: 'Do Hyeon', sans-serif;
 }
 .cate{
 	padding-bottom: 100px;
 }
 



</style>
</head>
<body>

<jsp:include page="commu_header.jsp"/>
<jsp:include page="commuNav.jsp"/>
			
		
	
	<div>
		<br /><br /><br /><br /><br /><br />	
		<jsp:include page="bestBoard.jsp" />				
		<br /><br /><br /><br /><br /><br /><br /><br /><br />
		<jsp:include page="recentBoard.jsp"/>				
	</div>
</body>

<jsp:include page="commu_footer.jsp"/>


</html> 