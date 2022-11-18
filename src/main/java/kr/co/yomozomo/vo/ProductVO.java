package kr.co.yomozomo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO {
	int P_NUM;
	String P_NAME;
	int P_PRICE;
	int P_DISCOUNT;
	String P_CATEGORY;
	String P_THUMBNAIL;
	String P_IMAGE;
}
