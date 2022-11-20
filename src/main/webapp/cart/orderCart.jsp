<%@page import="dao.CartDAO"%>
<%@page import="vo.CartVO"%>
<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="kr.co.yomozomo.dao.OrderDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Object obj1=session.getAttribute("cart");
Object obj2=session.getAttribute("userNum");

if(obj2!=null){
	
HashMap<Integer, Integer> list=(HashMap<Integer, Integer>)obj1;
int mnum=(int)obj2;

Iterator<HashMap.Entry<Integer, Integer>> itr=list.entrySet().iterator();

while(itr.hasNext()){
	HashMap.Entry<Integer, Integer> entry=itr.next();
	int pnum=entry.getKey();
	
	CartDAO cdao=new CartDAO();
	ProductDAO pdao=new ProductDAO();
	ProductVO pvo=pdao.selectOne(pnum);
	

	String pname=pvo.getPname();
	int count=entry.getValue();
	int price=pvo.getPprice();
	
	
	CartVO cvo = new CartVO();
	cvo.setMnum(mnum);
	cvo.setPnum(pnum);
	cvo.setPname(pname);
	cvo.setCount(count);
	cvo.setPrice(price);
	cdao.insertOne(cvo);
	
	pdao.close();
	cdao.close();
	}
	
}else{
%>
<script type="text/javascript">
	window.onload=function(){
		alert("로그인 후 이용하세요.");
		location.href="../login/login.jsp";
	}
</script>
<%
}

%>