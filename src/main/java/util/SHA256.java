package util;

import java.security.MessageDigest;

//가입할 때 입력한 이메일 주소를 해시처리한 값과 
//인증을 시도하는 이메일을 해시처리한 값을 비교해 사용자 인증을 하기 위한 파일
public class SHA256 {
	
	public static String getSHA256(String input) {
		StringBuffer result =new StringBuffer();
		try {
			MessageDigest digest=MessageDigest.getInstance("SHA-256");
			
			//해킹방지를 위한 솔트
			byte[] salt="Hello! This is Salt.".getBytes();
			digest.reset();
			//솔트값 적용
			digest.update(salt);
			//해시값을 chars에 담아주기
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			for(int i=0; i<chars.length; i++) {
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
