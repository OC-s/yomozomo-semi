package kr.co.yomozomo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderVO {
	int M_num;
	String O_DATE;
	String O_ZIPCODE;
	String O_ADDRESS;
	String O_ADDRESSDETAIL;
	String O_NAME;
	String O_PHONE;
	String O_STATUS;
	int O_TOTAL;
	String O_EMAIL;
	String O_ADDNAME;
	String O_ADDNAME2;
	String O_ADDTEL;
	
}
