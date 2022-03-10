package com.kosmo.freepproject;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import board.BoardDAOImpl;
import cart.CartDTO;
import cart.CartImpl;
import coupon.CouponImpl;
import coupon.CouponVO;
import member.MemberImpl;
import member.MemberVO;
import order.OrderDTO;
import order.OrderImpl;
import orderlist.OrderlistImpl;
import orderlist.OrderlistVO;
import store.StoreVO;
import util.ParameterDTO;

@Controller
public class OrderController {

	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/order/order.do")
	public String order(Model model, HttpServletRequest req, Principal principal) {
	
		/*
		 매장명, 매장주소, 매장전화번호, 포장이라면 픽업시간
		 */
		StoreVO storeinfo =
		sqlSession.getMapper(OrderImpl.class).selectStore(req.getParameter("store"));
		
		if(req.getParameter("order_how").equals("P")) {
			storeinfo.setTime(req.getParameter("more_req_box"));
		}
		model.addAttribute("store",storeinfo);
		model.addAttribute("orderhow", req.getParameter("order_how"));
		
		String user_id = "";
		user_id = principal.getName();
		int m_code = sqlSession.getMapper(BoardDAOImpl.class).findm_code(user_id);
		
		ArrayList<CartDTO> lists =
				sqlSession.getMapper(OrderImpl.class).listCt(m_code); 
		model.addAttribute("lists", lists);
		
		//장바구니에 저장되어있는 것들 총 금액?
		
		int sum = sqlSession.getMapper(CartImpl.class).sum1(m_code);
		int sum1 = sqlSession.getMapper(CartImpl.class).sum2(m_code);
			
		model.addAttribute("sum", sum+sum1);
		
		ParameterDTO parameterDTO = new ParameterDTO();
		//회원코드 저장
		parameterDTO.setM_code(Integer.toString(m_code));
		MemberVO vo = sqlSession.getMapper(MemberImpl.class).view(parameterDTO);
		
		model.addAttribute("vo", vo);
		
		return "common/order";
	}
	
	@RequestMapping("/order/cusInfo.do")
	@ResponseBody
	public Map<String,Object> cusInfo(Model model, HttpServletRequest req, Principal principal) {
		
		String user_id = "";
		user_id = principal.getName();
		int m_code = sqlSession.getMapper(BoardDAOImpl.class).findm_code(user_id);
		
		ParameterDTO parameterDTO = new ParameterDTO();
		//회원코드 저장
		parameterDTO.setM_code(Integer.toString(m_code));
		MemberVO vo = sqlSession.getMapper(MemberImpl.class).view(parameterDTO);
		
		String a = vo.getPhone();
		String tel1 = a.substring(0,3);
		String tel2 = a.substring(3,7);
		String tel3 = a.substring(7,11);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("lists", vo);
		result.put("tel1", tel1);
		result.put("tel2", tel2);
		result.put("tel3", tel3);
		return result;
	}
	
	@RequestMapping("/order/cusPoint.do")
	@ResponseBody
	public Map<String,Object> cusPoint(Model model, HttpServletRequest req, Principal principal) {
		
		String user_id = "";
		user_id = principal.getName();
		int m_code = sqlSession.getMapper(BoardDAOImpl.class).findm_code(user_id);
		
		ParameterDTO parameterDTO = new ParameterDTO();
		//회원코드 저장
		parameterDTO.setM_code(Integer.toString(m_code));
		MemberVO vo = sqlSession.getMapper(MemberImpl.class).view(parameterDTO);
		
		int a = vo.getPoint(); 

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("point", a);

		return result;
	}
	@RequestMapping("/order/cusCoupon.do")
	@ResponseBody
	public Map<String,Object> cusCoupon(Model model, HttpServletRequest req, Principal principal) {
		
		String user_id = "";
		user_id = principal.getName();
		int m_code = sqlSession.getMapper(BoardDAOImpl.class).findm_code(user_id);
		
		ParameterDTO parameterDTO = new ParameterDTO();
		//회원코드 저장
		parameterDTO.setM_code(Integer.toString(m_code));
		//여기부터 수정.. coupon목록 가져오기
		ArrayList<CouponVO> lists = sqlSession.getMapper(CouponImpl.class).listCp(parameterDTO); 
		 
		

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("coupon",lists);

		return result;
	}
	
	@RequestMapping("/order/pay.do")
	public String pay(Model model, HttpServletRequest req, Principal principal) {
		
		String user_id = "";
		user_id = principal.getName();
		int m_code = sqlSession.getMapper(BoardDAOImpl.class).findm_code(user_id);
		
		OrderlistVO dto = new OrderlistVO();
		dto.setM_code(m_code);
		dto.setB_code(Integer.parseInt(req.getParameter("storeCode")));
		dto.setOrigin_price(Integer.parseInt(req.getParameter("sum")));
		dto.setCp_price(Integer.parseInt(req.getParameter("coupon")));
		dto.setPo_price(Integer.parseInt(req.getParameter("point")));
		dto.setTotal_price(Integer.parseInt(req.getParameter("total")));
		dto.setCredit(req.getParameter("credit"));
		dto.setName(req.getParameter("customerName"));
		dto.setPhone(req.getParameter("phone"));
		if(req.getParameter("more_req_box").equals("direct")) {
			dto.setRequest(req.getParameter("more_req"));
		}
		else{
			dto.setRequest(req.getParameter("more_req_box"));}
		dto.setOrderhow(req.getParameter("orderhow"));
		if(req.getParameter("orderhow").equals("P")) {
			dto.setPickup_time(req.getParameter("pickup_time"));
		}
		else { dto.setPickup_time("");}
		
		
		//ordered테이블에 삽입
		sqlSession.getMapper(OrderlistImpl.class).insertOrder(dto);
		//member테이블에서 적립금 사용한거만큼 감소
		sqlSession.getMapper(OrderImpl.class).updatePoint(Integer.parseInt(req.getParameter("point")), m_code);
		
		//mycoupon테이블에서 사용한 쿠폰 삭제
		if(Integer.parseInt(req.getParameter("couponidx")) != 0) {	
			sqlSession.getMapper(OrderImpl.class).deleteMyCoupon(Integer.parseInt(req.getParameter("couponidx")));
		}
		
		int flag = sqlSession.getMapper(OrderlistImpl.class).checkidx(); 
		flag -= 1;
		
		//order_product테이블에 삽입
		String[] code = (String[]) req.getParameterValues("ctCode");
		String[] cartIdx = (String[]) req.getParameterValues("cartIdx");
		for(int i = 0; i<code.length;i++) {//제품 갯수만큼 포문
			if(code[i].startsWith("9"))//diy피자인 경우
			{
				OrderDTO a = sqlSession.getMapper(OrderImpl.class).productDIYInfo(cartIdx[i], cartIdx[i]); 
				a.setOr_idx(flag);
				//이제 order_product테이블에 인서트해야댐				
				sqlSession.getMapper(OrderImpl.class).productInsert(a); 
			}
			else//일반제품인 경우
			{
				OrderDTO a = sqlSession.getMapper(OrderImpl.class).productInfo(cartIdx[i], cartIdx[i]); 
				a.setOr_idx(flag);
				//이제 order_product테이블에 인서트해야댐				
				sqlSession.getMapper(OrderImpl.class).productInsert(a); 
			}
			//cart테이블에서 idx값 사용해서 delete
			sqlSession.getMapper(OrderImpl.class).deleteProduct(cartIdx[i]); 
			//member테이블에서 적립금 update
			int a = Integer.parseInt(req.getParameter("total"));
			a = (int) (a * 0.1) ;
			sqlSession.getMapper(OrderImpl.class).updatePoint1(a, m_code);
		}
		
		return "/common/orderFinish";
	}

	
}
