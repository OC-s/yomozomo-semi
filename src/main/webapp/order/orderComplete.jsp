<%@page import="java.util.Iterator"%>
<%@page import="vo.ProductVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문완료</title>
	<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
        crossorigin="anonymous"
    />
    <script
    	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
    	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
    	crossorigin="anonymous"
    ></script>
    <link
    	rel="stylesheet"
    	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<link rel="stylesheet" href="../css/orderComplete.css?after">
</head>

<body>
    <div id="body-wrapper">
   		<!-- header -->
   		<%@ include file="/source/header.jsp" %>
		
        <!-- main -->
        <div id="main">
            <div>
                <div class="main_title"><img class="order_img" src="../image/icon/order.webp" alt=""></div>
            </div>
            <table class="order_Cbox">
            
                <tr class="order_tr">
                    <td class="order_td">주문상품</td>
          <%
            
            int sum = 0;
         	String pname = ""; 
          	int namecnt = 0;
            HashMap<Integer, Integer> list = (HashMap<Integer, Integer>)session.getAttribute("cart");
            if(list == null){
				list = new HashMap<>();
				
      		} else {
      			Set<Integer> set=list.keySet();
          		Iterator<Integer> it = set.iterator();
       			ProductDAO dao = new ProductDAO();
       			DecimalFormat df = new DecimalFormat("#원,##0");
       			
       			while(it.hasNext()){
       				int key=it.next();
       				ProductVO vo = dao.selectOne(key);
       				int cnt = list.get(key);
       				
       				namecnt ++;
       				
       				pname = vo.getPname();
       				pname += pname; 
       				
       				sum += cnt*(Math.round(vo.getPprice()*(1-vo.getPdiscount()*0.01)));
       			}
       			
       		 	if(pname.length()>15){
   					pname = pname.substring(0,15)+" ...외 "+(namecnt-1)+"건";
   				} 
      		%>
                    <td class="order_td2"><%= pname%></td>
                </tr>
                
                <tr class="order_tr">
                    <td class="order_td">배송지</td>
                    <td class="order_td2"><%= request.getParameter("addrs") + request.getParameter("addrs2")%></td>
                </tr>
                
                <tr class="order_tr">
                    <td class="order_td">결제금액</td>
                    <td class="order_td2"><%= df.format(sum) %></td>
                </tr>
           	<% 
    		}
    		%>      
            </table>
            <div>
                <a href="../main/main.jsp"><button class="order_btn1">쇼핑 계속하기</button></a>
                <a href="#"><button class="order_btn2">주문현황 보기</button></a>
            </div>
        </div>
        <!-- main end -->
        
        
        <!-- footer -->
     	<%@ include file="/source/footer.jsp" %>
     	
	 </div>
</body>
</html>