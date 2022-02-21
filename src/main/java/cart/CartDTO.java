package cart;


import java.util.List;

import lombok.Data;

@Data
public class CartDTO {

	private int ct_idx;
	private int m_code;
	private int ct_code;
	private String ct_name;
	private int ct_count;
	private String p_price;
	private String p_size;
	private String p_sfile;
	private String d_price;
	private String p_name;
	
	private int dough;
	private String dough_name;
	private String dough_price;
	private String dough_size;
	private int sauce;
	private String sauce_name;
	private String sauce_price;
	private String sauce_size;	
	
	private List<String> toppinglist;
	private int topping1;
	private String topping1_name;
	private String topping1_price;
	private String topping1_size;	
	private int topping2;
	private String topping2_name;
	private String topping2_price;
	private String topping2_size;
	private int topping3;
	private String topping3_name;
	private String topping3_price;
	private String topping3_size;
	private int topping4;
	private String topping4_name;
	private String topping4_price;
	private String topping4_size;
	private int topping5;
	private String topping5_name;
	private String topping5_price;
	private String topping5_size;
	
}
