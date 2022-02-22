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
	
	
	//같은제품 사이즈 다른거 정보
		private String p_price1;
		private String p_size1;
		private String p_info1;
	
	
}
