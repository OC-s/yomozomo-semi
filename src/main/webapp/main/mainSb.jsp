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
    
    <link rel="stylesheet" href="../css/mainSb.css"/>
    
  </head>

  <body>
 <!--  <strong>🥇 이주의 인기 콘텐츠 BEST 🥇</strong> -->
  		 
  		 <div class="s_title">
  		 	<strong>이 달의 픽! 📌 조회수 TOP 4</strong>
         </div>
        <%
        	/* 조회수 상위 4건  */
			OrderDAO dao = new OrderDAO();
			ArrayList<ProductVO> list = dao.selectHit();
			for(ProductVO vo : list){
				String pname = vo.getP_NAME();
				String pt = "../"+vo.getP_THUMBNAIL();
				if(pname.length()>15){
					pname = pname.substring(0,16)+"...";
				}
		%>
           	<div class="s_img">
             	<a href="../detail?id=<%= vo.getP_NUM()%>"><img class="s_img2" src="<%= pt%>" alt="<%= vo.getP_NAME()%>" /></a>
             	<p><%= pname %></p>
				<p>할인가 : <%= Math.round(vo.getP_PRICE()*(1-vo.getP_DISCOUNT()*0.01)) %> <span style="font-size: 12px" font >(<%= vo.getP_DISCOUNT() %>% 할인)</span></p>
            </div>

		<%
			}
		%>		
		
  		 <div class="s_title" id="tt">
              <strong>🔥 특가할인 🔥 </strong>
         </div>
        <%
        	/* 할인율 상위 4건  */
			ArrayList<ProductVO> list2 = dao.selectDis();
			for(ProductVO vo : list2){
				String pname = vo.getP_NAME();
				String pt = "../"+vo.getP_THUMBNAIL();
				if(pname.length()>15){
					pname = pname.substring(0,16)+"..";
				}
		%>
           	<div class="s_img">
             	<a href="../detail?id=<%= vo.getP_NUM()%>"><img img class="s_img2" src="<%= pt%>" alt="<%= vo.getP_NAME()%>" /></a>
             	<p><%= pname %></p>
				<p>할인가 : <%= Math.round(vo.getP_PRICE()*(1-vo.getP_DISCOUNT()*0.01)) %> <span style="font-size: 12px">(<%= vo.getP_DISCOUNT() %>% 할인)</span></p>
            </div>

		<%
			}
		%>		
		
  		 <div class="s_title">
              <strong>장난감 HOT BEST 4 😋 </strong>
         </div>
        <%
        	/* 할인율 상위 4건  */
			ArrayList<ProductVO> list3 = dao.selectPc();
			for(ProductVO vo : list3){
				String pname = vo.getP_NAME();
				String pt = "../"+vo.getP_THUMBNAIL();
				if(pname.length()>15){
					pname = pname.substring(0,16)+"..";
				}
		%>
           	<div class="s_img">
             	<a href="../detail?id=<%= vo.getP_NUM()%>"><img img class="s_img2" src="<%= pt%>" alt="<%= vo.getP_NAME()%>" /></a>
             	<p><%= pname %></p>
				<p>할인가 : <%= Math.round(vo.getP_PRICE()*(1-vo.getP_DISCOUNT()*0.01)) %> <span style="font-size: 12px">(<%= vo.getP_DISCOUNT() %>% 할인)</span></p>
            </div>

		<%
			}
		%>		
          
  </body>
  </html>
  
  