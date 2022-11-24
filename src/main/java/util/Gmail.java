package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

//실제 gmail smtp를 이용하기 위한 계정정보 넣기
public class Gmail extends Authenticator {
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("vmfwprxptmxm@gmail.com", "15948pj*");
	}
	
	
}
