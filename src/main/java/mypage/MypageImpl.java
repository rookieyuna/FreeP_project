package mypage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import coupon.CouponVO;
import orderlist.OrderlistVO;
import point.PointVO;
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
	public ArrayList<OrderlistVO> orderlist(ParameterDTO dto);
	//주문상품명
	public List<String> totalname(int or_idx);
	//리뷰작성여부
	public int myReviewChk(int or_idx);
	
	
	/*********************쿠폰내역************************/
	//쿠폰내역
	public ArrayList<CouponVO> couponlist(ParameterDTO dto);
	
	
	/*********************포인트내역************************/
	//쿠폰내역
	public ArrayList<PointVO> pointlist(ParameterDTO dto);
	//회원가입일
	public String myRegidate(String m_code);
	
}
