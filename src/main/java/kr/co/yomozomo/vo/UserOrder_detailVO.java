package kr.co.yomozomo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserOrder_detailVO {
	int O_NUM;
	int P_NUM;
	int OD_COUNT;
	int OD_PRICE;
}
