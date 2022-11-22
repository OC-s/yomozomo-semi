<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function(){
		$("#idBtn").on("click", idCheck);
		
		$("#id").on("keyup", function(){
			$("#idCheck").html("");
		});
		
		$("#mytype li > a").on("click", function() {
		    // 버튼에 선택된 항목 텍스트 넣기 
		    $("#email2").val($(this).text());
		});
		
		$("#rePw").on("change keyup paste", function(){
			if($("#pw").val()==$("#rePw").val()){
				$("#pwCheck").html("비밀번호가 일치합니다.");
			}else{
				$("#pwCheck").html("비밀번호가 일치하지 않습니다.");
			}
		});
		
		$("#searchAddrs").on("click", execDaumPostcode);
		
		$("#emailbtn").on("click", function(){
			location.href=".../java/util/UserController.java";
		});
	});
	
	function idCheck(){
		var txt = $("#id").val().trim();
		
		if(txt==""){
			alert("id를 입력하세요.");
			return false;
		}
		
		var regid= /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
		if(!regid.test(txt)){
			alert("아이디는 4~12자의 영문 또는 숫자 조합으로 적어야 합니다.");
			$("#id").focus();
			return false;
		}
		
		//json방식으로 ajax해보기
		$.ajax({
			type : "GET",
			async : true, //비동기화방식으로
			url : "idCheckup.jsp", //찾아갈 url
			dataType : "html", //받을 데이터 타입
			data : {"id" : txt}, //전송할 데이터
			success : function(response, status, request) {
				console.log(response);
				var msg = response.trim();
				if(msg == "false") {
					$("#idCheck").html("사용 가능합니다.");
				} else if(msg == "true"){
					$("#idCheck").html("id가 존재합니다.");
					return false;
				}
			}
		});
		
		return true;
	}
	
	function execDaumPostcode(){
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addrsDetail").focus();
            }
        }).open();
	}
	
	function checkAll(){
		if(!checkId($("#id").val())){
			return false;
		}else if(!checkEmail($("#email1").val(), $("#email2").val())){
			return false;
		}else if(!checkPw($("#pw").val(), $("#rePw").val())){
			return false;
		}else if(!checkNickname($("#nickname").val())){
			return false;
		}else if(!checkName($("#name").val())){
			return false;
		}else if(!checkPhone($("#phone").val())){
			return false;
		}else if(!checkAddress($("#zipcode").val(), $("#addrsDetail").val())){
			return false;
		}
		return true;
	}
	
	function checkExist(value, msg){
		if(value==""){
			alert(msg+" 입력하세요.");
			return false;
		}
		return true;
	}
	
	function checkId(id){
		if(!checkExist(id, "아이디를")){
			return false;
		}
		
		if($("#idCheck").text()==""){
			alert("아이디 중복확인을 하세요.");
			return false;
		}else if($("#idCheck").text()=="id가 존재합니다."){
			alert("다른 id를 사용하세요.");
			$("#id").focus();
			return false;
		}
		
		return true;
	}
	
	function checkEmail(em1, em2){
		if(!checkExist(em1, "이메일 아이디를")){
			$("#email1").focus();
			return false;
		}
		if(!checkExist(em2, "이메일 주소를")){
			$("#email2").focus();
			return false;
		}
		return true;
	}
	
	function checkPw(pw1, pw2){
		if(!checkExist(pw1, "비밀번호를")){
			$("#pw").focus();
			return false;
		}
		
		if(!checkExist(pw2, "비밀번호 확인을")){
			$("rePw").focus();
			return false;
		}
		
		if(pw1!=pw2){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		var regpw=/^[a-zA-z0-9]{4,12}$/;
		if(!regpw.test(pw1)){
			alert("비밀번호는 4~12자의 영문 대소문자 또는 숫자로 입력해야합니다.");
			return false;
		}
		
		if($("#id").val()==$("#pw").val()){
			alert("아이디와 비밀번호는 같을 수 없습니다.");
			$("#pw").focus();
			return false;
		}
		
		return true;
	}
	
	function checkNickname(nickname){
		if(!checkExist(nickname, "닉네임을")){
			$("#nickname").focus();
			return false;
		}
		
		var regnickname=/^[가-힣a-zA-Z0-9]{2,10}$/;
		if(!regnickname.test(nickname)){
			alert("닉네임은 2~10자 이내의 한글, 숫자, 영문만 입력 가능합니다.");
			$("#nickname").focus();
			return false;
		}
		return true;
	}
	
	function checkName(name){
		if(!checkExist(name, "이름을")){
			$("#name").focus();
			return false;
		}
		
		var regname=/^[가-힣]{2,4}$/;
		if(!regname.test(name)){
			alert("이름은 2~4자 이내의 한글만 입력 가능합니다.");
			$("#name").focus();
			return false;
		}
		return true;
	}
	
	function checkPhone(phone){
		if(!checkExist(phone, "전화번호를")){
			$("#phone").focus();
			return false;
		}
		
		var regphone=/^[0-9]{8,11}$/;
		if(!regphone.test(phone)){
			alert("전화번호는 8~11자 이내의 숫자만 입력 가능합니다.");
			$("#phone").focus();
			return false;
		}
		return true;
	}
	
	function checkAddress(zipcode, addrsDetail){
		if(!checkExist(zipcode, "주소를")){
			$("#zipcode").focus();
			return false;
		}
		
		if(!checkExist(addrsDetail, "상세주소를")){
			$("#addrsDetail").focus();
			return false;
		}
		return true;
	}
	
	
</script>

<link rel="stylesheet" href="../css/footer.css">
<style>
div.container{
	width: 500px;
}
a{
	text-decoration: none;
}
div#logo{
	text-align: center;
	font-size: 30px;
	color: #4285F4;
	padding-top: 30px;
}
div#regist{
	text-align: center;
	padding-bottom: 30px;
}
div#idCheck{
	font-size: 9px;
	margin-bottom: 15px;
}
div#pwCheck{
	font-size: 9px;
	margin-bottom: 15px;
}
div#button{
	text-align: center;
	margin: 30px 0px;
}
</style>
</head>
<body>
<div class="container">
	<div id="logo">
		<a href="../main/main.jsp" >YOMOZOMO</a>
	</div>
	<div id="regist">회원가입</div>
<form action="registOk.java" method="post" onsubmit="return checkAll()">
	<h6>아이디</h6>
	<div class="input-group mb-3">
		<input type="text" id="id" name="id" class="form-control" placeholder="아이디" aria-label="Recipient's username" aria-describedby="button-addon2">
  		<button id="idBtn" class="btn btn-outline-secondary" type="button" id="button-addon2">중복확인</button>
	</div>
	<div id="idCheck"></div>
	<h6>이메일</h6>
	<div class="input-group mb-3">
		<input type="text" id="email1" name="email1" class="form-control" placeholder="이메일 아이디" aria-label="Recipient's username" aria-describedby="button-addon2">
  		&nbsp;@&nbsp;
  		<input type="text" id="email2" name="email2" class="form-control" aria-label="Text input with dropdown button" placeholder="이메일 주소">
  		<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"></button>
  		<ul id="mytype" class="dropdown-menu dropdown-menu-end">
    		<li><a class="dropdown-item" href="#">naver.com</a></li>
    		<li><a class="dropdown-item" href="#">gmail.com</a></li>
    		<li><a class="dropdown-item" href="#">daum.net</a></li>
    		<li><a class="dropdown-item" href="#">hanmail.net</a></li>
  		</ul>
	</div>
	<div id="emailBtn">
		<button id="emailbtn" type="button" class="btn btn-light">이메일 인증하기</button>
	</div>
	<h6>비밀번호</h6>
	<div class="input-group mb-3">
		<input type="password" id="pw" name="pw" class="form-control" aria-label="Text input with dropdown button" placeholder="비밀번호 입력">
	</div>
	<h6>비밀번호 확인</h6>
	<div class="input-group mb-3">
		<input type="password" id="rePw" name="rePw" class="form-control" aria-label="Text input with dropdown button" placeholder="비밀번호 확인">
	</div>
	<div id="pwCheck"></div>
	<h6>닉네임</h6>
	<div class="input-group mb-3">
		<input type="text" id="nickname" name="nickname" class="form-control" aria-label="Text input with dropdown button" placeholder="닉네임 입력">
	</div>
	<h6>이름</h6>
	<div class="input-group mb-3">
		<input type="text" id="name" name="name" class="form-control" aria-label="Text input with dropdown button" placeholder="이름 입력">
	</div>
	<h6>전화번호</h6>
	<div class="input-group mb-3">
		<input type="text" id="phone" name="phone" class="form-control" aria-label="Text input with dropdown button" placeholder="하이픈(-)없이 입력">
	</div>
	<h6>주소</h6>
	<div class="input-group mb-3">
		<input type="text" id="zipcode" name="zipcode" class="form-control" placeholder="우편번호" aria-label="Recipient's username" aria-describedby="button-addon2" readonly>
  		<button class="btn btn-outline-secondary" type="button" id="searchAddrs">주소찾기</button>
  	</div>
  	<div class="input-group mb-3">
  		<input type="text" id="address" name="address" class="form-control" aria-label="Text input with dropdown button" placeholder="주소입력" readonly>
  	</div>
  	<div class="input-group mb-3">
  		<input type="text" id="addrsDetail" name="addrsDetail" class="form-control" aria-label="Text input with dropdown button" placeholder="상세주소 입력">
	</div>
	<div id="button">
		<button type="submit" class="btn btn-primary">회원가입하기</button>
		<a href="../main/main.jsp"><button type="button" class="btn btn-secondary">취소하기</button></a>
	</div>
</form>

</div>
</head>
<body>

</html>