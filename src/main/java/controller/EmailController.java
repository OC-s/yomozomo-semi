package controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login/search/email")
public class EmailController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Properties p = new Properties();
		String memerber = req.getParameter("email");
		p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.host", "smtp.naver.com");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.port", "587");
		Session session = Session.getInstance(p, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				//보내는 관리자 email, password
				return new PasswordAuthentication("yomozomo99999@naver.com", "yomozomo!");
				
			}
		});
		
		String receiver = memerber; // 메일 받을 주소
		String title = "yomozomo 인증번호 입니다.";

		String num ="12345678"; // 인증번호 -> 나중에 랜덤난수 설정
		Message message = new MimeMessage(session);
		try {
//			보내는 사람 정보 
			message.setFrom(new InternetAddress("yomozomo99999@naver.com", "yomozomo", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(num,"text/html; charset=utf-8");
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		 req.setAttribute("num", num);
		 req.getRequestDispatcher("/login/search.jsp").forward(req, res);
		 
		}
	}
		
