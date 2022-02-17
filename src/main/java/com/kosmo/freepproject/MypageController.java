package com.kosmo.freepproject;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import coupon.CouponVO;
import member.MemberImpl;
import member.MemberVO;
import mypage.MypageImpl;
import orderlist.OrderlistVO;
import util.PagingUtil_main;
import util.PagingUtil_mem;
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
		//id를 이용해서 회원이름 가져옴
		String name = sqlSession.getMapper(MypageImpl.class).myName(dto);
		//회원코드를 통해 쿠폰과 적립금 정보 가져옴
		int myCouponCount = sqlSession.getMapper(MypageImpl.class).myCouponCount(m_code);
		ArrayList<CouponVO> myCoupons = sqlSession.getMapper(MypageImpl.class).myCoupon(m_code);
		int myPoint = sqlSession.getMapper(MypageImpl.class).myPoint(m_code);
		
		model.addAttribute("name", name);
		model.addAttribute("myCouponCount", myCouponCount);
		model.addAttribute("myCoupons", myCoupons);
		model.addAttribute("myPoint", myPoint);
		
		return "mypage/myMain";
	}
	
	//주문내역 리스트
	@RequestMapping("/mypage/myOrder.do")
	public String myOrder(Principal principal, Model model, HttpServletRequest req) {
		
		ParameterDTO dto = new ParameterDTO();
		dto.setId(principal.getName());
		String m_code = sqlSession.getMapper(MypageImpl.class).myMcode(dto);
		dto.setM_code(m_code);
		
		//주문내역 카운트
		int totalOrderCount = 
				sqlSession.getMapper(MypageImpl.class).myOrderCount(m_code);
		
		int pageSize = 2; //한 페이지당 출력할 주문내역의 개수
		int blockPage = 2; //한 블럭당 출력할 페이지 번호의 개수
		
		int totalPage = (int)Math.ceil((double)totalOrderCount/pageSize);
		
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		
		//위에서 계산한 주문내역의 구간 start, end를 DTO에 저장
		dto.setStart(start);
		dto.setEnd(end);

		//출력할 주문내역 select
		ArrayList<OrderlistVO> lists = 
				sqlSession.getMapper(MypageImpl.class).listPage(dto);
		
		
		String pagingImg = PagingUtil_main.pagingImg(totalOrderCount,
	            pageSize, blockPage, nowPage, 
	            req.getContextPath()+"/mypage/myOrder.do?");
		
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("lists", lists);
		
		//검색 기능이 추가된 view를 반환
		return "mypage/myOrder";
	}
	
	
	@RequestMapping("/mypage/myCoupon.do")
	public String myCoupon() {
		return "mypage/myCoupon";
	}
	
	
	@RequestMapping("/mypage/myReview.do")
	public String myReview() {
		return "mypage/myReview";
	}
	
	 
}
