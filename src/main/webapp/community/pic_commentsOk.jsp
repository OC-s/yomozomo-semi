<%@page import="java.io.PrintWriter"%>
<%@page import="kr.co.yomozomo.vo.CommentsVO"%>
<%@page import="kr.co.yomozomo.dao.CommentsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	
	// 파라미터 값 가져오기
	String num = request.getParameter("m_num");
	String num2 = request.getParameter("b_num");
	String contents = request.getParameter("contents");
	
	
	if(contents!=""){
		
		int m_num = Integer.parseInt(num);
		int b_num = Integer.parseInt(num2);
		// 2. dao
		CommentsDAO dao = new CommentsDAO();
		
		// 3. vo
		CommentsVO vo = new CommentsVO();
		vo.setM_NUM(m_num);
		vo.setB_NUM(b_num);
		vo.setC_CONTENTS(contents);

		
		/* out.println(vo); */
		
		// 4. db에 추가
		dao.insertOne(vo);
		
		// 5. list.jsp 로 리다이렉트
		response.sendRedirect("pic_detail.jsp?b_num="+b_num);
	}else{
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글을 작성해 주세요')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	
	
%>	