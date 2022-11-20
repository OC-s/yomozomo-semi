<%@page import="kr.co.yomozomo.vo.CommentsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.yomozomo.dao.CommentsDAO"%>
<%@page import="kr.co.yomozomo.vo.joinVO"%>
<%@page import="kr.co.yomozomo.vo.MemberVO"%>
<%@page import="kr.co.yomozomo.dao.MemberDAO"%>
<%@page import="kr.co.yomozomo.vo.BoardVO"%>
<%@page import="kr.co.yomozomo.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device=widht, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


<title>Insert title here</title>

<style>
.detail_img {
	width: 300px;
	height: 400px;
	margin-left: 25px;
	margin-top: 20px;
	margin-bottom: 50px;
}

.navbar_body {
	padding-top: 30px;;
	color: #2F3438;
	font-size: 20px;
	font-weight: bold;
	background-color: #f8f9fa;
}

.detail_contain {
	position: relative;
	top: 150px;
	width: 1000px;
	margin: auto;
}

.navbar_body>p {
	text-align: center;
}

.detail_ul1 {
	list-style: none;
}

.detail_ul2 {
	margin-top: 10px;
	list-style: none;
	font-weight: bold;
}

.detail_ul2>li {
	float: left;
	margin-right: 50px;
}

.detail_div2 {
	position: relative;
	top: 40px;
	border-radius: 20px 20px 20px 20px;
	padding-bottom: 100px;
}

.detail_div3 {
	position: relative;
	left: 80px;
	border-radius: 20px 20px 20px 20px;
}
</style>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");

	String no = request.getParameter("b_num");

	Object obj = session.getAttribute("vo");

	if (no != null) {

		int b_num = Integer.parseInt(no);

		//out.println(bno);

		BoardDAO dao = new BoardDAO();

		dao.raiseHits(b_num); //조회수를 1증가 시킨다

		joinVO vo = dao.joinOne(b_num);//게시물을 가져온다.

		//out.println(vo);
	%>
	<jsp:include page="commu_header.jsp" />
	<jsp:include page="commuNav.jsp" />
	<jsp:include page="pic_Nav.jsp" />




	<div class="detail_contain">
		<table class="table table-bordered">
			<tr>
				<th colspan="3" style="text-align: center;"><h3><%=vo.getB_TITLE()%></h3></th>
			</tr>
			<tr>
				<td style="text-align: left; font-weight: bold;"><%=vo.getNICKNAME()%></td>
				<td style="text-align: right;"><%=vo.getB_REGDATE()%></td>

			</tr>
			<tr>
				<td colspan="3" style="text-align: center; word-break:break-all;">
					<img src="<%=vo.getB_IMAGE()%>" alt="" class="detail_img" /><br /> <%=vo.getB_CONTENTS()%>
				</td>
			</tr>
		</table>
		<table class="table table-bordered" style="position: relative; top:5px; border: transparent" >
			<tr>
				<td colspan="3"><a href="pic.jsp"><input type="button"
						value="목록" class="btn btn-outline-secondary" /></a> 
		
		<%
		
			if (obj != null) {
				
				MemberVO log = (MemberVO) obj;

 				if (log.getM_NUM() == vo.getM_NUM()) {
 					
 		%> 
				 <a href="pic_modify.jsp?b_num=<%=vo.getB_NUM()%>"><input
						type="button" value="수정" class="btn btn-outline-secondary"" /></a> 
				<a href="pic_deleteOk.jsp?b_num=<%=vo.getB_NUM()%>"><input
						type="button" value="삭제" class="btn btn-outline-secondary" /></a>
						
				</td>

		<%
						}
				}
		%>	
			</tr>
		</table>
	
		<jsp:include page="pic_comments.jsp" />
	</div>
			
	<%
	}
	%>
	
	<jsp:include page="commu_footer.jsp"/>


</body>
</html>