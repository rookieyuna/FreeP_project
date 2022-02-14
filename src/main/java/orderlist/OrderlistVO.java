package orderlist;

import lombok.Data;

@Data
public class OrderlistVO {
	private int or_idx; //주문번호 
	private int m_code; //회원코드
	private int b_code; //지점코드
	private java.sql.Date or_date; //주문일자
	private int origin_price;//할인전금액
	private int cp_price;//쿠폰사용액
	private int po_price;//적립금사용액
	private int total_price;//최종결제금액
	private String credit;//결제수단
	private String state;//주문상태
}
