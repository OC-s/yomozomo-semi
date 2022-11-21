
<%@page import="dao.ReviewService"%>
<%@page import="dao.StoreService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
StoreService s = new StoreService();
request.setAttribute("t", s);
ReviewService rs = new ReviewService();
request.setAttribute("rs", rs);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>yomozomo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous" />
<link rel="stylesheet" href="css/header.css" />
<link rel="stylesheet" href="css/store.css" />
<link rel="stylesheet" href="css/nav.css" />
<style>
main {
	margin: 30px 180px;
}
.star{
	position :relative;
	bottom : 2px;
	color: #F1C40F;
}
</style>
</head>
<body>

	<%@include file="/source/header.jsp"%>


	<nav>
		<div>
			<ul>
				<li><a href="store?category=전체" class="prod_cate">전체</a></li>
				<li><a href="store?category=사료" class="prod_cate">사료</a></li>
				<li><a href="store?category=간식" class="prod_cate">간식</a></li>
				<li><a href="store?category=건강관리" class="prod_cate">건강관리</a></li>
				<li><a href="store?category=장난감" class="prod_cate">장난감</a></li>
			</ul>
		</div>
	</nav>
	<main>
		<div class="total">
			총<span id="total_count">${count}개</span> 상품
		</div>


		<div class="product">
			
			<c:forEach var="p" items="${list}" begin="0" varStatus="st" >
				
					<div class="product__column">
						<div>
							<a href="detail?id=${p.num}"><img class="product__thumbnail"
								src="${p.thumbnail}" /></a>
						</div>
						<div>
							<div class="product__name">${p.name}</div>
						</div>
						<div>
							<c:set var="price" value="${p.price*(1-p.discount/100)}" />
							<span class="discount__rate">${p.discount}%</span> <span><fmt:formatNumber
									type="number" pattern="###,###,###,###,###,###"
									value="${price}" />원</span>
						</div>
						<div>
							
							<c:set var="rating" value="${rs.getRatingAvg(p.num)}"></c:set>
							
							<span class="star">★ </span><span><fmt:formatNumber value="${rating}" pattern="${(rating==0.0)?0:.0}" /> | </span>${t.getCountReview(p.num)}<span
								class="review__text">
								 </span>
						</div>
					</div>
				
			</c:forEach>
		</div>

	</main>
	<script>
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</body>
</html>
