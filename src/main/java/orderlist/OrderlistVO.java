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
	private String total_name;//주문한 상품목록(주문내역용)
	private int reviewChk;//리뷰작성여부(주문내역용)
	
	//주문자랑 수령인이랑 정보 다를때
	private String name;
	private String phone;
	private String request;
}
