package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	
	int mnum;
	String id;
	String password;
	String email;
	String nickname;
	String regdate;
	String phone;
	String name;
	String zipcode;
	String address;
	String addrsDetail;
}
