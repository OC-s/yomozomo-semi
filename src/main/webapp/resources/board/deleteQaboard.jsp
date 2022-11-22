<%@page import="kr.co.yomozomo.dao.QaboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String qanum=request.getParameter("qanum");

out.println(qanum);
int q=Integer.parseInt(qanum);

QaboardDAO dao=new QaboardDAO();
dao.deleteOne(q);
dao.close();

response.sendRedirect("b_mngmn2.jsp");
%>