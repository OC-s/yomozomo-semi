<%@page import="kr.co.yomozomo.dao.MemberDAO"%>
<%@page import="kr.co.yomozomo.vo.MemberVO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Object obj=session.getAttribute("vo");
PrintWriter script = response.getWriter();

request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

if(obj!=null){
	String password=request.getParameter("pw");
	String email=request.getParameter("email1")+"@"+request.getParameter("email2");
	String nickname=request.getParameter("nickname");
	String phone=request.getParameter("phone");
	String zipcode=request.getParameter("zipcode");
	String address=request.getParameter("address");
	String addrsDetail=request.getParameter("addrsDetail");
	
	MemberVO vo=(MemberVO)obj;

	int mnum=vo.getM_NUM();

	MemberDAO dao=new MemberDAO();
	vo.setPASSWORD(password);
	vo.setEMAIL(email);
	vo.setNICKNAME(nickname);
	vo.setPHONE(phone);
	vo.setZIPCODE(zipcode);
	vo.setADDRESS(address);
	vo.setADDRESSDETAIL(addrsDetail);
	dao.updateOne1(vo);
	dao.close();
	
	script.println("<script>");
	script.println("alert('회원정보 수정이 완료되었습니다.')");
	script.println("location.href = '../main/main.jsp'");
	script.println("</script>");

}else{
	script.println("<script>");
	script.println("alert('로그인 후 이용 가능합니다.')");
	script.println("location.href = '../login/login.jsp'");
	script.println("</script>");
}
%>