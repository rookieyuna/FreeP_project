package com.kosmo.freepproject;

import org.springframework.web.bind.annotation.RequestMapping;

public class MypageController {
	
	@RequestMapping("/mypage/myMain.do")
	public String myMain() {		
		return "mypage/myMain";}
	@RequestMapping("/mypage/myOrder.do")
	public String myOrder() {return "mypage/myOrder";}
	@RequestMapping("/mypage/myCoupon.do")
	public String myCoupon() {return "mypage/myCoupon";}
	@RequestMapping("/mypage/myReview.do")
	public String myReview() {return "mypage/myReview";}
	
	 
}
