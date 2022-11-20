<%@page import="kr.co.yomozomo.vo.QacmtjoinVO"%>
<%@page import="kr.co.yomozomo.dao.QacommentsDAO"%>
<%@page import="kr.co.yomozomo.vo.QajoinVO"%>
<%@page import="kr.co.yomozomo.dao.QaboardDAO"%>
<%@page import="kr.co.yomozomo.vo.CmtjoinVO"%>
<%@page import="kr.co.yomozomo.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
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
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");

	String no = request.getParameter("qab_num");
	
	Object obj = session.getAttribute("vo");

	if (no != null) {

		int qab_num = Integer.parseInt(no);

		//out.println(bno);

		QaboardDAO dao = new QaboardDAO();
		
		dao.raiseHits(qab_num); //조회수를 1증가 시킨다
		
		QajoinVO vo = dao.joinOne(qab_num);//게시물을 가져온다.

		//out.println(vo);
	%>

	<form method="post" action="qa_commentsOk.jsp">
		<table class="table "
			style="text-align: center; border: 1px solid #dddddd; position: relative; top: 10px;">
			<%-- 홀,짝 행 구분 --%>
			<thead>
				<tr>
					<th colspan="7" style="background-color: #eeeeeee; text-align: center;">댓글</th>
				</tr>
			</thead>
			<tbody>

				<%
				QacommentsDAO dao2 = new QacommentsDAO();
				ArrayList<QacmtjoinVO> list = dao2.joinAll();
				for (QacmtjoinVO vo2 : list) {

					MemberVO log = (MemberVO) obj;
					if (vo.getQAB_NUM() == vo2.getQAB_NUM()) {
				%>

				<tr>
					<td colspan="2" style="text-align: center; width: 100px;"><%=vo2.getNICKNAME()%>님</td>
					<td colspan="3" style="text-align: left; word-break: break-all"><%=vo2.getQAC_CONTENTS()%></td>
					<td style="text-align: right;"><%=vo2.getQAC_REGDATE()%> <%
						 if (obj != null) {
						
						 	if (log.getM_NUM() == vo2.getM_NUM()) {
						 %> 
						 <a href="qa_comments_modify.jsp?qab_num=<%=vo2.getQAB_NUM()%>&qac_num=<%=vo2.getQAC_NUM()%>">
							<input type="button" value="[수정]" class="btn btn-default btn-xs" />
						</a> 
						<a href="qa_comments_deleteOk.jsp?qab_num=<%=vo2.getQAB_NUM()%>&qac_num=<%=vo2.getQAC_NUM()%>">
							<input type="button" value="[삭제]" class="btn btn-default btn-xs" />
						</a>
					</td>

					<%
						}
					}
					%>
				</tr>
				<%
					}
				}

				if (obj != null) {

				MemberVO log = (MemberVO) obj;
				%>
			</tbody>
		</table>
		<table class="table "
			style="text-align: center; border: 1px solid #dddddd; position: relative; top: 10px;">
			<tr>
				<td colspan="3"><textarea class="form-control"
						placeholder="댓글을 입력하세요." name="contents" maxlength="2048"
						cols="100"></textarea></td>
						
				<td><input type="hidden" name="writer" id="" value="<%=log.getID()%>" /> 
					<input type="hidden" name="m_num" id="" value="<%=log.getM_NUM()%>" /> 
					<input type="hidden" name="qab_num" id="" value="<%=vo.getQAB_NUM()%>" />
				</td>
					
				<td><input type="submit" class="btn btn-outline-secondary" value="작성하기"
					style="margin-top: 10px; margin-right: 100px;"></td>

			</tr>
		</table>
	</form>

	<%
		}else{
	%>
	
	<table class="table "
			style="text-align: center; border: 1px solid #dddddd; position: relative; top: 10px;">
			<tr>
				<td colspan="3"><textarea class="form-control"
						placeholder="로그인 해주세요" name="contents" maxlength="2048"
						cols="100"></textarea></td>
						
		
				<td>
				<a href="../login/login.jsp"><input type="button" class="btn btn-outline-secondary" value="로그인"
					style="margin-top: 10px; margin-right: 100px;"></a>
				</td>

			</tr>
		</table>

	<% 	
		}
	}
	%>


</body>
</html>