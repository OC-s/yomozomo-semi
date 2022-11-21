<%@page import="kr.co.yomozomo.vo.joinVO"%>
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
</head>
<style>
	#pic_modify{
		position: relative;
		top:110px;
	}
	
</style>
<link rel="stylesheet" href="../css/order2.css" />
<body>

	<jsp:include page="/source/header.jsp"/>
	<jsp:include page="commuNav.jsp"/>
	<jsp:include page="pic_Nav.jsp"/>
	
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");		
		
		String no = request.getParameter("b_num");
		
		if(no != null){
			
			int b_num = Integer.parseInt(no);
			
			BoardDAO dao = new BoardDAO();
			
			joinVO vo = dao.joinOne(b_num);
			
			
	%>
	
	
	<form action="pic_modifyOk.jsp" method="post" enctype="multipart/form-data">
		<div class="container">
			<table class="table table-bordered table-striped" id="pic_modify">
				<tr>
					<th>작성자</th>
					<td>
					<input type="text" name="writer" id="" disabled="disabled" value="<%= vo.getNICKNAME() %>"/>
					<input type="hidden" name="writer" id="" value="<%= vo.getM_NUM()  %>"/>
					<input type="hidden" name="b_num" value="<%=vo.getB_NUM() %>"/>
					</td>
					
				</tr>
				<tr>
	
					<th>제목</th>
					<td><input type="text" name="title" id="" value="<%= vo.getB_TITLE() %>" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id="contents" rows="20" cols="80" name="contents"><%=vo.getB_CONTENTS() %></textarea>
					</td>
				</tr>
				<tr>
				<th>첨부파일</th>
				<td><input type="file" name="filename" id="" /></td>
			   </tr>
				<tr>
				<td colspan="6">
					<input type="submit" value="수정완료" class="btn btn-outline-secondary" />
					<a href="pic_detail.jsp?b_num=<%=vo.getB_NUM()%>"><input type="button" value="취소" class="btn btn-outline-secondary"/></a>
				</td>
				</tr>
			</table>
		</div>	
	</form>
	<%
		}	
	%>
	
	<jsp:include page="commu_footer.jsp"/>

</body>
</html>