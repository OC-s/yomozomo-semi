
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">
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
					<a href="/yomozomo/admin/main.jsp"><span id="yomozomo">yomozomo</span></a>
				</div>
				<div class="header__column">
					<div class="header__community">
						<a href="/yomozomo/community/community.jsp"><span class="header__text">커뮤니티</span></a>
						<div class="header__divider"></div>
						<a href="/yomozomo/store?category"><span class="header__text">스토어</span></a>
					</div>
				</div>
				
				<form action="/yomozomo/source/search.jsp" role="search" name="frm" onSubmit="return Checkform2()" method="post"  >
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
					<a href="/yomozomo/cart/viewCart.jsp"> <span class="material-symbols-outlined">
							shopping_cart </span></a>
					<div class="header__divider"></div>
					<a href="/yomozomo/login/logout.jsp"><span class="header__text2"><%= vo.getNAME()%> 로그아웃</span></a>
					<div class="header__divider"></div>
					<a href="/yomozomo/resources/adpage.jsp"><span class="header__text2">관리자 페이지</span></a>
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
				<a href="/yomozomo/main/main.jsp"><span id="yomozomo">yomozomo</span></a>
			</div>
			<div class="header__column">
				<div class="header__community">
					<a href="/yomozomo/community/community.jsp"><span class="header__text">커뮤니티</span></a>
					<div class="header__divider"></div>
					<a href="/yomozomo/store?category"><span class="header__text">스토어</span></a>
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
				<a href="/yomozomo/cart/viewCart.jsp"> <span class="material-symbols-outlined">
						shopping_cart </span></a>
				<div class="header__divider"></div>
				<a href="/yomozomo/login/login.jsp"><span class="header__text2">로그인</span></a>
				<div class="header__divider"></div>
				<a href="/yomozomo/regist/regist.jsp"><span class="header__text2">회원가입</span></a>
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