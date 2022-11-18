package kr.co.yomozomo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentsVO {
	
	int B_NUM;
	String C_CONTENTS;
	int C_NUM;
	String C_REGDATE;
	String C_SECRET;
	int M_NUM;

	
	

}
