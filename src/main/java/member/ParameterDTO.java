package member;

import lombok.Data;

@Data
public class ParameterDTO {
	private String m_code;
	private String id;
	
	//회원구분을 위한 변수
	private String grade;
	
	//검색어 처리를 위한 멤버변수
	private String searchField; //검색할 필드명
	private String searchTxt; //검색어
	
	//페이징 기능 추가
	private int start; //게시물 구간의 시작
	private int end; //게시물 구간의 끝
}
