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
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/qna.css" />
    <style>
    .wrap-star {
        width: 10%;
        height: 10%;
      }
      .inner-star::before {
        color: #ff9600;
      }
      .outer-star {
        position: relative;
        display: inline-block;
        color: #cccccc;
      }
      .inner-star {
        position: absolute;
        left: 0;
        top: 0;
        width: 0%;
        overflow: hidden;
        white-space: nowrap;
      }
      .outer-star::before,
      .inner-star::before {
        content: "\f005 \f005 \f005 \f005 \f005";
        font-family: "Font Awesome 5 free";
        font-weight: 900;
      }
    	#file{
    		background-color: white;
    	}
    fieldset {
      display: inline-block;
      direction: rtl;
      border: 0;
      font-size: 15px;
      margin-left: 10px;
      font-weight: 800;
    }
    fieldset legend {
      text-align: right;
    }
    input[type="radio"] {
      display: none;
    }
    label {
      font-size: 3em;
      color: transparent;
      text-shadow: 0 0 0 #f0f0f0;
    }
    label:hover {
      text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    label:hover ~ label {
      text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    input[type="radio"]:checked ~ label {
      text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
   
    </style>
  </head>
  <body class="body">
  <%@include file="/source/header.jsp" %>
    
    
    
    <!-- header bar end-->
    <div class="category">
      홈 > ${product.category} > ${product.name} > 구매후기
    </div>
    <c:set var="price"
			value="${product.price*(1-product.discount/100)}" />
    <div class="qna">
      <div><img src="${pageContext.request.contextPath}/${product.thumbnail}" alt="" /></div>
      <div class="qna__column">
        <div class="qna__title">${product.name}</div>
        <div class="qna__price"><fmt:formatNumber type="number" pattern="###,###,###,###,###,###"
							value="${price}" />
						원</div>
        <div class="qna__scope">별점 / 후기개수</div>
        <div class="qna__">
          <input type="${(check==false)?"hidden":"button"}" id="query-btn" value="리뷰작성">
          <c:if test="${check==false}">
          	<h4>상품 구매 후 리뷰작성 가능합니다.</h4>
          </c:if>
        </div>
      </div>
    </div>
    <div class="query-detail--hidden">
      <div class="query-detail">
        <form action="/yomozomo/product/review/rr" method="POST" enctype="multipart/form-data">
          <div class="query-detail__exit">
            <div class="query-detail__exit__title">상품리뷰</div>
            <div class="query-detail__exit-x">
              <button id="x-btn">X</button>
            </div>
          </div>
			
          <div class="query-detail__title">
            <input type="text" placeholder="리뷰 제목" name="title" />
          </div>
          <div id="id-hidden"><input type="text"  name="id" value="${id}"/></div>
          <div class="query-detail__content">
            <textarea
              name="contents"
              cols="30"
              rows="10"
              placeholder="리뷰 내용"
            ></textarea>
          </div>
          <div class="file">
          <input type="file" name="file" accept=".jpg"/>
          </div>
          <fieldset>
        <span class="text-bold">별점을 선택해주세요</span>
        <input type="radio" name="reviewStar" value="5" id="rate1" /><label
          for="rate1"
          >★</label
        >
        <input type="radio" name="reviewStar" value="4" id="rate2" /><label
          for="rate2"
          >★</label
        >
        <input type="radio" name="reviewStar" value="3" id="rate3" /><label
          for="rate3"
          >★</label
        >
        <input type="radio" name="reviewStar" value="2" id="rate4" /><label
          for="rate4"
          >★</label
        >
        <input type="radio" name="reviewStar" value="1" id="rate5" /><label
          for="rate5"
          >★</label
        >
      </fieldset>
          <div class="query-detail__secret">
            <span>
              <input type="checkbox" name="secret" value="Y"/>
            </span>
          </div>
          <div class="btn">
            <button id="x-btn2">취소</button>
            <button id="sumbit-btn">등록</button>
          </div>
        </form>
      </div>
    </div>

    <div class="review__main">
      <div class="review__column">
        <div class="RatingStar">
          <div class="RatingScore">
            <div class="outer-star"><div class="inner-star"></div></div>
          </div>
        </div>
      </div>
    </div>
    <c:forEach var="review" items="${review}">
    
    <div>
    	<div>${review.scope}</div>
    	<div>${review.contents}</div>
    	<img src="/yomozomo/uploadReview/${review.image}" />
    	
    </div>
    </c:forEach>

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
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
  </body>
</html>
