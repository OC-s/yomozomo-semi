<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>orderpage</title>
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
    <!-- daum address  -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <link rel="stylesheet" href="../css/order.css">
    
    <style type="text/css">
    	.section_pname{
		    margin-left: 10px;
		    margin-bottom: 10px;
		}
		
		.section_list {
		    display: flex;
		    flex-direction: row;
		    margin-bottom: 10px;
		}
    </style>
    
    
    <!-- 주소가져오기 -->
	<script type="text/javascript">
		/* daum 주소 가져오기 */
		window.onload=function(){
			var btn = document.getElementById("btn2");
			btn.onclick=openKakaoPostcode;
		}
		function openKakaoPostcode(){
			new daum.Postcode({
				oncomplete : function(data){
					
					document.getElementById("post").value=data.zonecode;
					document.getElementById("addrs").value=data.roadAddress;
				}
			}).open();
		}
		    
	</script>
	
	<!-- 체크 -->
	<script type="text/javascript">
	function Checkform(){
	 	if(dname.value ==""){
			dname.focus();
			alert('배송지명을 입력해주세요');
			return false
		}
		if(dname2.value ==""){
			dname2.focus();
			alert('받는사람을 입력해주세요');
			return false
		}
		if(tel.value ==""){
			tel.focus();
			alert('연락처를 입력해주세요');
			return false
		}
		if(post.value =="" || addrs.value ==""){
			btn2.focus();
			alert('주소를 찾아주세요');
			return false
		} 
		
		if(addrs2.value == ""){
			addrs2.focus();
			alert('상세주소를 입력해주세요');
			return false
		}
		if(oname.value ==""){
			oname.focus();
			alert('이름을 입력해주세요');
			return false
		}
		if(email1.value ==""){
			email1.focus();
			alert('이메일을 입력해주세요');
			return false
		}
		
		if(email2.value =='0'){
			email.focus();
			alert('이메일을 선택해주세요');
			return false
		} 
		
		if(tel2.value == "1"){
			tel2.focus();
			alert('전화번호를 선택해주세요');
			return false
		} 
		
		if(tel3.value == ""){
			tel3.focus();
			alert('전화번호를 입력해주세요');
			return false
		} 
	
		// 체크박스 선택확인
		if(check_2.checked != true){
			check_2.focus();
			alert('개인정보 수집 및 제3자 제공 동의해주세요');
			return false
		} 
	}
	</script>
	
	<script type="text/javascript">
	function selectEmail(ele){
	    var $ele = $(ele);
	    var $email2 = $('input[name=email2]');
	    // '1'인 경우 직접입력
	    if($ele.val() == "1"){
	        $email2.attr('readonly', false);
	        $email2.val('');
	    } else {
	        $email2.attr('readonly', true);
	        $email2.val($ele.val());
	    }
	}
	</script>

</head>
<body>
    <div id="body-wrapper">
   		
   		<!-- header -->
   		<%@ include file="/source/header.jsp" %>
		
		<%
		/* 로그인 정보 없을때 로그인창으로 이동  */
		if(obj == null){
			response.sendRedirect("../login/login.jsp");
		} else {
			
		%>
		
   		<form action="orderOk.jsp" onSubmit="return Checkform()" method="post">
        <!-- main -->
        <div id="main">
            <main class="order_maindate">
                <h1><strong>주문/결제</strong></h1>
                
                <section class="section_box">
                    <section>
                        <div class="order_title">배송지</div>
                    </section>
                    
                    <div class="order_content">
                        <section class="section_box2">
                            <label class="section_label">
                                <div class="section_title">배송지명</div>
                                <input class="section_text" type="text" name="dname" id="dname"><br>
                            </label>
                            <label class="section_label">
                                <div class="section_title">받는사람</div>
                                <input class="section_text" type="text" name="dname2" id="dname2"><br>
                            </label>
                            <label class="section_label">
                                <div class="section_title">연락처</div>
                                <input class="section_text" type="text" name="tel" id="tel"><br>
                            </label>
                            <label class="section_label">
                                <div class="section_title">주소</div>
                                <div>
                                    <div class="section_address">
                                        <button class="section_btn" type="button" value="주소찾기" id="btn2">주소찾기</button>
                                        <input class="section_text2" type="text" name="post" id="post"><br>
                                    </div>
                                    <input class="section_text" type="text" name="addrs" id="addrs"><br>
                                    <input class="section_text" type="text" name="addrs2" id="addrs2" placeholder="상세주소 입력"><br>
                                </div>
                            </label>
                            <select class="section_re" name="section_re" onChange="selectDe(this)">
                                <option value="배송시 요청사항을 선택해주세요">배송시 요청사항을 선택해주세요</option>
                                <option value="부재시 문앞에 놓아주세요">부재시 문앞에 놓아주세요</option>
                                <option value="배송전 미리 연락주세요">배송전 미리 연락주세요</option>
                                <option value="부재시 경비실에 맡겨 주세요">부재시 경비실에 맡겨 주세요 </option>
                                <option value="부재시 전화주시거나 문자 남겨 주세요">부재시 전화주시거나 문자 남겨 주세요 </option>
                            </select>
                        </section>
                    </div>
                </section>
                
                <br><br>
                
                <section class="section_box">
                    <section>
                        <div class="order_title">주문자</div>
                    </section>
                    
                    <div class="order_content">
                        <section class="section_box2">
                            <label class="section_label">
                                <div class="section_title">이름</div>
                                <input class="section_text" type="text" name="oname" id="oname"><br>
                            </label>
                            
                            <label class="section_label">
                                <div class="section_title">이메일</div>
	                                <input class="section_text" type="text" name="email1" id="email1" style="width: 150px" >   @
	                                <input class="section_text" type="text" name="email2" id="email2" style="width: 150px" >
	                                <select class="section_email" name="email" id="email" style="width: 130px" onChange="selectEmail(this)">
	                                    <option value="" selected>선택하세요</option>
	                                    <option value="naver.com">naver.com</option>
	                                    <option value="gmail.com">gmail.com</option>
	                                    <option value="daum.com">daum.com</option>
	                                    <option value="kakao.com">kakao.com</option>
	                                    <option value="nate.com">nate.com </option>
	                                    <option value="hanmail.com">hanmail.com</option>
	                                    <option value="1">직접입력</option>
	                                </select>
                            </label>

                            <label class="section_label">
                                <div class="section_title">휴대전화</div>
                                <select class="section_tel" name="tel2" id="tel2">
                                    <option value="1">선택</option>
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                                <input class="section_text3" type="text" name="tel3" id="tel3" placeholder="입력해주세요"><br>
                            </label>
                        </section>
                    </div>
                </section>
                
                <br><br>
	           <section class="section_box">
	             <section>
	                     <div class="order_title">주문상품</div>
	             </section>
               
    		    <!--상품정보 가져오기 -->
          	<%
          	
           		int sum = 0;
           		int price = 0;
           		int dis = 0;
         		HashMap<Integer, Integer> list = (HashMap<Integer, Integer>)session.getAttribute("cart");
            		
          		if(list == null){
					list = new HashMap<>();
					
          		} else {
          	
	          		Set<Integer> set=list.keySet();
	          		Iterator<Integer> it=set.iterator();
	       			ProductDAO dao = new ProductDAO();
	       			DecimalFormat df = new DecimalFormat("#원,##0");
	       			
	       			while(it.hasNext()){
	       				int key=it.next();
	       				ProductVO vo = dao.selectOne(key);
	       				int cnt = list.get(key);
	       				
	       				String pname = vo.getPname();
	       				String pt = "../"+vo.getPthumbnail();
	       				
	       				
	       				if(pname.length()>25){
	       					pname = pname.substring(0,25)+"...";
	       				}
            			
	       				/* 할인후 총상품금액 */
	       				sum += cnt*(Math.round(vo.getPprice()*(1-vo.getPdiscount()*0.01)));
	       				
	       				/* 원가 총상품금액  */
	       				price += cnt*(vo.getPprice());
	       				
        	%>  
        		
             
                    <div>
                        <section>
                        <div>
                        	<div class = "section_list" style="display: flex">
                            	<div style="display: inline-block;">
                              		<picture><img src="<%= pt %>" alt="" style="width: 200px", "height= 200px"></picture>
                              	</div>
                            <div>
	                            <div class="section_pname">상품명 : <%= pname%> </div>
								<div class="section_pname">할인가 : <%= df.format(Math.round(vo.getPprice()*(1-vo.getPdiscount()*0.01))) %></div>
								<div class="section_pname">수량 : <%= cnt%></div>
								<div class="section_pname"><strong>총상품 금액 : <%= df.format(cnt*(Math.round(vo.getPprice()*(1-vo.getPdiscount()*0.01)))) %></strong></div>
                           	</div>
                        </div>
                        </section>

                    </div>
                </section>
                
		             	<% 
		            		}
		            	%>	
            		
                <br><br>
                
                <section class="section_box">
                <section>
                    <div class="order_title">결제수단</div>
                </section>
                
                    <section>
                        <div>
                            <button type="button" class=""><picture><source type="image/webp" src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=144&amp;h=144&amp;c=c&amp;webp=1" srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=180&amp;h=180&amp;c=c&amp;webp=1 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=256&amp;h=256&amp;c=c&amp;webp=1 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=360&amp;h=360&amp;c=c&amp;webp=1 3x"><img alt="카카오페이 아이콘" class="" src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=144&amp;h=144&amp;c=c" srcset="https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=180&amp;h=180&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=256&amp;h=256&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=360&amp;h=360&amp;c=c 3x"></picture><div class="">카카오페이</div><div class="css-qdif5i e149t0mw0"></div></button>
                        </div>
                    </section>
                </section>
            </main>

            <!-- 결제주문관련  -->
            <div class="order">
                <div class="order_container">
                    <div class="order_container2">
                        
                        <div class="order_order">
                            <h2 class=""><strong>결제금액</strong></h2>
                            <div class="order_price">
                                <span class="">총 상품 금액</span>
                                <span class=""><%= df.format(price)%></span>
                            </div>
                            <div class="order_price">
                                <span class="">할인금액</span>
                                <span class=""><%= df.format(price-sum) %></span>
                            </div>
                            <div class="order_price">
                                <span class="">포인트 사용</span>
                                <span class="">0원</span>
                            </div>
                            <div class="order_price">
                                <span class="">배송비</span>
                                <span class="">무료</span>
                            </div>
                            <div class="final_price">
                                <span class="">최종 결제 금액</span>
                                <span class="order_price2"><strong><%= df.format(sum)%></strong></span>
                            </div>
                        </div>
          	<%
          		}
			%>

                        <div>
                            <div class="checkbox_2">
                                <div>
                                    <input type="checkbox" name="check_2" id="check_2">
                                    <span>
                                        개인정보 수집 이용 및 제 3자 제공 동의 (필수)
                                    </span>
                                <div>

                                <div class="checkbox_text">본인은 만 14세 이상이며, 주문 내용을 확인하였습니다.
                                    <div class="checkbox_text2">(주)yomozomo는 통신판매중개자로 거래 당사자가 아니므로, 판매자가 등록한 상품정보 및 거래 등에 대해 책임을 지지 않습니다. (단, ㈜yomozomo가 판매자로 등록 판매한 상품은 판매자로서 책임을 부담합니다).
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

            </div>
            
            <div>
                <br>
               	<button class="" type="submit" id="btn">원 결제하기</button>
            </div>
        </div>
        <!-- main end -->
		
		<% 	
		}
		%>
        
        <!-- footer -->
     	<%@ include file="/source/footer.jsp" %>
     	
	 </div>
</body>
</html>