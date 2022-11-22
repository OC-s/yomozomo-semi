<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device=widht, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
<title>Insert title here</title>
</head>
<style>
	#admin_addPro_table{
		position: relative;
		top:100px;
	}
</style>
<body>

<jsp:include page="/community/commu_header.jsp"/>

<div class="container">
		<form action="admin_addProOk.jsp" method="post" enctype="multipart/form-data">
			<table class="table table-bordered table-striped" id="admin_addPro_table">
				<tr>
					<td colspan="4">
					<h2>상품등록</h2>
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td><input type="text" name="P_CATEGORY" id="" /></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="P_NAME" id="" /></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="P_PRICE" id="" /></td>
				</tr>
				<tr>
					<th>할인</th>
					<td><input type="text" name="P_DISCOUNT" id="" /></td>
				</tr>
				<tr>
					<th>수량</th>
					<td><input type="text" name="P_STOCK" id="" /></td>
				</tr>
				<tr>
				<th>썸네일</th>
				<td><input type="file" name="P_THUMBNAIL" id="" /></td>
			   </tr>
			   <tr>
				<th>상세이미지</th>
				<td><input type="file" name="P_IMAGE" id="" /></td>
			   </tr>
			   
				<tr>
					<td colspan="4">					
						<input type="submit" value="상품등록" class="btn btn-outline-secondary" />
					</td>
				</tr>			
			</table>
		</form>
	</div>

<jsp:include page="/community/commu_footer.jsp"/>

</head>	

</body>
</html>