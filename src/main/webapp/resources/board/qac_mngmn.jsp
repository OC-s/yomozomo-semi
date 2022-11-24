<%@page import="kr.co.yomozomo.vo.QacmtjoinVO"%>
<%@page import="kr.co.yomozomo.dao.QacommentsDAO"%>
<%@page import="kr.co.yomozomo.dao.CommentsDAO"%>
<%@page import="kr.co.yomozomo.vo.CmtjoinVO"%>

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin | 댓글목록</title>

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
                <a href="#" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>질문게시판 댓글 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="b_mngmn1.jsp" class="nav-link">
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
                <a href="../ymzm/o_mngmn.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>주문 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../ymzm/p_mngmn.jsp" class="nav-link ">
                  <i class="far fa-circle nav-icon"></i>
                  <p>상품 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../ymzm/r_mngmn.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>리뷰 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../ymzm/q_mngmn" class="nav-link">
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
            <h1>댓글관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">댓글목록</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <%
	int startNo2 = 0;
	int endNo2 = 0;
	int currentPage = 0;
	int currentBlock = 0;
	int totalCount = 0;
	int totalPage = 0;
	int recoredPerPage = 0;
	int startPage = 0;
	int endPage = 0;

	//현재 페이지
	String cp = request.getParameter("cp");
	if (cp != null) {
		currentPage = Integer.parseInt(cp);
	} else {
		currentPage = 1;
	}

	//1페이지당 게시물 수		
	recoredPerPage = 10;

	startNo2 = (currentPage - 1) * recoredPerPage + 1;
	
	endNo2 = 10;

	//총게시물수
	QacommentsDAO dao = new QacommentsDAO();

	totalCount = dao.getTotal();

	//총 페이지
	totalPage = (totalCount % recoredPerPage == 0) ? totalCount / recoredPerPage : totalCount / recoredPerPage + 1;

	//시작페이지 번호	
	startPage = 1;

	//끝페이지 번호
	endPage = totalPage;

	//시작페이지 미세조정
	if (currentPage <= 5) {
		startPage = 1;
	} else if (currentPage >= 6) {
		startPage = currentPage - 4;
	}

	//끝페이지 미세조정
	if (totalPage - currentPage <= 5) {
		endPage = totalPage;
	} else if (totalPage - currentPage > 5) {
		if (currentPage <= 5) {
			if (totalPage > 10) {
		endPage = 10;
			} else {
		endPage = totalPage;
			}
		} else {
			endPage = currentPage + 4;
		}
	}
	%>
	
		<div class="container">
		<div class="row">
			<table class="table table-bordered"
				style="position: relative; text-align: center; border: 1px solid #dddddd; margin-top: 50px;">
				<thead>

					<tr>
						<td colspan="6">
							<h2>질문게시판 댓글목록</h2>						
						</td>
					</tr>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">댓글번호</th>
						<th style="background-color: #eeeeee; text-align: center;">게시글번호</th>
						<th style="background-color: #eeeeee; text-align: center;">회원아이디</th>
						<th style="background-color: #eeeeee; text-align: center;">댓글내용</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일시</th>
						<th style="background-color: #eeeeee; text-align: center;">삭제</th>
						
					</tr>
				</thead>
				<%
				ArrayList<QacmtjoinVO> list = dao.joinpageAll(startNo2, endNo2);
				for (QacmtjoinVO vo : list) {
				%>
				
				<tbody>
					<tr>
						<td><%=vo.getQAC_NUM()%></td>
						<td><%=vo.getQAB_NUM() %></td>
						<td><%=vo.getID() %></td>
						<td><a href="/yomozomo/community/qa_detail.jsp?qab_num=<%=vo.getQAB_NUM()%>"><%=vo.getQAC_CONTENTS()%></a></td>
						<td><%=vo.getQAC_REGDATE()%></td>
			
						<td>
							
							<a href="/yomozomo/community/qa_comments_deleteOk.jsp?qab_num=<%=vo.getQAB_NUM()%>&qac_num=<%=vo.getQAC_NUM()%>">
							<input type="button" value="삭제" />
							</a>						
						</td>
	
					</tr>
				<%
				}
				%>
					
				</tbody>
			</table>
		</div>
	</div>

	<div class="container" id="admin_list_all_container">
		<table class="table table-bordered" style="border: transparent;">
			<tr>
				<td colspan="4">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<%
							if (startPage == 1) {
							%>
							<li class="page-item"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>
							<%
							} else {
							%>
							<li class="page-item"><a class="page-link"
								href="qac_mngmn.jsp?cp=<%=startPage - 1%>" tabindex="-1"
								aria-disabled="true">Previous</a></li>
							<%
							}
							%>
							<%
							for (int i = startPage; i <= endPage; i++) {
							%>
							<li class="page-item"><a class="page-link"
								href="qac_mngmn.jsp?cp=<%=i%>"><%=i%></a></li>
							<%
							}
							%>
							<%
							if (totalPage == endPage) {
							%>
							<li class="page-item disalbed "><a class="page-link"
								href="#">Next</a></li>
							<%
							} else {
							%>
							<li class="page-item"><a class="page-link"
								href="qac_mngmn.jsp?cp=<%=endPage + 1%>">Next</a></li>
							<%
							}
							%>
						</ul>
					</nav>
				</td>
			</tr>			
		</table>
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
