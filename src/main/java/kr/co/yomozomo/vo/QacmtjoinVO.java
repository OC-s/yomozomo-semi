package kr.co.yomozomo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QacmtjoinVO {
	
	int M_NUM;
	int QAB_NUM;
	String QAC_CONTENTS;
	int QAC_NUM;
	String QAC_REGDATE;
	String QAC_SECRET;
	
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
