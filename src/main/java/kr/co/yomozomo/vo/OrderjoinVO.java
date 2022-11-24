package kr.co.yomozomo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderjoinVO {
	String O_NAME;
	String P_NAME;
	String O_DATE;
	String O_STATUS;
	int O_TOTAL;

}
