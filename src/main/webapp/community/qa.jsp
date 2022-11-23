<%@page import="kr.co.yomozomo.vo.QajoinVO"%>
<%@page import="kr.co.yomozomo.dao.MemberDAO"%>
<%@page import="kr.co.yomozomo.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.yomozomo.vo.QaboardVO"%>
<%@page import="kr.co.yomozomo.dao.QaboardDAO"%>
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
<link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
<title>Insert title here</title>
<style>
.qa_table {
	position: relative;
	top: 100px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
}

#qa_container {
	position: relative;
	top: 150px;
}

#qa_btn {
	position:relative;
	left:600px;
	width: 60px;
	height: 30px;
	font-size: 15px;
	font-weight: bold;
	color: #2F3438;
}
</style>
<link rel="stylesheet" href="../css/main.css" />
</head>
<body>

	<%
	int startNo2 = 0;
	int endNo2 = 0;
	int currentPage = 0;
	int currentBlock = 0;
	int totalCount = 0;
	int totalPage = 0;
	int recoredPerPage = 0;
	int startPage = 0;
	int endPage = 0;

	//현재 페이지
	String cp = request.getParameter("cp");
	if (cp != null) {
		currentPage = Integer.parseInt(cp);
	} else {
		currentPage = 1;
	}

	//1페이지당 게시물 수		
	recoredPerPage = 10;

	startNo2 = (currentPage - 1) * recoredPerPage + 1;
	
	endNo2 = 10;

	//총게시물수
	QaboardDAO dao = new QaboardDAO();

	totalCount = dao.getTotal();

	//총 페이지
	totalPage = (totalCount % recoredPerPage == 0) ? totalCount / recoredPerPage : totalCount / recoredPerPage + 1;

	//시작페이지 번호	
	startPage = 1;

	//끝페이지 번호
	endPage = totalPage;

	//시작페이지 미세조정
	if (currentPage <= 5) {
		startPage = 1;
	} else if (currentPage >= 6) {
		startPage = currentPage - 4;
	}

	//끝페이지 미세조정
	if (totalPage - currentPage <= 5) {
		endPage = totalPage;
	} else if (totalPage - currentPage > 5) {
		if (currentPage <= 5) {
			if (totalPage > 10) {
		endPage = 10;
			} else {
		endPage = totalPage;
			}
		} else {
			endPage = currentPage + 4;
		}
	}
	%>
	<jsp:include page="../source/header.jsp"/>
	<jsp:include page="commuNav.jsp" />
	<jsp:include page="qa_Nav.jsp" />

	<%
	Object obj = session.getAttribute("vo");
	if (obj != null) {
		MemberVO vo = (MemberVO) obj;
	%>


	<table class="qa_table">
		<tr>
			<td>
			<a href="qa_write.jsp" id="qa_btn">물어보기&#x270D;</a>
			</td>
		</tr>
	</table>
	<%
	}
	%>



	<div class="container">
		<div class="row">
			<table class="table table-bordered"
				style="position: relative; top: 100px; text-align: center; border: 1px solid #dddddd; margin-top: 50px;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center; width: 800px;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<%
				ArrayList<QajoinVO> list = dao.joinAll(startNo2, endNo2);
				for (QajoinVO vo : list) {
				%>

				<tbody>
					<tr>
						<td><a style="color:black; " href="qa_detail.jsp?qab_num=<%=vo.getQAB_NUM()%>"><%=vo.getQAB_NUM()%></a></td>
						<td><a style="color:black; " href="qa_detail.jsp?qab_num=<%=vo.getQAB_NUM()%>"><%=vo.getQAB_TITLE()%></a></td>
						<td><%=vo.getNICKNAME()%></td>
						<td><%=vo.getQAB_REGDATE()%></td>
					</tr>
				</tbody>
				<%
				}
				%>
			</table>
		</div>
	</div>

	<div class="container" id="qa_container">
		<table class="table table-bordered" style="border: transparent;">
			<tr>
				<td colspan="4">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<%
							if (startPage == 1) {
							%>
							<li class="page-item"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>
							<%
							} else {
							%>
							<li class="page-item"><a class="page-link"
								href="qa.jsp?cp=<%=startPage - 1%>" tabindex="-1"
								aria-disabled="true">Previous</a></li>
							<%
							}
							%>
							<%
							for (int i = startPage; i <= endPage; i++) {
							%>
							<li class="page-item"><a class="page-link"
								href="qa.jsp?cp=<%=i%>"><%=i%></a></li>
							<%
							}
							%>
							<%
							if (totalPage == endPage) {
							%>
							<li class="page-item disalbed "><a class="page-link"
								href="#">Next</a></li>
							<%
							} else {
							%>
							<li class="page-item"><a class="page-link"
								href="qa.jsp?cp=<%=endPage + 1%>">Next</a></li>
							<%
							}
							%>
						</ul>
					</nav>
				</td>
			</tr>			
		</table>
	</div>

	<jsp:include page="commu_footer.jsp" />

</body>
</html>