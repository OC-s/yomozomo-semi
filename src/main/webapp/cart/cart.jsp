<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%

	//detail.jsp에서 장바구니담기 버튼을 누르면 지정한 수량, 상품번호를 hashmap에 담아서 session에 저장하기
	
	//세션에 cart라는 이름의 속성객체 얻어오기
	//session: 브라우저가 종료되기 전까지 유지됨, 같은 화면 봐도 세션마다 세션값은 다 다름
	Object obj = session.getAttribute("cart");
	
	//만약 이런 객체가 없다면 세션 만들어주기
	if (obj == null) {
		//배열생성
		HashMap<Integer, Integer> cart = new HashMap<Integer, Integer>();
	
		//cart라는 이름에 cart라는 속성을 가진 세션 만들어줌
		session.setAttribute("cart", cart);
		//오브젝트 객체로 cart라는 이름의 세션 가져오기
		obj = session.getAttribute("cart");
	}
	
	//obj를 arraylist로 형변환
	HashMap<Integer, Integer> cart =(HashMap<Integer, Integer>)obj;
	
	//no라는 파라미터 값을 가져오기
	String pnum =request.getParameter("pnum");
	String num=request.getParameter("num");
	//상품번호로 쓸 것이므로 형변환해줌
	int p=Integer.parseInt(pnum);
	int n=Integer.parseInt(num);
	
	//카트(ArrayList)에 p변수를 추가
	//cart이미지를 누르면 arraylist에 그 상품의 pno가 추가되도록
	cart.put(p, n);
	
	//productDetail.jsp로 리다이렉트
	//장바구니 클릭하면 바로 productDetail.jsp로 돌아오게 설정함. 
	//누르면 그냥 그 화면에서 멈춰있는 것처럼 보임
	response.sendRedirect("../detail?id="+p);
%>