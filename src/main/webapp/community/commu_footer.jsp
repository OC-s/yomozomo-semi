<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YOMOZOMO</title>
<style>
/* html, body {
    margin: 0;
    padding: 0;
    height: 100%;
} */                             

#body-wrapper {
    position: relative;
    min-height: 100%;
    padding-bottom: 330px;
}

#footer{
	
    background-color: wheat;
    width: 100%;
    height: 270px;
    position: relative; 
    top:500px; 
    bottom: 0;
    left: 0;
    display: flex;
    justify-content: center;
}

.footer_box2{
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    overflow: hidden;
    padding-bottom: 10px;
}
.footer_box3{
    margin-right: 100px;
}

.footer_box4{
    display: flex;
    flex-direction: column;
}

.footer_box6{
    margin-top: 10px;
    display: flex;
    flex-direction: row;
    font-size: 10px;
}

.footer_btn{
    width: 80px;
    height: 40px;
    margin-right: 10px;
}

.footer_ul{
    display: flex;
    width: 100%;
    padding-bottom: 20px;
}
.footer_li{
    margin-right: 15px;
}

ul, li{
    list-style: none;
}

#footer_text{
    padding: 20px;
}


a{
    text-decoration: none;
    color:black;
}

</style>

</head>
 <body>
      <div id="footer" >
        <footer id="footer_text" >
          <div class="footer_box1" >
            <div class="footer_box2">
              <div class="footer_box3" >
                <h2>고객센터</h2>
                <strong class="">1666-7777<span class=""> 월~토요일 오전 7시 - 오후 6시</span></strong>
                <div class="footer_box5">
                  <div class="footer_box6"><button class="footer_btn">1:1 문의</button><div class="">365일<br>고객센터 운영시간에 순차적으로 답변드리겠습니다.</div></div>
                </div>
                <div class="footer_box6"><button class="footer_btn">대량주문 문의</button><div class="">평일 오전9시-오후6시<br>점심시간 오후1시-오후2시</div></div>
              </div>

              <div class="footer_box4">
                  <ul class="footer_ul">
                    <li class="footer_li"><a href="">yomozomo소개</a></li>
                    <li class="footer_li"><a href="">인재채용</a></li>
                    <li class="footer_li"><a href="">이용약관</a></li>
                    <li class="footer_li"><a href="">개인정보처리방침</a></li>
                    <li class="footer_li"><a href="">이용안내</a></li>
                  </ul>

                  <div class="">법인명 (상호) : 주식회사 yomozomo 
                    <span class=""></span> 사업자등록번호 : 222-22-22222
                  </div>

                  <ul class="footer_ul">
                      <li class="footer_li"><a href="" ><img src="../image/icon/icon1.webp" alt=""></a></li>
                      <li class="footer_li"><a href=""><img src="../image/icon/icon2.webp" alt=""></a></li>
                      <li class="footer_li"><a href=""><img src="../image/icon/icon3.webp" alt=""></a></li>
                      <li class="footer_li"><a href=""><img src="../image/icon/icon4.webp" alt=""></a></li>
                      <li class="footer_li"><a href=""><img src="../image/icon/icon5.webp" alt=""></a></li>
                  </ul>
            </div>
          </div>
         </div>
          <div style="font-size: 8px;" style="text-align: center;" >yomozomo에서 판매되는 상품 중에는 yomozomo에 입점한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다.<br>마켓플레이스(오픈마켓) 상품의 경우 컬리는 통신판매중개자로서 통신판매의 당사자가 아닙니다. 컬리는 해당 상품의 주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.<em class="">© yomozomo CORP. ALL RIGHTS RESERVED</em></div>
        </footer>
      </div>
  </body>
  </html>