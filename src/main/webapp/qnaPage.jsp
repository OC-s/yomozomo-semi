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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/qna.css" />
    <style>
    
    </style>
  </head>
  <body class="body">
  <%@include file="/source/header.jsp" %>
    <!-- <header class="header">
      header bar start
      <div class="header-bar">
        <div class="header__column">
          <a href="/yomozomo/main/main.jsp"><span id="yomozomo">Yomozomo</span></a>
        </div>
        <div class="header__column">
          <div class="header__community">
            <a href="/yomozomo/community/community.jsp"><span class="header__text">커뮤니티</span></a>
            <div class="header__divider"></div>
            <a href="/yomozomo/store?category="><span class="header__text">스토어</span></a>
          </div>
        </div>
        <div class="header__column">
          <div class="input-group mb-3">
            <input
              type="text"
              class="form-control"
              aria-label="Recipient's username"
              aria-describedby="button-addon2"
            />
            <button
              class="btn btn-outline-secondary"
              type="button"
              id="button-addon2"
            >
              검색
            </button>
          </div>
        </div>
        <div class="header__column">
          <a href="/yomozomo/order/order.jsp?after">
            <span class="material-symbols-outlined"> shopping_cart </span></a
          >
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
    <div class="category">
      홈 > ${product.category} > ${product.name} > 질문답변
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
          <div id="id-hidden"><input type="text"  name="id" value="${id}"/></div>
          <div class="query-detail__content">
            <textarea
              name="contents"
              cols="30"
              rows="10"
              placeholder="문의 내용"
            ></textarea>
          </div>
          <div class="query-detail__secret">
            <span>비밀글 체크</span>
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

    <div class="line">
    
		<c:forEach var="a" items="${ans}" >
		<div class="qna__main">
			<div class="qna__title">질문</div>
			<div class="qna__question">${a.title}</div>
			<div class="qna__title--answer">답변</div>
			<div class="qna__answer">${a.contents}</div>
		</div>
		</c:forEach>
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
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
  </body>
</html>
