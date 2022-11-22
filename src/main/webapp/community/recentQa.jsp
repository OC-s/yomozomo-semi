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
	
	Object obj = session.getAttribute("vo");
	if (obj != null) {
		MemberVO vo = (MemberVO) obj;

	}
	%>
	

		<a href="qa.jsp" class="best">최근 올라온 질문 &#x2728;</a>
			
	
	
			<table class="recentQa_table"
				style="position: relative; top: 100px; text-align: center; border: 1px solid silver;">
			
					<tr>					
						<th style="border: 1px solid silver; background-color: #eeeeee; text-align: center; width: 600px;">제목</th>
						<th style="border: 1px solid silver; background-color: #eeeeee; text-align: center;">작성자</th>			
					</tr>
			
				<%
				ArrayList<QajoinVO> list = dao.joinAll(startNo2, endNo2);
				for (QajoinVO vo : list) {
				%>

			
					<tr>
						<td style="border: 1px solid silver"><a style="color:black;" href="qa_detail.jsp?qab_num=<%=vo.getQAB_NUM()%>"><%=vo.getQAB_TITLE()%></a></td>
						<td style="border: 1px solid silver"><%=vo.getNICKNAME()%></td>
					</tr>
		
				<%
				}
				%>
			</table>
	



</body>
</html>