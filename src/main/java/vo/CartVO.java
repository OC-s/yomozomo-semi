package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartVO {
	
	int cartnum;
	int mnum;
	int pnum;
	String pname;
	int count;
	int price;
}
