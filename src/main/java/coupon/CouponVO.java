package coupon;

import lombok.Data;

@Data 
public class CouponVO {
	private int cp_idx;
	private int coupon_idx;
	private String cp_name;
	private String cp_cate;
	private String cp_ofile;
	private String cp_sfile;
	private String issue_date;
	private String expire_date;
	private int cp_price;
	private int cp_const;
}
