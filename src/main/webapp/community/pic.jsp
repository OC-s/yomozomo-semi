<%@page import="kr.co.yomozomo.vo.joinVO"%>
<%@page import="kr.co.yomozomo.dao.MemberDAO"%>
<%@page import="kr.co.yomozomo.vo.MemberVO"%>
<%@page import="kr.co.yomozomo.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.yomozomo.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device=widht, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<title>Insert title here</title>

<style>
	#pic_div{
		width: 1000px;
		margin: auto;
	}
	/* .contents{
		align-items:center;
		width: 280px;
		height: 200px;
	} */
	
	.navbar_body > p{
		text-align: center;
	}
	.wrap{
	position:relative;
	top:100px;
		width: 300px;
		height: 400px;
		float: left ;
		border: 1px solid silver;
		padding: 10px;
		margin-top: 50px;
		margin-bottom: 50px;
		margin-left: 30px;
	}
	.pic_info{
		font-weight: bold;
		text-align: left;
	}
	.navbar_body{
		padding-top:30px;;
		color: #2F3438;
		font-size: 20px;
 		font-weight: bold;
		background-color:#f8f9fa;
	}
	.pic_img{
		margin-top:0px;
		width: 280px;
		height: 330px;
	}
	.pic_table{
		position:relative;
		top:100px;
		margin-left:auto;
		margin-right:auto;
		margin-top: 30px;		
	}
	#pic_btn{
		position:relative;
		left:450px;
		width:60px;
		height:30px;
		font-size:12px;
		font-weight:bold;
		border:solid 0px skyblue;
		border-radius:10px;
		background-color: skyblue;
		color: white;
	}


</style>
</head>
<body>
	

		<%		
			int startNo3 = 0;
			int endNo3 = 0;
			int currentPage = 0;
			int currentBlock = 0;
			int totalCount = 0;
			int totalPage = 0;
			int recoredPerPage = 0;
			int startPage = 0;
			int endPage = 0;
			
			//현재 페이지
			String cp = request.getParameter("cp");
			if(cp!=null){
				currentPage = Integer.parseInt(cp);
			}else { 
				currentPage = 1;
			}
			
			//1페이지당 게시물 수		
			recoredPerPage = 6;
			
			//게시물 시작번호와 끝번호 계산
			//현재 페이지가 1이면
			//시작 번호 : 1 부터 끝번호 : 10
			
			//현재 페이지가 2이면
			//시작번호 11부터 끝번호 20
			startNo3 = (currentPage-1)*recoredPerPage+1;
			//int endNo = currentPage*recoredPerPage;
			endNo3 = 6;
				
			//총게시물수
			BoardDAO dao = new BoardDAO();
			
			totalCount = dao.getTotal();
			
			//총 페이지
			totalPage = (totalCount % recoredPerPage == 0)?totalCount/recoredPerPage : totalCount/recoredPerPage +1  ;
			
			//시작페이지 번호	
			 startPage = 1;
			
			//끝페이지 번호
			endPage = totalPage;
			
			//시작페이지 미세조정
			if(currentPage <= 5){
				startPage = 1;
			}else if(currentPage >=6){
				startPage = currentPage -4;
			}
			
			//끝페이지 미세조정
			if(totalPage - currentPage <=5){
				endPage = totalPage;
			}else if(totalPage - currentPage > 5){
				if(currentPage <=5){
					if(totalPage>10){
						endPage = 10;
					}else{
						endPage = totalPage;
					}
				}else{
					endPage = currentPage+4;
				}
			}		
		%>

	<%
	/* Object obj = session.getAttribute("user"); */
	%>
		
	<jsp:include page="../source/header.jsp"/>
	<jsp:include page="commuNav.jsp"/>
	<jsp:include page="pic_Nav.jsp"/>
 	
 	<%
		Object obj = session.getAttribute("vo");
		if(obj != null){
			MemberVO vo = (MemberVO)obj;			
		
	%>
 	<table class="pic_table">
 		<tr>
 			<td>
			<a href="pic_write.jsp"><input type="button" value="자랑하기" id="pic_btn" /></a>					
 			</td>
 		</tr>
 	</table>	
 	<%
 	}
 	%>
 	
 	<div id="pic_div">	
		
		<%	
			ArrayList<joinVO> list = dao.joinAll(startNo3,endNo3);
			for(joinVO vo : list){
				/* String contents = jboardvo.getB_CONTENTS();
				if(contents.length()>7){
					contents = contents.substring(0,7)+"...";
				} */
				
		%>	
		<div class="wrap" >	
			<div class="pic_info">
				<p><%=vo.getNICKNAME() %></p>		
			</div>			
			<a href="pic_detail.jsp?b_num=<%=vo.getB_NUM() %>">
			<img src=<%=vo.getB_IMAGE() %> alt="" class="pic_img"/>
			</a>
		</div>
		
		<% 								
			}
		%>
		
	</div>
		
	<div class="pic_container">
		<table class="table table-bordered" style="position: relative; top:150px; border: transparent;" >
			<tr>
				<td colspan="4">				
					<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					  	<%
					  		if(startPage == 1){
					  			
					  	%>					  
					    <li class="page-item"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
					    <%
					  		} else {
					    %>					    
					     <li class="page-item"><a class="page-link" 
					     href="pic.jsp?cp=<%=startPage - 1%>" tabindex="-1" aria-disabled="true">Previous</a></li>
					    <%
					  		}
					    %>
					    <%
							for(int i = startPage; i<=endPage; i++){							
						%>
					    		<li class="page-item"><a class="page-link" href="pic.jsp?cp=<%=i%>"><%=i%></a></li>
					  	<%
							}
					  	%>
					  	<%
					  		if(totalPage == endPage){
					  	%>
					    <li class="page-item disalbed "><a class="page-link" href="#">Next</a></li>
					    <%
					  		}else {
					    %>
					    <li class="page-item">
					    	<a class="page-link" href="pic.jsp?cp=<%=endPage + 1%>">Next</a></li>	
					    <%
					  		}
					    %>
					  </ul>
					</nav>				
				</td>
			</tr>			
		</table>
	</div>
	

</body>
</html>