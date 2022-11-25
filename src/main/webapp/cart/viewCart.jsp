<%@page import="java.io.PrintWriter"%>
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
<link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
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
	background-color: #eeeeee;
	text-align: center;
	position: relative;
	top: 50px;
	padding-top: 80px;
	padding-bottom: 320px;
	margin-top: 50px;
	margin-bottom: 50px;
	height: 300px;
}
img#pimage{
	width: 100px;
}
img#cat{
	width: 200px;
}
div#footer{
	position: relative;
	top: 40px;
}
div#totalprice{
	border: 1px solid #eeeeee;
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
	right: 45px;
}
span#tpmsg{
	position: relative;
	right: 140px;
}
div#orderBtn{
	position: absolute;
	right: 175px;
}
</style>
<link rel="stylesheet" href="../css/main.css" />

</head>
<body>
<jsp:include page="../source/header.jsp"></jsp:include>

	<%
	//현재 세션에서 cart의 속성 가져오
	Object obj1=session.getAttribute("cart");
	
	if(obj1!=null){
	%>

<div id="maindiv1">
	<div id="table">
	<table class="table table-hover">
  		<thead>
    		<tr>
      			<th scope="col">상품이미지</th>
      			<th scope="col">상품명</th>
      			<th scope="col">가격</th>
      			<th scope="col">수량</th>
      			<th scope="col">총 가격</th> 						
      			<th scope="col">삭제</th> 						
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
	<form>
    	<input type="hidden" name="pnum" value="<%=vo.getPnum() %>" />
    	<tr>
      		<td><div id="product_img"><img id="pimage" src="../<%=vo.getPthumbnail() %>" alt="" /></div></td>
      		<td><div id="product_name"><%=vo.getPname() %></div></td>
      		<td><div id="product_price"><%=df.format(vo.getPprice()) %></div></td>
      		<td><div id="product_cnt"><%=cnt %></div></td>
      		<td><div id="product_tprice"><%=df.format(cnt*(vo.getPprice())) %></div></td>
      		<td><button type="submit" class="btn btn-danger" formaction="deleteCart.jsp">삭제</button></td>
    	</tr>
	</form>
	<%
		totalSum += cnt*(vo.getPprice());
		}

	%>
	<tr>
		<td colspan="6" id="totalprice" >
			<span id="tpmsg">
				합계
			</span>
			<span name="totalPrice" id="tp">
				<%= df.format(totalSum)%>
			</span>
		</td>
	</tr>
  	</tbody>
</table>
</div>
	<span id="shoppingBtn">
		<a href="/yomozomo/store?category"><button type="button" class="btn btn-secondary">쇼핑 계속하기</button></a>
	</span>
	<span id="cancelBtn">
		<a href="clearCart.jsp"><button type="button" class="btn btn-danger">장바구니 비우기</button></a>
	</span>
	<form action="../order/order.jsp">
		<span id="orderBtn">
			<a href="../order/order.jsp"><button type="submit" class="btn btn-primary">결제하기</button></a>
		</span>
	</form>
</div>
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
			<a href="/yomozomo/store?category"><button type="button" class="btn btn-info">쇼핑하러 가기</button></a>
		</div>
	</div>
	<%
	}
	%>
<jsp:include page="../source/footer.jsp"></jsp:include>
</body>
</html>
