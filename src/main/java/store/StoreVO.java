package store;

import lombok.Data;

@Data
public class StoreVO {
	private int b_code; //지점코드 
	private String b_name; //지점명
	private String address; //주소
	private String latitude; //경도
	private String longitude; //위도
	private String phone; //연락처
	private String storeName; //매장검색용
	
	//장바구니 매장별 거리계산용
	private double distance;
	//픽업시 시간저장용
	private String time;
}
