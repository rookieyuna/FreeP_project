package util;

import lombok.Data;

@Data 
public class ParameterDTO {
	
	private String or_idx;//주문번호
	private String m_code;//회원코드
	private String id;//회원id
	private String pass;//회원pwd
	private String g_code;//상품구분
	private String p_code;//상품코드
	private String p_name;//상품이름
	private String b_code; //지점코드
	private String b_name; //지점명
	private String f_code; //가맹문의 코드
	private String f_name; //가맹문의 작성자 
	private String or_date; //주문일자
	private String b_idx; //게시글번호
	private String yearMonth; //매출현황 날짜검색
	private String address; //매출현황 지역검색1
	private String locations; //매출현황 지역검색2
	private String storeName;//지도 매장명검색
	private int cate;//게시판
	
	//회원구분을 위한 변수
	private String grade;
	
	//검색어 처리를 위한 멤버변수
	private String searchField; //검색할 필드명
	private String searchTxt; //검색어
	
	//페이징 기능 추가
	private int start; //게시물 구간의 시작
	private int end; //게시물 구간의 끝
}
