<%@page import="dao.StoreService"%>
<%@page import="dao.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
ReviewService service = new ReviewService();
request.setAttribute("s", service);

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/qna.css" />
<style>
.number {
	display: flex;
	align-items: center;
}

.number__ul {
	display: flex;
	margin: 20px 0px 20px 0px;
	padding: 0px;
}

.number__left {
	margin-right: 10px;
}
.number-wrap{
	display: flex;
	justify-content: center;
}

a {
	color: inherit;
}

li {
	list-style: none;
	margin-right: 10px;
	padding: 0px;
	font-size: 30px;
}
.arrow{
	font-weight: 800;
	font-size: 20px;
}
#star {
	position :relative;
	bottom : 2px;
	color: #F1C40F;
}
</style>
</head>
<body class="body">
	<%@include file="/source/header.jsp"%>

	<div class="category">홈 > ${product.category} > ${product.name} >
		질문답변</div>
	<c:set var="price" value="${product.price*(1-product.discount/100)}" />
	<div class="qna">
		<div>
			<a href="/yomozomo/detail?id=${product.num}"><img src="${pageContext.request.contextPath}/${product.thumbnail}"
				 /></a>
		</div>
		<div class="qna__column">
			<div class="qna__title">${product.name}</div>
			<div class="qna__price">
				<fmt:formatNumber type="number" pattern="###,###,###,###,###,###"
					value="${price}" />
				원
			</div>
			<div class="qna__scope">
			<c:set var="rating" value="${s.getRatingAvg(product.num)}"></c:set>
			<span id="star">★</span><span><fmt:formatNumber value="${rating}" pattern="${(rating==0.0)?0:.0}" /> / </span>
			<span>${t.getCountReview(product.num)}</span></div>
			<div class="qna__">
				<button id="query-btn">문의하기</button>
			</div>
		</div>
	</div>
	<div class="query-detail--hidden">
		<div class="query-detail">
			<form action="/yomozomo/product/qna/qq" method="POST">
				<div class="query-detail__exit">
					<div class="query-detail__exit__title">상품문의</div>
					<div class="query-detail__exit-x">
						<button id="x-btn">X</button>
					</div>
				</div>

				<div class="query-detail__title">
					<input type="text" placeholder="문의 제목" name="title" />
				</div>
				<div id="id-hidden">
					<input type="text" name="id" value="${id}" />
				</div>
				<div class="query-detail__content">
					<textarea name="contents" cols="30" rows="10" placeholder="문의 내용"></textarea>
				</div>
				<div class="query-detail__secret">
					<span> <input type="hidden"
						name="secret" value="Y" />
					</span>
				</div>
				<div class="btn">
					<button id="x-btn2">취소</button>
					<button id="sumbit-btn">등록</button>
				</div>
			</form>
		</div>
	</div>

	<div class="line">

		<c:forEach var="a" items="${ans}">
			<div class="qna__main">
				<div class="qna__title">질문</div>
				<div class="qna__question">${a.title}</div>
				<div>${a.qcontents}</div>
				<div class="qna__title--answer">답변</div>
				<div class="qna__answer">${a.acontents}</div>
			</div>
		</c:forEach>
	</div>
	
	<c:set var="page" value="${(empty param.p)?1:param.p}"></c:set>
	<c:set var="startNum" value="${page-(page-1)%5}"></c:set>
	<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10),'.')}"></c:set>

	<div class="number-wrap">
		<div class="number">
			<div class="number__left">
				<c:if test="${startNum >1}">
					<a href="?qna?id=${product.num}&p=${startNum-5}"><div><</div></a>
				</c:if>
				<c:if test="${startNum<=1}">
					<a href="?id=${product.num}&p=${startNum}" onclick="alert(이전 X)" class="arrow"><
					</a>
				</c:if>

			</div>
			<ul class="number__ul">
				<c:forEach var="i" begin="0" end="4">
					<a href="qna?id=${product.num}&p=${startNum+i}"><li >${startNum+i}</li></a>
				</c:forEach>
			</ul>
			<div class="number__right">
				<c:if test="${startNum +4 <lastNum}">
					<a href="qna?id=${product.num}&p=${startNum+5}"><div>></div></a>
				</c:if>
				<c:if test="${startNum+4>=lastNum }">
						<a href="qna?id=${product.num}&p=${startNum+4}" onclick="alert('다음 페이지가 없습니다.')" class="arrow">
							>

						</a>
				</c:if>
			</div>
		</div>
	</div>
	<script>

      
      document
        .getElementById("query-btn")
        .addEventListener("click", function () {
          document
            .getElementsByClassName("query-detail--hidden")[0]
            .classList.toggle("show");
          document.getElementsByClassName("body")[0].classList.toggle("black");
        });
      document.getElementById("x-btn").addEventListener("click", function (e) {
        e.preventDefault();
        document
          .getElementsByClassName("query-detail--hidden")[0]
          .classList.toggle("show");
        document.getElementsByClassName("body")[0].classList.toggle("black");
      });
      document.getElementById("x-btn2").addEventListener("click", function (e) {
        e.preventDefault();
        document
          .getElementsByClassName("query-detail--hidden")[0]
          .classList.toggle("show");
        document.getElementsByClassName("body")[0].classList.toggle("black");
      });
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</body>
</html>
