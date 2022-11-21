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
       </div>

        
		<!-- main small 4배너 -->         
          <div class="s_header">
            <div class="s_img">
	         <%@ include file="mainSb.jsp" %>
            </div>
          </div>
          
    	
    	<!-- 푸터 -->
    	<%@ include file="/source/footer.jsp" %> 
    	
   	</div>
  </body>
  </html>
  
  