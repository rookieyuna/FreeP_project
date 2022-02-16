package com.kosmo.freepproject;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	@RequestMapping("/mypage/myMain.do")
	public String myMain(Principal principal, Model model) {		
		String user_id = principal.getName();
		model.addAttribute("user_id", user_id);
		
		return "mypage/myMain";
	}
	@RequestMapping("/mypage/myOrder.do")
	public String myOrder() {return "mypage/myOrder";}
	@RequestMapping("/mypage/myCoupon.do")
	public String myCoupon() {return "mypage/myCoupon";}
	@RequestMapping("/mypage/myReview.do")
	public String myReview() {return "mypage/myReview";}
	
	 
}
