<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.io.File" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	//upload 디렐토리 실제경로얻어오기
	String saveDir = application.getRealPath("/image");
	//out.println(saveDir);
	
	String realFolder = "C:\\Users\\gkw\\git\\yomozomo\\src\\main\\webapp\\image";
	
	//첨부파일의 최대 크기
	int maxFileSize = 1024*1024*10;
	
	//파라미터값가져오기
	MultipartRequest mr = new MultipartRequest(request,realFolder,maxFileSize,"UTF-8",new DefaultFileRenamePolicy());
	
	String P_CATEGORY = mr.getParameter("P_CATEGORY");
	String P_NAME = mr.getParameter("P_NAME");
	String P_PRICEno = mr.getParameter("P_PRICE");
	String P_DISCOUNTno = mr.getParameter("P_DISCOUNT");
	String P_STOCKno = mr.getParameter("P_STOCK");
		
	
	String P_THUMBNAIL = mr.getOriginalFileName("P_THUMBNAIL");
	
	String P_THUMBNAIL2 = mr.getFilesystemName("P_THUMBNAIL"); 
	
	String P_IMAGE = mr.getOriginalFileName("P_IMAGE");
	
	String P_IMAGE2 = mr.getFilesystemName("P_IMAGE"); 
	
	if(P_CATEGORY != null && P_NAME != null ){
		
		int P_PRICE = Integer.parseInt(P_PRICEno);
		int P_DISCOUNT = Integer.parseInt(P_DISCOUNTno);
		int P_STOCK = Integer.parseInt(P_STOCKno);
		
		ProductDAO dao = new ProductDAO();
		
		ProductVO vo = new ProductVO();
			
		vo.setPname(P_NAME);
		vo.setPcategory(P_CATEGORY);
		vo.setPprice(P_PRICE);
		vo.setPdiscount(P_DISCOUNT);
		vo.setPstock(P_STOCK);
		vo.setPthumbnail("image/"+P_THUMBNAIL);
		vo.setPimage("image/"+P_IMAGE);
		
		
		
		dao.insertOne(vo);
		
		response.sendRedirect("/yomozomo/resources/ymzm/p_mngmn.jsp");
	}


%>


</body>
</html>