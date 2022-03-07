package member;

import lombok.Data;
import lombok.Getter;
@Getter
@Data
public class KakaoDTO {
	private int k_code;
	private String id;
	private String name;
	private String phone;
	private String email;
	private String zipcode;
	private String address;
	private java.sql.Date regidate; //회원등록일
	private int point;
	private int active; //0:활성화,비활성화 

}
