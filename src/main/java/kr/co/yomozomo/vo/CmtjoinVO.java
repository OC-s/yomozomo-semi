package kr.co.yomozomo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CmtjoinVO {

	int B_NUM;
	String C_CONTENTS;
	int C_NUM;
	String C_REGDATE;
	String C_SECRET;
	int M_NUM;

	
	String ADDRESS;
	String ADDRESSDETAIL;
	String EMAIL;
	String ID;
	String NAME;
	String NICKNAME;
	String PASSWORD;
	String PHONE;
	String REGDATE;
	String ZIPCODE;
	
}
