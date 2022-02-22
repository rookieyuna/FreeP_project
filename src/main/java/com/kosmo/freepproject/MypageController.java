package com.kosmo.freepproject;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import coupon.CouponVO;
import mypage.MypageImpl;
import orderlist.OrderlistVO;
import point.PointVO;
import util.PagingUtil_front;
import util.ParameterDTO;

@Controller
public class MypageController {
	@Autowired
	private SqlSession sqlSession;
	
	
	//마이페이지 메인
	@RequestMapping("/mypage/myMain.do")
	public String myMain(Principal principal, Model model) {		
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
		int totalOrderCount = sqlSession.getMapper(MypageImpl.class).myOrderCount(m_code);
		
		int pageSize = 2; //한 페이지당 출력할 주문내역의 개수
		int blockPage = 2; //한 블럭당 출력할 페이지 번호의 개수
		
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		
		dto.setStart(start);
		dto.setEnd(end);

		//출력할 주문내역 select
		ArrayList<OrderlistVO> lists = sqlSession.getMapper(MypageImpl.class).orderlist(dto);
		
		//주문한 상품의 상품명 전체를 저장할 변수
		List<String> total_name;
		
		for (int i = 0; i < lists.size(); i++) {
			//주문번호를 가져옴
			int or_idx = lists.get(i).getOr_idx();
			//주문번호를 통해 주문한 상품명을 가져옴
			total_name = sqlSession.getMapper(MypageImpl.class).totalname(or_idx);
			//System.out.println("total_name:"+total_name);
			
			//해당 주문번호의 모든 상품명을 가져와서 이어붙임
			String names = String.join(" + ", total_name);
			//주문내역 리스트에 set
			lists.get(i).setTotal_name(names);
			
			//해당 주문번호로 작성된 리뷰가 있는지 체크
			int reviewChk = sqlSession.getMapper(MypageImpl.class).myReviewChk(or_idx);
			//System.out.println("reviewChk:"+reviewChk);
			lists.get(i).setReviewChk(reviewChk);
			//System.out.println(lists);
        }
		
		String pagingImg = PagingUtil_front.pagingImg(totalOrderCount,
	            pageSize, blockPage, nowPage, 
	            req.getContextPath()+"/mypage/myOrder.do?");
		
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("lists", lists);
		
		return "mypage/myOrder";
	}
		
	
	
	//쿠폰리스트
	@RequestMapping("/mypage/myCoupon.do")
	public String myCoupon(Principal principal, Model model, HttpServletRequest req) {

		ParameterDTO dto = new ParameterDTO();
		dto.setId(principal.getName());
		String m_code = sqlSession.getMapper(MypageImpl.class).myMcode(dto);
		dto.setM_code(m_code);
		
		//쿠폰 수 카운트
		int myCouponCount = sqlSession.getMapper(MypageImpl.class).myCouponCount(m_code);
		
		int pageSize = 2; //한 페이지당 출력할 쿠폰의 개수
		int blockPage = 2; //한 블럭당 출력할 페이지 번호의 개수
		
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		
		dto.setStart(start);
		dto.setEnd(end);

		//출력할 쿠폰 select
		ArrayList<CouponVO> couponlist = sqlSession.getMapper(MypageImpl.class).couponlist(dto);
		
		String pagingImg = PagingUtil_front.pagingImg(myCouponCount,
	            pageSize, blockPage, nowPage, 
	            req.getContextPath()+"/mypage/myCoupon.do?");
		
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("couponlist", couponlist);
		
		return "mypage/myCoupon";
	}
	
	
	//적립금리스트
	@RequestMapping("/mypage/myPoint.do")
	public String myPoint(Principal principal, Model model, HttpServletRequest req) {

		ParameterDTO dto = new ParameterDTO();
		dto.setId(principal.getName());
		String m_code = sqlSession.getMapper(MypageImpl.class).myMcode(dto);
		dto.setM_code(m_code);
		
		
		int pageSize = 2; //한 페이지당 출력할 쿠폰의 개수
		int blockPage = 2; //한 블럭당 출력할 페이지 번호의 개수
		
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		
		dto.setStart(start);
		dto.setEnd(end);
		
		//적립횟수 카운트(가입시 기본적립금 지급하므로 주문횟수+1)
		int pointUpdateCount = sqlSession.getMapper(MypageImpl.class).myOrderCount(m_code) +1;
		String regidate = sqlSession.getMapper(MypageImpl.class).myRegidate(m_code);
		
		//출력할 적립금 내역 select
		ArrayList<PointVO> pointlist = sqlSession.getMapper(MypageImpl.class).pointlist(dto);
		
		String pagingImg = PagingUtil_front.pagingImg(pointUpdateCount,
	            pageSize, blockPage, nowPage, 
	            req.getContextPath()+"/mypage/myPoint.do?");
		
		
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("regidate", regidate);
		model.addAttribute("pointlist", pointlist);
		
		return "mypage/myPoint";
	}
		
		
	@RequestMapping("/mypage/myReview.do")
	public String myReview() {
		return "mypage/myReview";
	}
	
	 
}
