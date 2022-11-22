<%@page import="kr.co.yomozomo.vo.CmtjoinVO"%>
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
<title>Insert title here</title>

<meta name="viewport" content="width=device=widht, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
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

<script>

	$(function(){
		
		$("#moveBtn").on("click",function(){
			
			var offset = $("#preId").offset();
			
			$('html,body').animate({scrollTop:offset.top},2000);
			
		});		
	});

</script>
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
	<jsp:include page="commu_header.jsp"/>
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

 				if (log.getM_NUM() == vo.getM_NUM() || log.getM_NUM()==9) {
 					
 		%> 
				 <a href="pic_modify.jsp?b_num=<%=vo.getB_NUM()%>"><input
						type="button" value="수정" class="btn btn-outline-secondary" /></a> 
				<a href="pic_deleteOk.jsp?b_num=<%=vo.getB_NUM()%>"><input
						type="button" value="삭제" class="btn btn-outline-secondary" /></a>
						
				</td>

		<%
						}
				}
		%>	
			</tr>
		</table>
		<form method="post" action="pic_comments_modifyOk.jsp" >
				<table class="table "
					style="text-align: center; border: 1px solid #dddddd; position: relative; top:10px;">
					<%-- 홀,짝 행 구분 --%>
					<thead>
						<tr>
							<th colspan="7" style="background-color: #eeeeeee; text-align: center;">댓글</th>
						</tr>
					</thead>
					<tbody>
					
						<%
							CommentsDAO dao2 = new CommentsDAO();
							ArrayList<CmtjoinVO> list=dao2.joinAll();
							for(CmtjoinVO vo2 : list){
								
								
								if(vo.getB_NUM() == vo2.getB_NUM()){
							
						%>

						<tr>
							<td colspan="2" style="text-align: center; width: 100px; "><%= vo2.getNICKNAME() %>님</td>
							<td colspan="3" style="text-align: left; word-break:break-all"><%= vo2.getC_CONTENTS() %></td>							
							<td style="text-align: right; "><%= vo2.getC_REGDATE() %></td>
							
							
						<%
							
							if(obj!=null){
								
								MemberVO log = (MemberVO) obj;
							
								if(log.getM_NUM()==vo2.getM_NUM()){
							
						%>
							<td>
								<a href="pic_comments_modify.jsp?b_num=<%=vo2.getB_NUM() %>&c_num=<%=vo2.getC_NUM() %>" >
									<input type="button" value="[수정]" class="btn btn-default btn-xs" /></a>
								<a href="pic_comments_deleteOk.jsp?b_num=<%=vo2.getB_NUM() %>&c_num=<%=vo2.getC_NUM() %>" >
									<input type="button" value="[삭제]" class="btn btn-default btn-xs" /></a>					
							</td>
								
						<%
								}
							} 
						%>
						</tr>
					
						<%
								}
							}
						%>
						
						<% 
												
						
						String num = request.getParameter("c_num");
						
						if(num != null){
							
							int c_num = Integer.parseInt(num);
							
							CommentsDAO dao3 = new CommentsDAO();
							
							CommentsVO vo3 = dao3.selectOne(c_num);
						
						%>
						
					</tbody>
					</table>
					<table class="table "
					style="text-align: center; border: 1px solid #dddddd; position: relative; top:10px;">
						<tr>
						<td></td>
						<td colspan="3"><textarea class="form-control"
								name="contents" maxlength="2048" cols="100" ><%=vo3.getC_CONTENTS() %></textarea></td>
						<td><input type="hidden" name="writer" id="" value="<%=vo.getID() %>"/>
						<input type="hidden" name="m_num" id="" value="<%=vo.getM_NUM() %>"/>
						<input type="hidden" name="b_num" id="" value="<%=vo.getB_NUM() %>"/>
						<input type="hidden" name="c_num" id="" value="<%=vo3.getC_NUM() %>"/>
						</td>						
							<td><input type="submit" class="btn btn-outline-secondary" value="수정하기" style="margin-top: 10px; "></td>
							<td><a href="pic_detail.jsp?b_num=<%=vo.getB_NUM() %>" >
								<input type="button" value="취소" class="btn btn-outline-secondary" style="margin-top: 10px;" /></a>	</td>
						</tr>				
				</table>
			</form>
	
	</div>
			
	<%
		}
	}
	%>

	


</body>
</html>