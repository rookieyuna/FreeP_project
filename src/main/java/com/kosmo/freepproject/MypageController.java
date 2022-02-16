package com.kosmo.freepproject;

import java.security.Principal;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import coupon.CouponVO;
import mypage.MypageImpl;
import util.ParameterDTO;

@Controller
public class MypageController {
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/mypage/myMain.do")
	public String myMain(Principal principal, Model model) {		
		//사용자 id 가져옴
		String user_id = principal.getName();
		//dto에 id를 저장
		ParameterDTO dto = new ParameterDTO();
		dto.setId(principal.getName());
		
		//id를 이용해서 회원코드 가져옴
		String m_code = sqlSession.getMapper(MypageImpl.class).myMcode(dto);
		//회원코드를 통해 쿠폰과 적립금 정보 가져옴
		int myCouponCount = sqlSession.getMapper(MypageImpl.class).myCouponCount(m_code);
		ArrayList<CouponVO> myCoupons = sqlSession.getMapper(MypageImpl.class).myCoupon(m_code);
		int myPoint = sqlSession.getMapper(MypageImpl.class).myPoint(m_code);
		
		model.addAttribute("user_id", user_id);
		model.addAttribute("myCouponCount", myCouponCount);
		model.addAttribute("myCoupons", myCoupons);
		model.addAttribute("myPoint", myPoint);
		
		return "mypage/myMain";
	}
	
	
	@RequestMapping("/mypage/myOrder.do")
	public String myOrder() {return "mypage/myOrder";}
	@RequestMapping("/mypage/myCoupon.do")
	public String myCoupon() {return "mypage/myCoupon";}
	@RequestMapping("/mypage/myReview.do")
	public String myReview() {return "mypage/myReview";}
	
	 
}
