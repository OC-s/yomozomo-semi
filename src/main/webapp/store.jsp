
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<style>
li {
	display: flex;
}

ul {
	margin: 10px;
}

.product__thumbnail {
	width: 250px;
	height: 180px;
	border: 1px solid rgba(0,0,0,0.1);
}

.product {
	display: flex;
	justify-content: space-around;
	margin: 40px 0px;	
}
.product__column{
	display: flex;
	flex-direction: column;
	justify-content: center;

}
main{
margin: 30px 100px;
}
.product__name{
	font-weight: 700;
	font-size: 12px;


}
input[type="submit"] {
        background-color: white;
        border: none;
      }
#total_count{
	font-weight: 800;
	margin-left: 5px;
}
.total{
	margin-left: 60px;
}
.discount__rate{
	color: red;
}
</style>
</head>
<body>

	<%@include file="/source/header.jsp" %>

<!-- 	<header class="header">
		header bar start
		<div class="header-bar">
			<div class="header__column">
				<a href="main/main.jsp"><span id="yomozomo">Yomozomo</span></a>
			</div>
			<div class="header__column">
				<div class="header__community">
					<a href="/yomozomo/community/community.jsp"><span class="header__text">커뮤니티</span></a>
					<div class="header__divider"></div>
					<a href="store?category="><span class="header__text">스토어</span></a>
				</div>
			</div>
			<div class="header__column">
				<div class="input-group mb-3">
					<input type="text" class="form-control"
						aria-label="Recipient's username" aria-describedby="button-addon2" />
					<button class="btn btn-outline-secondary" type="button"
						id="button-addon2">검색</button>
				</div>
			</div>
			<div class="header__column">
				<a href="/yomozomo/order/order.jsp?after"> <span class="material-symbols-outlined">
						shopping_cart </span></a>
				<div class="header__divider"></div>
				<a href="/yomozomo/login/login.jsp"><span class="header__text">로그인</span></a>
				<div class="header__divider"></div>
				<a href="/yomozomo/regist/regist.jsp"><span class="header__text">회원가입</span></a>
				<div class="header__divider"></div>
				<a href="#"><span class="header__text">고객센터</span></a>
			</div>
		</div>
	</header> -->
	<!-- header bar end-->
	<nav>
		<div>
			 <form action="?" method="get">
          <li>
            <ul>
              <input type="submit" value="전체" name="category"/>
            </ul>
            <ul>
              <input type="submit" value="사료" name="category" />
            </ul>
            <ul>
              <input type="submit" value="간식" name="category" />
            </ul>
            <ul>
              <input type="submit" value="건강관리" name="category" />
            </ul>
            <ul>
              <input type="submit" value="장난감" name="category" />
            </ul>
          </li>
        </form>
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
					<span>별점</span> <span>후기</span>
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
					<span>별점</span> <span>후기</span>
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
					<span>별점</span> <span>후기</span>
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
					<span>별점</span> <span>후기</span>
				</div>
			</div>
		</div>
		</c:forEach>

	</main>
	<script>
	const user = 

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
