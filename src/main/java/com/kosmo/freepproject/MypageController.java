package com.kosmo.freepproject;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import board.BoardDAOImpl;
import board.BoardDTO;
import cart.CartImpl;
import coupon.CouponVO;
import member.MemberImpl;
import member.MemberVO;
import mypage.MypageImpl;
import orderlist.OrderlistVO;
import point.PointVO;
import review.LikedReviewDTO;
import review.ReviewBoardDAOImpl;
import review.ReviewBoardDTO;
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
		
		int pageSize = 8; //한 페이지당 출력할 주문내역의 개수
		int blockPage = 3; //한 블럭당 출력할 페이지 번호의 개수
		
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
		
		model.addAttribute("totalOrderCount", totalOrderCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
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
		
		int pageSize = 8; //한 페이지당 출력할 쿠폰의 개수
		int blockPage = 3; //한 블럭당 출력할 페이지 번호의 개수
		
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
		
		
		int pageSize = 8; //한 페이지당 출력할 쿠폰의 개수
		int blockPage = 3; //한 블럭당 출력할 페이지 번호의 개수
		
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
		
	
	//내 리뷰 리스트
	@RequestMapping("/mypage/myReview.do")
	public String myReview(Principal principal, Model model, HttpServletRequest req) {

		ParameterDTO dto = new ParameterDTO();
		dto.setId(principal.getName());
		String m_code = sqlSession.getMapper(MypageImpl.class).myMcode(dto);
		dto.setM_code(m_code);
		
		//리뷰내역 카운트
		int totalreviewCount = sqlSession.getMapper(ReviewBoardDAOImpl.class).getMyCount(dto);
		
		int pageSize = 8; //한 페이지당 출력할 주문내역의 개수
		int blockPage = 3; //한 블럭당 출력할 페이지 번호의 개수
		
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		
		dto.setStart(start);
		dto.setEnd(end);

		//출력할 리뷰내역 select
		ArrayList<ReviewBoardDTO> lists = sqlSession.getMapper(ReviewBoardDAOImpl.class).listMyPage(dto);
		
		String pagingImg = PagingUtil_front.pagingImg(totalreviewCount,
	            pageSize, blockPage, nowPage, 
	            req.getContextPath()+"/mypage/myReview.do?");
		
		model.addAttribute("totalreviewCount", totalreviewCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("lists", lists);
		
		return "mypage/myReview";
	}
	
	
	//좋아요 한 리뷰 리스트
	@RequestMapping("/mypage/myFavReview.do")
	public String myFavReview(Principal principal, Model model, HttpServletRequest req) {

		ParameterDTO dto = new ParameterDTO();
		dto.setId(principal.getName());
		String m_code = sqlSession.getMapper(MypageImpl.class).myMcode(dto);
		dto.setM_code(m_code);
		
		//좋아요 한 리뷰 카운트
		int totalFavReviewCount = sqlSession.getMapper(ReviewBoardDAOImpl.class).getMyFavCount(dto);
		

		int pageSize = 8; //한 페이지당 출력할 주문내역의 개수
		int blockPage = 3; //한 블럭당 출력할 페이지 번호의 개수

		
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		
		dto.setStart(start);
		dto.setEnd(end);

		//출력할 리뷰내역 select
		ArrayList<ReviewBoardDTO> lists = sqlSession.getMapper(ReviewBoardDAOImpl.class).listMyFavPage(dto);
		
		String pagingImg = PagingUtil_front.pagingImg(totalFavReviewCount,
	            pageSize, blockPage, nowPage, 
	            req.getContextPath()+"/mypage/myFavReview.do?");
		
		model.addAttribute("totalFavReviewCount", totalFavReviewCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("lists", lists);
		
		return "mypage/myFavReview";
	}
	
	

	//1:1문의 리스트
	@RequestMapping("/mypage/myQuestion.do")
	public String myQuestion(Principal principal, Model model, HttpServletRequest req) {
		
		ParameterDTO dto = new ParameterDTO();
		dto.setId(principal.getName());
		String m_code = sqlSession.getMapper(MypageImpl.class).myMcode(dto);
		dto.setM_code(m_code);
		
		//좋아요 한 리뷰 카운트
		int totalQuCount = sqlSession.getMapper(BoardDAOImpl.class).getQuCount(dto);
		
		int pageSize = 8; //한 페이지당 출력할 주문내역의 개수
		int blockPage = 3; //한 블럭당 출력할 페이지 번호의 개수
		
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		
		dto.setStart(start);
		dto.setEnd(end);

		ArrayList<BoardDTO> lists = sqlSession.getMapper(BoardDAOImpl.class).listQuPage(dto);
		
		String pagingImg = PagingUtil_front.pagingImg(totalQuCount,
	            pageSize, blockPage, nowPage, 
	            req.getContextPath()+"/mypage/myQuestion.do?");
		
		model.addAttribute("totalQuCount", totalQuCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("lists", lists);
		
		return "mypage/myQuestion";
	}
	
	
	//1:1 문의 상세보기
	@RequestMapping("/mypage/myQuView.do")
	public String view(Principal principal, Model model, HttpServletRequest req) {
		
		ParameterDTO dto = new ParameterDTO();
		dto.setId(principal.getName());
		String m_code = sqlSession.getMapper(MypageImpl.class).myMcode(dto);
		dto.setM_code(m_code);
		dto.setB_idx(req.getParameter("b_idx"));
		
		BoardDTO boardDTO = sqlSession.getMapper(BoardDAOImpl.class).myQuView(dto);
		
		String temp = boardDTO.getContents().replace("\r\n","<br/>");
		boardDTO.setContents(temp);
		
		model.addAttribute("dto", boardDTO);
		
		return "mypage/myQuView";
	}
	
	
	//정보수정 전 비밀번호찾기 페이지 진입
	@RequestMapping("/mypage/myUserinfo.do")
	public String myUserinfo(Principal principal, Model model) {
		
		String id = principal.getName();
		model.addAttribute("id", id);
		
		return "mypage/myUserinfo";
	}
		
	
	//비밀번호 확인
	@RequestMapping(value = "/mypage/myPwdChk.do")
	@ResponseBody
	public  Map<String,Object> myPwdChk(HttpServletRequest req, Principal principal){
	    
		ParameterDTO dto = new ParameterDTO();
		dto.setPass(req.getParameter("password"));
		dto.setId(principal.getName());
		
		//id와 pw를 넘겨줘서 결과값을 count함
		int chkResult = sqlSession.getMapper(MypageImpl.class).myPwdChk(dto);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("chkResult", chkResult);
		
	    return result;
	}
	
	
	//회원정보 수정페이지 진입
	@RequestMapping("/mypage/myUserinfoMod.do")
	public String myInfo(Principal principal, Model model, HttpServletRequest req) {
		
		ParameterDTO dto = new ParameterDTO();
		dto.setId(principal.getName());
		String m_code = sqlSession.getMapper(MypageImpl.class).myMcode(dto);
		dto.setM_code(m_code);
		
		MemberVO vo = sqlSession.getMapper(MemberImpl.class).view(dto);
		
		model.addAttribute("vo", vo);
		
		return "mypage/myUserinfoMod";
	}
	
	
	//회원정보 수정
	@RequestMapping("/mypage/myInfoUpdate.do")
	public String myInfoUpdate(HttpServletRequest req, Model model) {
		
		String email = req.getParameter("email1")+"@"+req.getParameter("email2");
		String address = req.getParameter("address")+" "+req.getParameter("address2");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setM_code(Integer.parseInt(req.getParameter("m_code"))); 
		memberVO.setName(req.getParameter("name")); 
		if(req.getParameter("pass1")!= "") {
			memberVO.setPass(req.getParameter("pass1"));
		}
		else if(req.getParameter("pass1")== "") {
			memberVO.setPass(req.getParameter("old_pass")); 
		}
		memberVO.setPhone(req.getParameter("phone"));
		memberVO.setEmail(email);
		memberVO.setZipcode(req.getParameter("zipcode"));
		memberVO.setAddress(address); 
		
		int result =sqlSession.getMapper(MemberImpl.class).myModify(memberVO);
		
		if(result>0) {
			model.addAttribute("msg","회원 정보가 수정되었습니다.");
			return "mypage/myInfoUpdate";
		}
		else {
			model.addAttribute("msg","회원 정보 수정 실패하였습니다.");
	        model.addAttribute("url","/myInfoUpdate.do");
	        return "mypage/myInfoUpdate";
		}
	}
}
