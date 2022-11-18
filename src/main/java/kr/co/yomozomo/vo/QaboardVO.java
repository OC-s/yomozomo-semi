package kr.co.yomozomo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QaboardVO {
	
	int M_NUM;
	String QAB_CONTENTS;
	int QAB_HIT;
	String QAB_IMAGE;
	int QAB_NUM;
	String QAB_REGDATE;
	String QAB_TITLE;

}
