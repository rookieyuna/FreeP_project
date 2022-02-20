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
import member.MemberImpl;
import member.MemberVO;
import order.OrderImpl;
import util.ParameterDTO;

@Controller
public class OrderController {

	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/order/order.do")
	public String order(Model model, HttpServletRequest req, Principal principal) {
		
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
	
}
