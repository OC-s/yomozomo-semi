
<%@page import="java.util.List"%>
<%@page import="kr.co.yomozomo.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YOMOZOMO</title>
<style>
html, body {
    margin: 0;
    padding: 0;
    height: 100%;
}

#body-wrapper {
    position: relative;
    min-height: 100%;
    padding-bottom: 330px;
}


a{
    text-decoration: none;
    color: black;
}

a>span{
	color: black;
}
a>div{
	color: black;
}

#yomozomo{
    font-weight: 800;
    font-size: 22px;
}


.header{
    box-sizing: border-box;
    width: 100%;
}
.header-bar {
    position: fixed;
    box-sizing: border-box;
    display: flex;
    width: 100%;
    margin-right: 200px;
    justify-content: center;
    background-color: wheat;
    top: 0;
    border-bottom: 1px solid rgba(82, 82, 82, 0.445);
    z-index: 100;
}
.header__community {
    display: flex;
}
.header__community span,
.header__column span {
    margin-right: 10px;
}
.header__column{
    display: flex;
    align-items: center;
    margin-right: 30px;
}
.header__column:first-child a{
    margin-bottom: 14px;
}
.input-group{
    margin-left: 40px;
    margin-right: 40px;
    top: 3px;
    margin-top: 10px;
}
.header__divider{
    height: 20px;
    background-color: rgba(0,0,0,0.2);
    width: 1px;
    margin-right: 7px; 
}
.header__text{
    font-weight: 800;
    font-size: 12px;
}
.header__text2{
    font-weight: 800;
    font-size: 10px;
}


/* --------------------------------------------------------- */

#main{
    margin-top: 35px;
    display: flex;
    flex-direction: column;
    height: 100%;
    width: 100%;
    margin-right: 200px;
}



#icon{
    display: flex;
    justify-content: center;
    margin: 40px;
    margin-bottom: 11px;

}

.icon_div{
    text-align: center;
    padding-right: 35px;
}
.icon_img>img{
    width: 90px;
    height: 77px; 
}

.s_header{
    border-radius: 10px;
    height: 100%;
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    flex-wrap: wrap;
    align-content: center;
} 


</style>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
    crossorigin="anonymous"
    ></script>
    <link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">

	
/* 	$(function(){
		$("#button-addon2").on("click", function(){
			if($("#txt").val() == ""){
				$("#txt").focus();
				alert('상품명을 입력해주세요');
			} else {
				document.frm.action = "../source/search.jsp";
				document.frm.method="get";
				document.frm.submit();
				
			}
		})
	}) */

 	function Checkform2(){
	 	if(txt.value ==""){
	 		txt.focus();
			alert('상품명을 입력해주세요');
			return false
		}
	} 
</script>



</head>
<body>
	
	<%
		Object obj = session.getAttribute("vo");
	
		if(obj!=null){
			MemberVO vo = (MemberVO)obj;
	%>
	
	<!-- 로그인성공시  -->
			<header class="header">
			<!-- header bar start-->
			<div class="header-bar">
				<div class="header__column">
					<a href="../main/main.jsp"><span id="yomozomo">yomozomo</span></a>
				</div>
				<div class="header__column">
					<div class="header__community">
						<a href="../community/community.jsp"><span class="header__text">커뮤니티</span></a>
						<div class="header__divider"></div>
						<a href="../store?category"><span class="header__text">스토어</span></a>
					</div>
				</div>
				
				<form action="../source/search.jsp" role="search" name="frm" onSubmit="return Checkform2()" method="post"  >
				<div class="header__column">
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="txt" id="txt"
							aria-label="Recipient's username" aria-describedby="button-addon2" />
						<button class="btn btn-outline-secondary" type="submit"
						 	value="검색" id="button-addon2">검색</button>
						</form>
					</div>
				</div>
				<div class="header__column">
					<a href="../cart/cart.jsp"> <span class="material-symbols-outlined">
							shopping_cart </span></a>
					<div class="header__divider"></div>
					<a href="../login/logout.jsp"><span class="header__text2"><%= vo.getNAME()%> 로그아웃</span></a>
					<div class="header__divider"></div>
					<a href="../regist/regist.jsp"><span class="header__text2">회원가입</span></a>
					<div class="header__divider"></div>
					<a href="#"><span class="header__text2">고객센터</span></a>
				</div>
			</div>
		</header>
		<!-- header bar end-->
	<%
		
		}else {
			
	%>
	
	<!-- 로그인실패시  -->
	<header class="header">
		<!-- header bar start-->
		<div class="header-bar">
			<div class="header__column">
				<a href="../main/main.jsp"><span id="yomozomo">yomozomo</span></a>
			</div>
			<div class="header__column">
				<div class="header__community">
					<a href="../community/community.jsp"><span class="header__text">커뮤니티</span></a>
					<div class="header__divider"></div>
					<a href="../store?category"><span class="header__text">스토어</span></a>
				</div>
			</div>
			<form action="../source/search.jsp" role="search"  name="frm" onSubmit="return Checkform2()" method="post"  >
				<div class="header__column">
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="txt" id="txt"
							aria-label="Recipient's username" aria-describedby="button-addon2" />
						<button class="btn btn-outline-secondary" type=""
						 	value="검색" id="button-addon2">검색</button>
						</form>
					</div>
				</div>
			<div class="header__column">
				<a href="../cart/cart.jsp"> <span class="material-symbols-outlined">
						shopping_cart </span></a>
				<div class="header__divider"></div>
				<a href="../login/login.jsp"><span class="header__text2">로그인</span></a>
				<div class="header__divider"></div>
				<a href="../regist/regist.jsp"><span class="header__text2">회원가입</span></a>
				<div class="header__divider"></div>
				<a href="#"><span class="header__text2">고객센터</span></a>
			</div>
		</div>
	</header>
	<!-- header bar end-->
	
	<%
		}
	%>
	


</body>
</html>