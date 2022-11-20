<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.ProductVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		console.log("이미지 출처: 고양이, 고양이, 동물 https://.pngtree.com/freepng/고양이--고양이--동물_6736820.html?share=1");
		
	});
</script>
<style>
div#maindiv1{
	position: relative;
	top: 50px;
	padding: 100px;
}
div#maindiv2{
	text-align: center;
	background-color: #eeeeee;
	position: relative;
	top: 110px;
	padding: 100px;
}
img#pimage{
	width: 100px;
}
img#cat{
	width: 200px;
}
div#footer{
	position: relative;
	top: 150px;
}

div#totalprice{
	border: 1px solid #dddddd;
	position: relative;
	left: 900px;
	width: 400px;
	height: 200px;
	border-radius: 10px;
}
#totalprice{
	text-align: right;
}
span#tp{
	position: relative;
	right: 60px;
}
span#tpmsg{
	position: relative;
	right: 120px;
}
</style>
<link rel="stylesheet" href="../css/order2.css" />
<link rel="stylesheet" href="../css/footer.css" />
</head>
<body>
	<%@include file="/source/header.jsp" %>

	<%
	//현재 세션에서 cart의 속성 가져오기
	Object obj1=session.getAttribute("cart");
	
	if(obj1!=null){
	%>
<form action="../order/order.jsp">
<div id="maindiv1">
	<div id="table">
	<table class="table">
  		<thead>
    		<tr>
      			<th scope="col">상품이미지</th>
      			<th scope="col">상품명</th>
      			<th scope="col">가격</th>
      			<th scope="col">수량</th>
      			<th scope="col">총 가격</th>
    		</tr>
  		</thead>
		<tbody class="table-group-divider">
	<%
		HashMap<Integer, Integer> list= (HashMap<Integer, Integer>)obj1;
		
		
		ProductDAO dao=new ProductDAO();
		
		Set<Integer> set=list.keySet();
		Iterator<Integer> it=set.iterator();
		int totalSum = 0;
		DecimalFormat df = new DecimalFormat("￦#,##0");
		
		while(it.hasNext()){
			int key=it.next();
			ProductVO vo=dao.selectOne(key);
			int cnt=list.get(key);
	%>
    	<tr>
      		<td><div id="product_img"><img id="pimage" src="../<%=vo.getPthumbnail() %>" alt="" /></div></td>
      		<td><div id="product_name"><%=vo.getPname() %></div></td>
      		<td><div id="product_price"><%=df.format(vo.getPprice()) %></div></td>
      		<td><div id="product_cnt"><%=cnt %></div></td>
      		<td><div id="product_tprice"><%=df.format(cnt*(vo.getPprice())) %></div></td>
    	</tr>
	<%
		totalSum += cnt*(vo.getPprice());
		}
	%>
	<tr>
		<td colspan="5" id="totalprice" >
			<span id="tpmsg">
				합계
			</span>
			<span id="tp">
				<%= df.format(totalSum)%>
			</span>
		</td>
	</tr>
  	</tbody>
</table>
</div>
	<div id="orderBtn">
		<a href="../order/order.jsp"><button type="submit" class="btn btn-primary">결제하기</button></a>
	</div>
</div>
</form>
	<%
	}else{
	%>
	<div id="maindiv2">
		<div id="divimg">
			<img id="cat" src="../image/cat.png" alt="" />
		</div>
		<div id="msg">
			장바구니에 상품이 없습니다.
		</div>
		<div id="btn">
			<a href="../store.jsp"><button type="button" class="btn btn-info">쇼핑하러 가기</button></a>
		</div>
	</div>
	<%
	}
	%>
<jsp:include page="../layout/footer.html"></jsp:include>
</body>
</html>