<%@page import="lombok.EqualsAndHashCode.Include"%>
<%@page import="kr.co.yomozomo.vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.yomozomo.dao.OrderDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
    crossorigin="anonymous"
    ></script>
    <link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
    <link rel="stylesheet" href="../css/main.css"/>
    
  </head>

  <body>
    <div id="body-wrapper">
    	<!-- 헤더, 메뉴바-->
    	<%@ include file="/source/header.jsp" %>
    	<%@ include file="/source/menubar.jsp" %>
    	
    	<!-- main 배너, 아이콘-->
        <div id="main">
        	<%@ include file="banner.jsp" %>
    		<%@ include file="icon.jsp" %>

          
   <%--        
        <%
			OrderDAO dao = new OrderDAO();
			ArrayList<ProductVO> list = dao.selectAll();
			for(ProductVO vo : list){
				String pname = vo.getP_NAME();
				String pt = "../"+vo.getP_THUMBNAIL();
				if(pname.length()>20){
					pname = pname.substring(0,20)+"...";
				}
			
		%>
			<form action="" name="frm">
				<input type="hidden" name="no" value="<%=vo.getP_NUM()%>" />
			</form>
			<div class="s_header">
	            <div class="s_title">
	              <strong>이 달의 픽! 📌 조회수 TOP 4</strong>
	            </div>
	            <div class="s_img">
	             	<a href="../detail?id=<%= vo.getP_NUM()%>"><img src="<%= pt%>" alt="<%= vo.getP_NAME()%>" /></a>
	             	<p><%= pname %></p>
					<p class = "del"><%= vo.getP_PRICE() %> / <%= vo.getP_DISCOUNT() %>%할인</p>
					<p>할인가 : <%= Math.round(vo.getP_PRICE()*(1-vo.getP_DISCOUNT()*0.01)) %></p>
	            </div>
          	</div>

		<%
			}
		%>		
		 --%>
          
          <div class="s_header">
            <div class="s_title">
              <strong>🥇 이주의 인기 콘텐츠 BEST 🥇</strong>
            </div>
            <div class="s_img">
              <a href="../detail?id=150"><img src="../image/d30.jpg" alt="임시"></a>
              <a href="../detail?id=28"><img src="../image/a28.jpg" alt="임시"></a>
              <a href="../detail?id=66"><img src="../image/b26.jpg" alt="임시"></a>
              <a href="../detail?id=110"><img src="../image/c30.jpg" alt="임시"></a>
            </div>
          </div>
          
          
          <div class="s_header">
            <div class="s_title">
              <strong>이 달의 픽! 📌 조회수 TOP 4</strong>
            </div>
            <div class="s_img">
              <a href="../detail?id=101"><img src="../image/c21.jpg" alt="임시"></a>
              <a href="../detail?id=91"><img src="../image/c11.jpg" alt="임시"></a>
              <a href="../detail?id=152"><img src="../image/d32.jpg" alt="임시"></a>
              <a href="../detail?id=52"><img src="../image/b12.jpg" alt="임시"></a>
            </div>
          </div>

          <div class="s_header">
            <div class="s_title">
              <strong>오늘의딜</strong>
            </div>
            <div class="s_img">
              <a href="../detail?id=1"><img src="../image/a01.jpg" alt="임시"></a>
              <a href="../detail?id=1"><img src="../image/a01.jpg" alt="임시"></a>
              <a href="../detail?id=1"><img src="../image/a01.jpg" alt="임시"></a>
              <a href="../detail?id=1"><img src="../image/a01.jpg" alt="임시"></a>
            </div>
          </div>

          <div class="s_header">
            <div class="s_title">
              <strong>조회수 TOP 4</strong>
            </div>
            <div class="s_img">
              <a href="../detail?id=62"><img src="../image/b22.jpg" alt="임시"></a>
              <a href="../detail?id=51"><img src="../image/b11.jpg" alt="임시"></a>
              <a href="../detail?id=71"><img src="../image/b31.jpg" alt="임시"></a>
              <a href="../detail?id=55"><img src="../image/b15.jpg" alt="임시"></a>
            </div>
          </div>
          <div class="s_header">
            <div class="s_title">
              <strong>리뷰 TOP 4</strong>
            </div>
            <div class="s_img">
              <a href="../detail?id=1"><img src="../image/a01.jpg" alt="임시"></a>
              <a href="../detail?id=1"><img src="../image/a01.jpg" alt="임시"></a>
              <a href="../detail?id=1"><img src="../image/a01.jpg" alt="임시"></a>
              <a href="../detail?id=1"><img src="../image/a01.jpg" alt="임시"></a>
            </div>
          </div>
        </div>
    	
    	<!-- 푸터 -->
    	<%@ include file="/source/footer.jsp" %>
    	
    </div> <!-- body-wrapper end -->
  </body>
  </html>
  
  