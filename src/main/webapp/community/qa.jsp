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
	font-size: 12px;
	font-weight: bold;
	border: solid 0px skyblue;
	border-radius: 10px;
	background-color: skyblue;
	margin-bottom: 50px;
	color: white;
}
</style>
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
	recoredPerPage = 6;

	//게시물 시작번호와 끝번호 계산
	//현재 페이지가 1이면
	//시작 번호 : 1 부터 끝번호 : 10

	//현재 페이지가 2이면
	//시작번호 11부터 끝번호 20
	startNo2 = (currentPage - 1) * recoredPerPage + 1;
	//int endNo = currentPage*recoredPerPage;
	endNo2 = 6;

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
	<jsp:include page="../source/header.jsp" />
	<jsp:include page="commuNav.jsp" />
	<jsp:include page="qa_Nav.jsp" />

	<%
	Object obj = session.getAttribute("vo");
	if (obj != null) {
		MemberVO vo = (MemberVO) obj;
	%>


	<table class="qa_table">
		<tr>
			<td><a href="qa_write.jsp"><input type="button" value="글쓰기"
					id="qa_btn" /></a></td>
		</tr>
	</table>
	<%
	}
	%>



	<div class="container">
		<div class="row">
			<table class="table table-bordered"
				style="position: relative; top: 100px; text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
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
						<td><%=vo.getQAB_NUM()%></td>
						<td><a href="qa_detail.jsp?qab_num=<%=vo.getQAB_NUM()%>"><%=vo.getQAB_TITLE()%></a></td>
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


</body>
</html>