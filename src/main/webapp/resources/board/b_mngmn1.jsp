<%@page import="kr.co.yomozomo.dao.BoardDAO"%>
<%@page import="kr.co.yomozomo.vo.BoardVO"%>
<%@page import="vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style>
td#paging{
	text-align: center;
}
</style>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin | 게시판관리</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
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
          <li class="nav-item" >
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tree"></i>
              <p>
               쇼핑몰 회원관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../user/u_rgstr.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원 등록</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../user/u_mngmn.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원목록 조회,수정</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../user/u_sales" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원매출 조회</p>
                </a>
              </li>
            </ul>
          </li>
        <!-- 회원관리 end -->
        
          <!-- 게시판 관리 -->
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tree"></i>
              <p>
               게시판 관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="c_mngmn.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>고양이자랑게시판 댓글 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="qac_mngmn.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>질문게시판 댓글 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>고양이자랑게시판 조회,수정</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="b_mngmn2.jsp" class="nav-link">
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
            <h1>게시판관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">게시판관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
    <%
    //현재 페이지 번호값
    String cp=request.getParameter("cp");
    
    //페이지 번호 담아줄 변수
    int currentPage=0;
    
    //만약 cp가 0이 아니면
    if(cp!=null){
    	//만들어준 페이지 번수에 얻어온 파라미터 값을 형변환해서 담아줌
    	currentPage=Integer.parseInt(cp);
    	
    	//파라미터 값이 null이면(==처음 페이지면)
    }else{
    	//페이지번호는 무조건 1로 주기
    	currentPage=1;
    }
    
    //1페이지당 게시물 수 10개로 설정
    int recordPerPage=10;
    
    int startNo=(currentPage-1)*recordPerPage+1;
    
    //끝번호
    int endNo=currentPage*recordPerPage;
    
    //총 게시물 수 알아오기
    BoardDAO dao=new BoardDAO();
    int totalCount=dao.getTotal();
    
    int totalPage=(totalCount%recordPerPage==0)? totalCount/recordPerPage:totalCount/recordPerPage+1;
    
    //시작페이지 번호
    int startPage=1;
    //끝페이지
    int endPage=totalPage;
    
  //시작 페이지 미세조정
  	if(currentPage<=5){
  		startPage=1;
  	}else if(currentPage>=6){
  		startPage = currentPage-4;
  	}
  	
  	//끝 페이지 미세조정
  	if(totalPage-currentPage<=5){
  		endPage=totalPage;
  	}else if(totalPage-currentPage>5){
  		if(currentPage<=5){
  			if(totalPage>10){
  				endPage=10;
  			}else{
  				endPage=totalPage;
  			}
  		}else{
  			endPage=currentPage+4;
  		}
  	}
  	
  	//previous, next버튼 보일지 안 보일지 정해줄 변수 설정
  	boolean isPre = false;
  	boolean isNext = false;
  	
  	//이전값이 존재하면 true
  	//다음값이 존재하면 true
  	
  	//현재페이지번호에서 6을 뺀 값이 0 이상이면 이전값이 존재
  	//6페이지부터 previous버튼이 보이도록 하기
  	if(currentPage-5> 0){
  		isPre=true;
  	}

  	//현재 페이지 번호에서 5를 더한 값이 끝페이지 번호보다 작으면 다음값이 존재
  	//38페이지부터 next버튼이 보이도록 하기
  	if(currentPage+5 <=totalPage){
  		isNext=true;
  	}

    %>
    
    <div class="container">
		<div class="row">
			<table class="table table-bordered"
				style="position: relative; text-align: center; border: 1px solid #dddddd; margin-top: 50px;">
				<thead>
					<tr>
						<td colspan="11">
							<h2>고양이자랑해요 게시글 전체목록</h2>						
						</td>
					</tr>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">회원번호</th>
						<th style="background-color: #eeeeee; text-align: center;">게시글 번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">내용</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일시</th>
						<th style="background-color: #eeeeee; text-align: center;">이미지</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
						<th style="background-color: #eeeeee; text-align: center;">삭제</th>
						<th style="background-color: #eeeeee; text-align: center;">수정</th>
					</tr>
				</thead>
				<%
				ArrayList<BoardVO> list =dao.selectAll(startNo, endNo);
				for(BoardVO vo : list){
				%>
				
				<tbody>
						<tr>
							<td><%=vo.getM_NUM()%></td>
							<td><%=vo.getB_NUM()%></td>
							<td><%=vo.getB_TITLE()%></td>
							<td><%=vo.getB_CONTENTS() %></td>
							<td><%=vo.getB_REGDATE()%></td>
							<td><%=vo.getB_IMAGE()%></td>
							<td><%=vo.getB_HIT()%></td>
							<td>
								<form action="deleteBoard.jsp">
									<button type="submit" class="btn btn-danger">삭제</button>
									<input type="hidden" name="bnum" value=<%=vo.getB_NUM() %> />
								</form>
							</td>
							<td>
								<form action="modifyBoard.jsp">
									<button type="submit" class="btn btn-success">수정</button>
									<input type="hidden" name="bnum" value=<%=vo.getB_NUM() %> />
								</form>
							</td>
						</tr>
				<%
				}
				dao.close();
				%>
				<tr>
					<td colspan="8"></td>
				</tr>
				<tr>
					<td id="paging" colspan="8">
						<nav aria-label="Page navigation example">
  							<ul class="pagination">
  				<%
  				if(isPre){
  				%>
  					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
  				<%
  				}
  				%>
  				<%
  					for(int i=startPage;i<=endPage;i++){
  				%>
  					<li class="page-item"><a class="page-link" href="b_mngmn1.jsp?cp=<%=i%>"><%=i %></a></li>
				<%
  					}
				%>
				<%
				if(isNext){
				%>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				<%
				}
				%>
					</ul>
				</nav>
			</td>
		</tr>
		<tr>
			<td colspan="8">
				<a href="addBoard.jsp"><button type="button" class="btn btn-secondary">게시글 추가</button></a>
			</td>
		</tr>
	</tbody>
	</table>
	</div>
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
