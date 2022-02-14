package member;

import lombok.Data;

@Data 
public class MemberVO {
	private int m_code; //회원코드
	private String id;
	private String name;
	private String pass;
	private String phone;
	private String email;
	private String zipcode;
	private String address;
	private java.sql.Date regidate; //회원등록일
	private int grade; //1.고객 2.배달원 3.관리자 (가입경로별로 구분)
	private int point;
	private int active; //0:활성화, 1:비활성화구분
}
