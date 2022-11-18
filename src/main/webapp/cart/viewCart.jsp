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
div#main{
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
</style>
<link rel="stylesheet" href="../css/order2.css" />
<link rel="stylesheet" href="../css/footer.css" />
</head>
<body>
<jsp:include page="/source/header.jsp"></jsp:include>

<table>
	<tr>
		<th>상품이미지</th>
		<th>상품명</th>
		<th>수량</th>
		<th>가격</th>
	</tr>
</table>
	<%
	//현재 세션에서 cart의 속성 가져오기
	Object obj = session.getAttribute("cart");
	
	//null이 아니라면
	if (obj != null) {
		//ArrayList로 형변환
		ArrayList<Integer> list = (ArrayList<Integer>) obj;
		out.println(list);
		//상품번호, 수량
		
		//HashMap이용해서 상품, 수량을 mapping시키기
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		//map{상품번호,수량} 이런식으로 맵핑
		//[124, 125, 128, 129]
		for (int x : list) {
			//x번 상품이 hashmap에 존재하면(map.containsKey(x): x값이 존재하는지 boolean타입으로 리턴함)
			if (map.containsKey(x)) {
					
				//기존에 있던 value값에 누적 1을 더하는 방식으로 만들기
				map.put(x, map.get(x) + 1);
			} else {
				//x번 상품이 처음엔 hashmap에 존재하지 않으므로, 처음엔 value값(=상품수량)을 1로 지정해서 넣기
				map.put(x, 1);
			} 
		}
		out.println("map: " + map);

		//dao객체 생성
		ProductDAO dao = new ProductDAO();

		//db에서 상품번호 vo객체 가져오기

		//key들만 모음으로 가져오기
		//맵에서 key값만 가져와서 화면에 출력
		//generic으로 받으면 자동으로 지정한 형으로 변환됨.(따로 형변환 안해도 돼서 편함)
		Set<Integer> set = map.keySet();
		//iterator로 순환하며 존재하는 key들을 담기
		Iterator<Integer> it = set.iterator();
		//hasNext로 it에 남는 key없을때까지 순환
		while (it.hasNext()) {
			//next로 key값을 변수에 담아줌
			int key = it.next();
			//출력
			/* out.println("<h3>"+key+"</h3>");*/
			//가져온 key값으로 selectOne메서드 사용하기
			ProductVO vo = dao.selectOne(key);
			//상품명과 해당 key의 value값을 가져오기
			out.println("<h3>" + vo.getPname() + ":" + map.get(key) + "</h3>");
			int cnt = map.get(key);
	%>
		<ul class="list-group">
  			<li class="list-group-item">
  				<article>
  					<div class="form-check">
  						<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
  						<label class="form-check-label" for="flexCheckDefault"></label>
					</div>
					<a href="">
						<div id="pimage">
							<img src="<%=vo.getPimage() %>" alt="" />
						</div>
						<div id="pname">
							<h1><%=vo.getPname() %></h1>
						</div>
					</a>
  				</article>
  			</li>
		</ul>
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
			<a href="../store.jsp"><button type="button" class="btn btn-info">쇼핑하러 가기</button></a>
		</div>
	</div>
	<%
	}
	%>
	<%-- <jsp:include page="/source/footer.jsp"></jsp:include> --%>
</body>
</html>