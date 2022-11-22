<%@page import="kr.co.yomozomo.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String bnum=request.getParameter("bnum");

out.println(bnum);
int b=Integer.parseInt(bnum);

BoardDAO dao=new BoardDAO();
dao.deleteOne(b);
dao.close();

response.sendRedirect("b_mngmn1.jsp");
%>