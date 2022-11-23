<%@page import="kr.co.yomozomo.vo.QaboardVO"%>
<%@page import="kr.co.yomozomo.dao.QaboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

String mnum=request.getParameter("mnum");
String contents=request.getParameter("contents");
String image=null;
String title=request.getParameter("title");

int m=Integer.parseInt(mnum);

QaboardDAO dao=new QaboardDAO();
QaboardVO vo=new QaboardVO();

vo.setQAB_IMAGE(image);
vo.setQAB_CONTENTS(contents);
vo.setQAB_TITLE(title);
vo.setM_NUM(m);

dao.insertOne(vo);
dao.close();

response.sendRedirect("b_mngmn2.jsp");
%>