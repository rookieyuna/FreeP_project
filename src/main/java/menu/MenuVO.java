package menu;

import lombok.Data;

@Data 
public class MenuVO {
	private int g_code;
	private int p_code;
	private String p_name;
	private String p_price;
	private String p_size;
	private String p_info;
	private String p_ofile;
	private String p_sfile;
	private int p_best_pizza;
}
