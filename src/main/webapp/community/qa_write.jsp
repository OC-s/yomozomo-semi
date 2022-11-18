<%@page import="java.io.PrintWriter"%>
<%@page import="kr.co.yomozomo.vo.MemberVO"%>
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
	#qa_table{
		position: relative;
		top:110px;
	}
	
	
</style>
<body>

	<jsp:include page="../source/header.jsp"/>
	<jsp:include page="commuNav.jsp"/>
	<jsp:include page="qa_Nav.jsp"/>
 	
	
	<%
		Object obj = session.getAttribute("vo");
		if(obj != null){
				MemberVO vo = (MemberVO)obj;
		
	%>
	
	<div class="container">
		<form action="qa_writeOk.jsp" method="post" enctype="multipart/form-data">
			<table class="table table-bordered table-striped " id="qa_table">
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" name="writer" id="" disabled="disabled" value="<%=vo.getNICKNAME() %>"/>
						<input type="hidden" name="writer" id="" value="<%=vo.getID() %>"/>
						<input type="hidden" name="m_num" id="" value="<%=vo.getM_NUM() %>"/>
						
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id="contents" rows="20" cols="80" name="contents"></textarea>
					</td>
				</tr>
				<tr>
				<th>첨부파일</th>
				<td><input type="file" name="filename" id="" /></td>
			   </tr>
				<tr>
					<td colspan="4">
						<a href="qa.jsp"><input type="button" value="목록" class="btn btn-success"/></a>
						<input type="submit" value="작성" class="btn btn-primary" />
					</td>
				</tr>			
			</table>
		</form>
	</div>
	<%
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 해주세요')");
			script.println("location.href = 'login.jsp'");		
			script.println("</script>");
		}
	%>
	

</body>
</html>