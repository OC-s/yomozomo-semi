
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
<style>
.violet {
	border-bottom: 4px solid blueviolet;
	color: blueviolet;
}
.information__text a{
	font-weight: 600;
}
.review__scope{
  margin: 0px 40px 20px 40px;
  height: 200px;
  border: 1px solid rgba(0,0,0,0.2);
  display: flex;
  justify-content: center;  
}
.review__scope__column{
  margin: 20px;
}
.star-rating {
  width: 304px;
}
.star-rating,
.star-rating span {
  display: inline-block;
  height: 55px;
  overflow: hidden;
  background: url(image/star.png) no-repeat;
}
.star-rating span {
  background-position: left bottom;
  line-height: 0;
  vertical-align: top;
}
.review__scope__column:first-child{
  display: flex;
  flex-direction: column;
}
.review__rating{
  margin-left: 140px;
  margin-bottom: 10px;
  font-weight: 800;
  font-size: 25px;
}
.review__scope__column:nth-child(2){
  margin-top: 30px;
}
.review__images{
  display: flex;
  margin:0px 40px ;
  justify-content: flex-start;

}
.review__image{
  width: 100%;
  height: 200px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous" />
<link rel="stylesheet" href="css/detail-header-nav.css" />
<link rel="stylesheet" href="css/nav.css" />
<link rel="stylesheet" href="css/detail-main.css" />
<link rel="stylesheet" href="css/detail-footer.css" />

</head>
<body>
<%@include file="/source/header.jsp" %>
	<!-- 
	<header class="header">
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
				<a href="./cart/viewCart.jsp"> <span class="material-symbols-outlined">
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
	<nav>
		<div>
			<form action="store?category=" method="get">
				<li>
					<ul>
						<input class="prod_cate" type="submit" value="전체" name="category" />
					</ul>
					<ul>
						<input class="prod_cate" type="submit" value="사료" name="category" />
					</ul>
					<ul>
						<input class="prod_cate" type="submit" value="간식" name="category" />
					</ul>
					<ul>
						<input class="prod_cate" type="submit" value="건강관리"
							name="category" />
					</ul>
					<ul>
						<input class="prod_cate" type="submit" value="장난감" name="category" />
					</ul>
				</li>
			</form>
		</div>
	</nav>

	<main>
		
		<c:set var="price" value="${product.price*(1-product.discount/100)}" />
		<div class="product-detail">
			<div class="product-detail__image">
				<div class="product__category">
					고양이 > 스토어 > <span>${product.category}</span> > <span>${product.name}</span>
				</div>
				<img id="product-image" src="${product.thumbnail}" alt="" />
			</div>
			<form action="./cart/cart.jsp">
			<input type="hidden" name="pnum" value="${product.num}" />
				<div class="product-detail__info">
					<div class="product__name" >${product.name}</div>
					<div class="product__review">
						<span>별점/</span><span>후기</span>
					</div>
					<div class="product__discount">
						<span id="discount">${product.discount}%</span>
						<del>
							<fmt:formatNumber type="number" pattern="###,###,###,###,###,###"
								value="${product.price}" />
							원
						</del>
					</div>
					<div class="product__price">
						<fmt:formatNumber type="number" pattern="###,###,###,###,###,###"
							value="${price}" />
						원
					</div>
					<div class="product__safe">
						<div class="product__leaf">
							<img class="image--small" src="image/leaf.png" />
						</div>
						<div></div>
						본 상품은 유통기한 책임제 상품이며,<br /> 요모조모에서 100% 정품임을<br /> 보증합니다.안심하시고
						급여하세요!
					</div>
					<div class="product__delivery">
						<div class="prdocut__deli">
							<img class="image--small" src="image/delivery.png" />
						</div>
						<div>
							배송료 <span id="free">무료!</span>
						</div>
					</div>
					<div class="product__cancel">취소 / 교환 / 환불</div>
					<div class="product__count">
						<div class="product__count--num">
							<button class="num--op">-</button>
							<input id="num" name="num" type="text" value="1" min="0" />
							<button class="num--op">+</button>
						</div>
						<div>
							<div>총 상품금액</div>
							<div id="total">
								<div id="total-price">
									<fmt:formatNumber type="number"
										pattern="###,###,###,###,###,###" value="${price}" />
								</div>
								<span>원</span>
							</div>
						</div>
					</div>
					<input class="product__cart" type="submit" value="장바구니 담기" />
				</div>
			</form>
		</div>
	</main>
	<div id="main-line"></div>
	<div class="information__header" id="product-scroll">
		<div class="information">
			<div class="information__text">
				<a href="#product-scroll" class="scroll_move">상품정보</a>
			</div>
			<div class="information__text">
				<a href="#qna-scroll" class="scroll_move">질문/답변</a>
			</div>
			<div class="information__text">
				<a href="#review-scroll" class="scroll_move">구매후기</a>
			</div>
			<div class="information__text">
				<a href="#cancel-scroll" class="scroll_move">취소/교환/반품 안내</a>
			</div>
		</div>
	</div>
	<div class="product">
		<div class="product__header">
			<div class="product__text">
				<span>상품정보</span>
			</div>
		</div>
		<img src="${product.image}" id="image__detail" />
	</div>
	<div id="qna-scroll"></div>
	<div class="qna">
		<div class="qna__header">
			<div class="qna__text">
				<span>질문/답변</span>
			</div>
			<a href="/yomozomo/product/qna?id=${product.num}"><button
					class="qna__btn-more">더보기 ></button></a>
		</div>
		<div class="line"></div>
		<c:set var="loop_flag" value="false" />
		<c:forEach var="a" items="${ans}" begin="0" end="3" varStatus="st">
			<div class="qna__main">
				<div class="qna__title">질문</div>
				<div class="qna__question">${a.title}</div>
				<div class="qna__title--answer">답변</div>
				<div class="qna__answer">${a.contents}</div>
				<c:if test="${st.index ==2}">
					<c:set var="loop_flag" value="true" />
				</c:if>

			</div>
		</c:forEach>
	</div>
	<div id="review-scroll"></div>
	<div class="review">
		<div class="review__header">
			<div class="review__text"><span>구매후기</span></div>
			<a href="/yomozomo/product/review?id=${product.num}"><button class="review__btn-more">리뷰작성 ></button></a>
		</div>
		<div class="review__scope">
        <div class="review__scope__column">
          <div class="review__rating">4.5</div>
          <div class="wrap-star">
            <div class="star-rating">
              <span style="width: 30%"></span>
            </div>
          </div>
        </div>

        <div class="review__scope__column">
          <div>
            <span>5점</span
            ><progress value="89.2" min="0" max="100"></progress>89.2%
          </div>
          <div>
            <span>4점</span
            ><progress value="10" min="0" max="100"></progress>10%
          </div>
          <div>
            <span>3점</span
            ><progress value="0.8" min="0" max="100"></progress>0.8%
          </div>
          <div>
            <span>2점</span><progress value="0" min="0" max="100"></progress>0%
          </div>
          <div>
            <span>1점</span><progress value="0" min="0" max="100"></progress>0%
          </div>
        </div>
      </div>
	  <div class="review__images">
	  	<c:forEach var="review" items="${review}" begin="0" end="6">
        <img class="review__image" src="${pageContext.request.contextPath}/upload/${review.image}" />
       	</c:forEach>
      </div>
		
      <div class="qna__main">
        <div class="qna__title">질문</div>
        <div class="qna__question">몇 g인가요?</div>
        <div class="qna__title--answer">답변</div>
        <div class="qna__answer">1캔 당 160g 입니다.</div>
      </div>
	</div>
	
	
	<div id="cancel-scroll"></div>
	<div class="cancel">
		<div class="cancel__header">
			<div class="cancel__text">
				<span>취소/교환/반품 안내</span>
			</div>
			<a href=""><button class="review__btn-more">더보기 ></button></a>
		</div>
		<div class="line"></div>
		<div class="cancel__main">
			<div class="cancel__title">
				<div class="cancel__can">취소</div>
			</div>
			<ul>입금하신 상품은 '입금대기, 입금완료' 단계에서만 취소가 가능합니다.
			</ul>
		</div>
	</div>

	<script>
		let num = Number(document.getElementById("num").value);
		let totalPrice = Number(document.getElementById("total-price").innerHTML);
		let price = ${price}
		
		const information_btn = $(".information__text");
	      for (let i = 0; i < $(".information__text").length; i++) {
	        information_btn.eq(i).on("click", function () {
	          information_btn.removeClass("violet");
	          information_btn.eq(i).addClass("violet");
	        });
	      }

		function priceToString(price) {
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}

		document.getElementsByClassName("num--op")[0]
				.addEventListener(
						"click",
						function(e) {
							e.preventDefault();

							if (num <= 0) {
								document.getElementById("num").value = 0;
								document.getElementById("total-price").innerHTML = 0;

							} else {
								num -= 1;
								document.getElementById("num").value = num;
								document.getElementById("total-price").innerHTML = priceToString(price
										* num);
							}
						});
		document.getElementsByClassName("num--op")[1]
				.addEventListener(
						"click",
						function(e) {
							e.preventDefault();
							num += 1;
							document.getElementById("num").value = num;
							document.getElementById("total-price").innerHTML = priceToString(price
									* num);
						});
		var information = $(".information").offset().top;
		$(window).scroll(function() {
			var window = $(this).scrollTop();

			if (information <= window) {
				$(".information").addClass("fixed");
			} else {
				$(".information").removeClass("fixed");
			}
		});
		$(document).ready(function($) {
			$(".scroll_move").click(function(event) {
				event.preventDefault();

				$("html,body").animate({
					scrollTop : $(this.hash).offset().top
				}, 500);
			});
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
