<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Object obj = session.getAttribute("cart");

if(obj!=null){

	String pnum=request.getParameter("pnum");

	int p=Integer.parseInt(pnum);

	HashMap<Integer, Integer> list=(HashMap<Integer, Integer>)obj;
	list.remove(p);

	Set<Integer> set=list.keySet();
	Iterator<Integer> it=set.iterator();

	if(it.hasNext()){
		response.sendRedirect("viewCart.jsp");
	
	}else{
		session.removeAttribute("cart");
		response.sendRedirect("viewCart.jsp");
	}

}else{
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('장바구니에 상품이 없습니다.')");
	script.println("location.href = '/yomozomo/store?category'");
	script.println("</script>");
}
%>