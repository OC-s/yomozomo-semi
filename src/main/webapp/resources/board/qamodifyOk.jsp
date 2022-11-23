<%@page import="kr.co.yomozomo.vo.QaboardVO"%>
<%@page import="kr.co.yomozomo.dao.QaboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

String qanum=request.getParameter("qanum");
String contents=request.getParameter("contents");
String image=null;
String title=request.getParameter("title");

QaboardDAO dao=new QaboardDAO();
QaboardVO vo=new QaboardVO();

int q=Integer.parseInt(qanum);

vo.setQAB_CONTENTS(contents);
vo.setQAB_TITLE(title);
vo.setQAB_IMAGE(image);
vo.setQAB_NUM(q);

dao.updateOne(vo);
dao.close();

response.sendRedirect("b_mngmn2.jsp");

%>