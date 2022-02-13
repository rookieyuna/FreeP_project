package com.kosmo.freepproject;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
	}
	
	
	/* 
	 [22-02-11 YUNA]
	 링크연결용 임시매핑 - 데이터 매핑 만들때 본인것 삭제해야함. 
	 */
	@RequestMapping("index.do")
	public String Index() {return "index";}
	
//	@RequestMapping("/member/login.do")
//	public String login() {return "member/login";}
	@RequestMapping("/member/regist.do")
	public String regStep1() {return "member/regStep1";}
	
	@RequestMapping("/mypage/myMain.do")
	public String myMain() {return "mypage/myMain";}
	@RequestMapping("/mypage/myOrder.do")
	public String myOrder() {return "mypage/myOrder";}
	@RequestMapping("/mypage/myCoupon.do")
	public String myCoupon() {return "mypage/myCoupon";}
	@RequestMapping("/mypage/myReview.do")
	public String myReview() {return "mypage/myReview";}
	
	@RequestMapping("/order/orderDIY.do")
	public String orderDIY() {return "order/orderDIY";}
	@RequestMapping("/order/orderNormal.do")
	public String orderNormal() {return "order/orderNormal";}
	@RequestMapping("/order/orderSide.do")
	public String orderSide() {return "order/orderSide";}
	@RequestMapping("/order/orderDrink.do")
	public String orderDrink() {return "order/orderDrink";}
	
	@RequestMapping("/order/cart.do")
	public String cart() {return "common/cart";}
	@RequestMapping("/order/order.do")
	public String order() {return "common/order";}
	
	@RequestMapping("/community/review.do")
	public String review() {return "community/review";}
	@RequestMapping("/community/event.do")
	public String event() {return "community/event";}
	@RequestMapping("/community/question.do")
	public String question() {return "community/question";}
	
	@RequestMapping("/company/intro.do")
	public String intro() {return "company/about/intro";}
	@RequestMapping("/company/notice.do")
	public String notice() {return "company/notice";}
	@RequestMapping("/company/searchStore.do")
	public String searchStore() {return "company/searchStore";}
	
	@RequestMapping("/etc/faq.do")
	public String faq() {return "etc/faq";}
	@RequestMapping("/etc/franInquiry.do")
	public String franInquiry() {return "etc/franInquiry";}
	@RequestMapping("/etc/franComplete.do")
	public String franComplete() {return "etc/franComplete";}
	/*
	 이부분 /admin 치면 로그인화면으로 바로 뜨게 하고싶은데 연결이 안되가지고..
	 처음 관리자페이지 진입할때 주소를 /admin 하면 관리자페이지로그인 화면이 뜨게 하고싶어요 근데안댐 ㅋ
	 */

	
	/*
	 * @RequestMapping(value="/{admin}", method=RequestMethod.GET) public String
	 * index(@PathVariable("admin") String admin) {
	 * 
	 * return "redirect:admin/login";
	 * 
	 * }
	 */

	
	
	 @RequestMapping(value="/admin/{var}", method=RequestMethod.GET) 
	 public String base(@PathVariable String var) { 
		 System.out.println("homecontroller");
		 return "/admin/"+ var; 
		
	}
	 
}
