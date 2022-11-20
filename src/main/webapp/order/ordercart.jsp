<%-- <%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	// 세션에 cart 라는 이름의 속성객체 얻어오기
	    Object obj = session.getAttribute("cart");
    	
    	// 이런 객체가 없다면 세션만들기
    	if(obj == null){
    		// 생성
			ArrayList<Integer> list = new ArrayList<Integer>();
    		
    		// 세션에 속성으로 지정
    		session.setAttribute("cart", cart2);
    		obj = session.getAttribute("cart");
    	}
	
    	// obj가 null 아닌상태
    	out.println(obj);
    	
    	// ArrayList 객체를 형변환
    	ArrayList<Integer> list = (ArrayList<Integer>)obj;
    	
    	// no 라는 파라미터 값을 가져오기
    	String pnum = request.getParameter("P_NUM");
    	
    	// 형변환
    	int p = Integer.parseInt(pnum);
    	
    	// 카드(ArrayList) 에 추가
    	cart.add(p);
    	
    	// 화면에 카드를 출력
    	out.println("cart : " + cart2);
    	 
    	// productDetail.jsp 로 리다이렉트
    	response.sendRedirect("order.jsp");
    	
    %>
     --%>