package Franchise;

import lombok.Data;

@Data
public class FransVO {
	private int f_code;
	private String f_name;
	private String f_phone;
	private String f_email;
	private String f_address;
	private String f_content;
	private java.sql.Date postdate;
	private String f_state;
}
