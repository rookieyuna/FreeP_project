package util;

import lombok.Data;

@Data
public class ParameterDTO {
	
	private String or_idx;//주문번호
	private String m_code;//회원코드
	private String id;//회원id
	private String g_code;//상품구분
	private String p_code;//상품코드
	private String p_name;//상품이름
	private String b_code; //지점코드
	private String b_name; //지점명
	
	//회원구분을 위한 변수
	private String grade;
	
	//검색어 처리를 위한 멤버변수
	private String searchField; //검색할 필드명
	private String searchTxt; //검색어
	
	//페이징 기능 추가
	private int start; //게시물 구간의 시작
	private int end; //게시물 구간의 끝
}
