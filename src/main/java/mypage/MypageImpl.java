package mypage;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import coupon.CouponVO;
import member.MemberVO;
import orderlist.OrderlistVO;
import util.ParameterDTO;


@Service
public interface MypageImpl {
	/*********************메인************************/
	//회원코드
	public String myMcode(ParameterDTO dto);
	//회원코드
	public String myName(ParameterDTO dto);
	//쿠폰 개수
	public int myCouponCount(String m_code);
	//보유 쿠폰
	public ArrayList<CouponVO> myCoupon(String m_code);
	//보유 적립금
	public int myPoint(String m_code);
	
	
	/*********************주문내역************************/
	//주문내역 카운트
	public int myOrderCount(String m_code);
	//주문내역
	public ArrayList<OrderlistVO> listPage(ParameterDTO dto);
}
