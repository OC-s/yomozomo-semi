<%@page import="vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
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
</head>
<style>
#admin_list_all_container{
	position: relative;
	top:100px;
}
</style>
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
	recoredPerPage = 15;

	startNo2 = (currentPage - 1) * recoredPerPage + 1;
	
	endNo2 = 15;

	//총게시물수
	ProductDAO dao = new ProductDAO();

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
	
		<div class="container">
		<div class="row">
			<table class="table table-bordered"
				style="position: relative; top: 100px; text-align: center; border: 1px solid #dddddd; margin-top: 50px;">
				<thead>
					<tr>
						<td colspan="6">
							<h2>상품 전체목록</h2>						
						</td>
					</tr>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
						<th style="background-color: #eeeeee; text-align: center;">이름</th>
						<th style="background-color: #eeeeee; text-align: center;">가격</th>
						<th style="background-color: #eeeeee; text-align: center;">할인</th>
						<th style="background-color: #eeeeee; text-align: center;">수량</th>
					</tr>
				</thead>
				<%
				ArrayList<ProductVO> list = dao.selectAll(startNo2, endNo2);
				for (ProductVO vo : list) {
				%>

				<tbody>
					<tr>
						<td><%=vo.getPnum()%></td>
						<td><%=vo.getPcategory() %></td>
						<td><%=vo.getPname()%></td>
						<td><%=vo.getPprice()%></td>
						<td><%=vo.getPdiscount()%></td>
						<td><%=vo.getPstock()%></td>
	
					</tr>
				<%
				}
				%>
					<tr>
						<td colspan="6">
							<a href="admin_addPro.jsp"><input type="button" value="상품등록" /></a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="container" id="admin_list_all_container">
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
								href="admin_page.jsp?cp=<%=startPage - 1%>" tabindex="-1"
								aria-disabled="true">Previous</a></li>
							<%
							}
							%>
							<%
							for (int i = startPage; i <= endPage; i++) {
							%>
							<li class="page-item"><a class="page-link"
								href="admin_page.jsp?cp=<%=i%>"><%=i%></a></li>
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
								href="admin_page.jsp?cp=<%=endPage + 1%>">Next</a></li>
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