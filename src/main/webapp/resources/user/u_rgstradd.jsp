<%@page import="kr.co.yomozomo.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.yomozomo.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin | 회원관리</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
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
					
					document.getElementById("ZIPCODE").value=data.zonecode;
					document.getElementById("ADDRESS").value=data.roadAddress;
				}
			}).open();
		}
		    
	</script>
  
  <!-- 작성 체크 -->
  <script type="text/javascript">
	  function Checkform(){
		 	if(NAME.value ==""){
		 		NAME.focus();
				alert('이름을 입력해주세요');
				return false
			}
			if(ID.value ==""){
				ID.focus();
				alert('ID를 입력해주세요');
				return false
			}
			if(PASSWORD.value ==""){
				tel.focus();
				alert('비밀번호를 입력해주세요');
				return false
			}
			if(PHONE.value ==""){
				PHONE.focus();
				alert('전화번호를 입력해주세요');
				return false
			}
			if(EMAIL.value ==""){
				EMAIL.focus();
				alert('이메일을 입력해주세요');
				return false
			}
			if(NICKNAME.value ==""){
				NICKNAME.focus();
				alert('닉네임을 입력해주세요');
				return false
			}
			if(EMAIL.value ==""){
				EMAIL.focus();
				alert('이메일을 입력해주세요');
				return false
			}
			
			if(ZIPCODE.value =="" || ADDRESS.value ==""){
				ZIPCODE.focus();
				alert('주소를 찾아주세요');
				return false
			} 
			
			if(ADDRESSDETAIL.value == ""){
				ADDRESSDETAIL.focus();
				alert('상세주소를 입력해주세요');
				return false
			}
	  }
  </script>
  
  
  <style type="text/css">
  	#table_add{
  		position: relative;
		top:100px;
  	}
  </style>
  
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!--  -->
   <a href="../adpage.jsp" class="brand-link">
      <img src="../../image/icon/logo.png" alt="" class="brand-image" style="opacity: .8">
      <span class="brand-text font-weight-light"></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
        </div>
        <div class="info">
          <a href="#" class="d-block" style="text-align: center;">admin</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="../../admin/main.jsp" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                쇼핑몰 홈
                <span class="right badge badge-danger">New</span>
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="../adpage.jsp" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
          
          
          <!-- 회원관리 -->
          <li class="nav-item  menu-open" >
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tree"></i>
              <p>
               회원관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원 등록</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="u_mngmn.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원목록 조회,수정</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="u_sales" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원매출 조회</p>
                </a>
              </li>
            </ul>
          </li>
        <!-- 회원관리 end -->
        
          <!-- 게시판 관리 -->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tree"></i>
              <p>
               게시판 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
             <li class="nav-item">
                <a href="../board/c_mngmn.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>고양이자랑게시판 댓글 관리</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="../board/qac_mngmn.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>질문게시판 댓글 관리</p>
                </a>
              </li>
             <li class="nav-item">
                <a href="../board/b_mngmn1.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>고양이자랑게시판 조회,수정</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../board/b_mngmn2.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>질문게시판목록 조회,수정</p>
                </a>
              </li>
            </ul>
          </li>
        <!-- 게시판 end -->
          
          <!-- 쇼핑몰 관리 -->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tree"></i>
              <p>
               쇼핑몰 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
             
              <li class="nav-item">
                <a href="../ymzm/p_mngmn.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>상품 관리</p>
                </a>
              </li>
              
              <li class="nav-item">
                <a href="../ymzm/q_mngmn.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>문의 관리</p>
                </a>
              </li>
            </ul>
          </li>
        <!-- 쇼핑몰 end -->
        
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>회원관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">회원관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
	<div class="container">
    	<form action="u_rgstraddOk.jsp" method="post" onsubmit="return Checkform()">
    		<table class="table table-bordered"  id="table_add">
	    		<tr>
	    			<td colspan="9">
	    				<h2>회원등록</h2>
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>이름</th>
	    			<td><input type="text" name="NAME" id="NAME" /></td>
	    		</tr>
	    		<tr>
	    			<th>ID</th>
	    			<td><input type="text" name="ID" id="ID"/></td>
	    		</tr>
	    		<tr>
	    			<th>비밀번호</th>
	    			<td><input type="text" name=PASSWORD id="PASSWORD" /></td>
	    		</tr>
	    		<tr>
	    			<th>전화번호</th>
	    			<td><input type="text" name=PHONE id="PHONE"/></td>
	    		</tr>
	    		<tr>
	    			<th>이메일</th>
	    			<td><input type="text" name=EMAIL id="EMAIL"/></td>
	    		</tr>
	    		<tr>
	    			<th>닉네임</th>
	    			<td><input type="text" name=NICKNAME id="NICKNAME"/></td>
	    		</tr>
	    		<tr>
	    			<th>우편번호</th>
	    			<td>
	    				<button class="section_btn" type="button" value="주소찾기" id="btn2" style="border: 1px solid black;">주소찾기</button>
	    				<input type="text" name=ZIPCODE id="ZIPCODE" style="width: 100px;"/>
    				</td>
	    		</tr>
	    		<tr>
	    			<th>주소</th>
	    			<td><input type="text" name=ADDRESS id="ADDRESS" style="width: 250px;"/></td>
	    		</tr>
	    		<tr>
	    			<th>상세주소</th>
	    			<td><input type="text" name=ADDRESSDETAIL id="ADDRESSDETAIL" style="width: 250px;"/></td>
	    		</tr>
	    		<tr>
					<td colspan="2" style="text-align: left;">
						<input type="submit" value="회원등록" />
						<a href="u_rgstr.jsp"><input type="button" value="취소" /></a>
					</td>
				</tr>
    		</table>
    	</form>
 	</div>    	
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.2.0
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
</body>
</html>
