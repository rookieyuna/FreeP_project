package store;

import lombok.Data;
import orderlist.OrderlistVO;

@Data
public class StorechartVO {
	
	private int b_code;
	private String b_name;
	private int total_price;
	private int cp_price;
	private int po_price;
	private String credit;
	private java.sql.Date or_date;
	private String yearMonth;
	private String location;
}
