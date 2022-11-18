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
	})
</script>
<style>
div#maindiv{
	position: relative;
	top: 110px;
	background-color: #eeeeee;
	padding: 100px;
}
div#divimg{
	text-align: center;
}
div#msg{
	text-align: center;
}
div#btn{
	text-align: center;
}
img#cat{
	width: 200px;
}
div#footer{
	position: relative;
	top: 150px;
}
div#cart_list{
	border: 1px solid #dddddd;
	width: 700px;
}
</style>
<link rel="stylesheet" href="../css/order2.css" />
<link rel="stylesheet" href="../css/footer.css" />
<style>
img#pimage{
	width: 100px;
}
div#
</style>
</head>
<body>
<jsp:include page="../layout/header.html"></jsp:include>
<div id="maindiv">
	<%
	//현재 세션에서 cart의 속성 가져오기
	Object obj=session.getAttribute("cart");
	
	if(obj!=null){
		ArrayList<Integer> list = (ArrayList<Integer>) obj;
		
		HashMap<Integer, Integer> map= new HashMap<Integer, Integer>();
		
		for(int x: list){
			if(map.containsKey(x)){
				map.put(x, map.get(x)+1);
			}else{
				map.put(x,1);
			}
		}
		
		ProductDAO dao=new ProductDAO();
		
		Set<Integer> set=map.keySet();
		Iterator<Integer> it=set.iterator();
		
		while(it.hasNext()){
			int key=it.next();
			ProductVO vo=dao.selectOne(key);
			int cnt=map.get(key);

	%>
		<div id="cart_list">
			<div class="form-check">
  				<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
  				<label class="form-check-label" for="flexCheckChecked"></label>
			</div>
		</div>
		<div id="orderBtn">
			<a href="../order/order.jsp"><button type="button" class="btn btn-primary">결제하기</button></a>
		</div>
	<%
		}
	}else{
	%>
		<div id="divimg">
			<img id="cat" src="../image/cat.png" alt="" />
		</div>
		<div id="msg">
			장바구니에 상품이 없습니다.
		</div>
		<div id="btn">
			<a href="store.jsp"><button type="button" class="btn btn-info">쇼핑하러 가기</button></a>
		</div>
	<%
	}
	%>
	</div>
<jsp:include page="../layout/footer.html"></jsp:include>
</body>
</html>