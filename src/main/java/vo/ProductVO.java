package vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO {

	int pnum;
	String pname;
	int pprice;
	int pdiscount;
	int pstock;
	String pcategory;
	String pthumbnail;
	String pimage;
}