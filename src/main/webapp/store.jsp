
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

</style>
</head>
<body>

	<%@include file="/source/header.jsp" %>


	<nav>
		<div>
      <ul>
        <li>
          <a href="store?category=전체" class="prod_cate"
            >전체</a
          >
        </li>
        <li>
          <a href="store?category=사료" class="prod_cate"
            >사료</a
          >
        </li>
        <li>
          <a href="store?category=간식" class="prod_cate"
            >간식</a
          >
        </li>
        <li>
          <a href="store?category=건강관리" class="prod_cate" 
            >건강관리</a
          >
        </li>
        <li>
          <a href="store?category=장난감" class="prod_cate"
            >장난감</a
          >
        </li>
      </ul>
    </div>
	</nav>
	<main>
		<div class="total">총<span id="total_count">${count}개</span> 상품</div>
		<c:forEach var="p" items="${list}" varStatus="st" step="4">
		
		<div class="product">
			<div class="product__column">
				
				<div>
					<a href="detail?id=${list[st.index].num}"><img class="product__thumbnail" src="${list[st.index].thumbnail}" onmouseenter="zoomIn(event)" 
        onmouseleave="zoomOut(event)"/></a>
				</div>
				<div>
					<div  class="product__name">${list[st.index].name}</div>
				</div>
				<div>
					<span class="discount__rate">${list[st.index].discount}%</span> <span><fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${list[st.index].price}" />원</span>
				</div>
				<div>
					<span class="star">★</span><span >4.7 |</span><span class="review__text"> 후기${t.getCountReview(list[st.index].num)} </span>
				</div>
			</div>
			<div class="product__column">
				<div>
					<a href="detail?id=${list[st.index+1].num}"><img class="product__thumbnail" src="${list[st.index+1].thumbnail}"  onmouseenter="zoomIn(event)" 
        onmouseleave="zoomOut(event)"/></a>
				</div>
				<div>
					<div class="product__name">${list[st.index+1].name}</div>
				</div>
				<div>
					<span class="discount__rate">${list[st.index+1].discount}%</span> <span><fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${list[st.index+1].price}" />원</span>
				</div>
				<div>
					<span class="star">★</span><span >4.7 |</span><span class="review__text"> 후기${t.getCountReview(list[st.index+1].num)}</span>
				</div>
			</div>
			<div class="product__column">
				<div>
					<a href="detail?id=${list[st.index+2].num}"><img class="product__thumbnail" src="${list[st.index+2].thumbnail}" onmouseenter="zoomIn(event)" 
        onmouseleave="zoomOut(event)"/></a>
				</div>
				<div>
					<div class="product__name">${list[st.index+2].name}</div>
				</div>
				<div>
					<span class="discount__rate">${list[st.index+2].discount}%</span> <span><fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${list[st.index+2].price}" />원</span>
				</div>
				<div>
					<span class="star">★</span><span >4.7 |</span><span class="review__text"> 후기${t.getCountReview(list[st.index+2].num)}</span>
				</div>
			</div>
			<div class="product__column">
				<div>
					<a href="detail?id=${list[st.index+3].num}"><img class="product__thumbnail" src="${list[st.index+3].thumbnail}" onmouseenter="zoomIn(event)" 
        onmouseleave="zoomOut(event)"/></a>
				</div>
				<div>
					<div class="product__name">${list[st.index+3].name}</div>
				</div>
				<div>
					<span class="discount__rate">${list[st.index+3].discount}%</span> <span><fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${list[st.index+3].price}" />원</span>
				</div>
				<div>
					<span class="star">★</span><span >4.7 |</span><span class="review__text"> 후기${t.getCountReview(list[st.index+3].num)}</span>
				</div>
			</div>
		</div>
		</c:forEach>

	</main>
	<script>


	function zoomIn(event) {
	      event.target.style.transform = "scale(1.05)"; //1.05배 확대
	      event.target.style.zIndex = 1;
	      event.target.style.transition = "all 0.5s";// 속도
	    }
	  
	    function zoomOut(event) {
	      event.target.style.transform = "scale(1)";
	      event.target.style.zIndex = 0;
	      event.target.style.transition = "all 0.5s";
	    }
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</body>
</html>
