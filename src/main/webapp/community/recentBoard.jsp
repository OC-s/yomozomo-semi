<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.yomozomo.dao.BoardDAO"%>
<%@page import="kr.co.yomozomo.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device=widht, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
$(function(){
	
	$('.mainSlide').slick({
		  infinite: true,
		  slidesToShow: 3,
		  slidesToScroll: 3
		});
})
</script>
<style>
	#recentBoard_container{
		width: 1500px;
		margin: auto;
	}
	
	.slick-slide{
		position: relative;
		left: 200px;
		margin-left: -20px;
	}
	.mainSlide{
		position: relative;	
		top : 100px;
			
	}
	.mainSlide button{
		position: absolute;
		z-index: 10;
		top : 50%;
		transform:translateY(-50%);
		width: 30px;
		height: 30px;
		border: none;
		border-radius: 100%;
		background: rgba(0,0,0,.5);
	}
	.mainSlide button:before{
		font-family:'xeicon';
		color:#fff;
		font-size:20px;
	}
	
	.slick-prev{
		left : 50px;
		font-size: 0;
		color:transparent;
	}
	.slick-prev:before{
		content:"\e93d";
	}	
	.slick-next{
		right: 50px;
		font-size: 0;
		color:transparent;	
	}
	.slick-next:before{
		content:"\e940";	
	}
	
 	.best{
		position :relative;
		top:50px;
		padding: 8px 100px;
		font-weight: bold;
		text-decoration: none;
		color:black;
	}
	.recentBoard_img{
		border-radius: 10%;
		position:relative;
		right:80px;
		width: 300px;
		height: 400px;
	}
	
</style>
</head>
<body>	
	<%	
		int startNo = 0;
		int endNo = 0;
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
		recoredPerPage = 5;
		
		startNo = (currentPage-1)*recoredPerPage+1;
		
		endNo = 5;
			
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
	
	<div id="recentBoard_container">
		<a href="pic.jsp" class="best">최근 올라온 게시판 &#x1F600;</a>
		<div class="mainSlide">	
			
		<%					
				ArrayList<BoardVO> list = dao.selectAll(startNo,endNo);
				for(BoardVO vo : list){
		%>
							
				<div>
				<a style="text-decoration: none; color:black;" href="pic_detail.jsp?b_num=<%=vo.getB_NUM()%>">
				<img src=<%=vo.getB_IMAGE() %> alt="" class="recentBoard_img"/>
				<%=vo.getB_TITLE() %>
				</a>
				</div>								
										
		<% 
			}
		%>
		</div>
	</div>
</body>

</html>