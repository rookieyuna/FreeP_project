package mypage;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import coupon.CouponVO;
import util.ParameterDTO;


@Service
public interface MypageImpl {
	//회원코드
	public String myMcode(ParameterDTO dto);
	//쿠폰 개수
	public int myCouponCount(String m_code);
	//보유 쿠폰
	public ArrayList<CouponVO> myCoupon(String m_code);
	//보유 적립금
	public int myPoint(String m_code);
	
}
