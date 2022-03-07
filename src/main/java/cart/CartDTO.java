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
	
	private List<Integer> toppinglist;
	
	private List<String> topping_name;
	private List<String> topping_price;
	private List<String> topping_size;
	

	private int topping1;
	private int topping2;
	private int topping3;
	private int topping4;
	private int topping5;

}
