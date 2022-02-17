package com.kosmo.freepproject;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.BoardDAOImpl;
import cart.CartDTO;
import cart.CartImpl;
import util.PagingUtil;

@Controller
public class CartController {
/*
 1. 파라미터로 값 받아온거 판별 일반피잔지, diy피잔지
 2. diy피자면 한과정 더거침
 3. cart테이블에 insert
 4.  insert 된거 그대로 장바구니 페이지에 로드
 */
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/order/cart.do")
	public String list(Model model, HttpServletRequest req, Principal principal) {

		//회원코드 
		String user_id = "";
		user_id = principal.getName();
		int m_code = 
				sqlSession.getMapper(BoardDAOImpl.class).findm_code(user_id);
		
		
		//cart테이블 전체 리스트 불러오기(diy피자)
		 ArrayList<CartDTO> listsdiy =
			sqlSession.getMapper(CartImpl.class).listPagediy(m_code);
		 	
		//토핑들 불러오기 리스트로 리팩토링 해야댐
		
		for(CartDTO diy : listsdiy) {
			int a = diy.getDough();  
			CartDTO dough = sqlSession.getMapper(CartImpl.class).objectdiy(a);
			diy.setDough_name(dough.getP_name());		
			diy.setDough_price(dough.getP_price());
			diy.setDough_size(dough.getP_size());
			
			a = diy.getSauce();
			CartDTO sauce = sqlSession.getMapper(CartImpl.class).objectdiy(a);
			diy.setSauce_name(sauce.getP_name());		
			diy.setSauce_price(sauce.getP_price());
			diy.setSauce_size(sauce.getP_size());	

			a = diy.getTopping1();
			CartDTO topping1 = sqlSession.getMapper(CartImpl.class).objectdiy(a);
			diy.setTopping1_name(topping1.getP_name());		
			diy.setTopping1_price(topping1.getP_price());
			diy.setTopping1_size(topping1.getP_size());	
			
			a = diy.getTopping2();
			if(a != 0) {
				CartDTO topping2 = sqlSession.getMapper(CartImpl.class).objectdiy(a);
				diy.setTopping2_name(topping2.getP_name());		
				diy.setTopping2_price(topping2.getP_price());
				diy.setTopping2_size(topping2.getP_size());	
			}
			a = diy.getTopping3();
			if(a != 0) {
				CartDTO topping3 = sqlSession.getMapper(CartImpl.class).objectdiy(a);
				diy.setTopping3_name(topping3.getP_name());		
				diy.setTopping3_price(topping3.getP_price());
				diy.setTopping3_size(topping3.getP_size());	
			}
			a = diy.getTopping4();
			if(a != 0) {
				CartDTO topping4 = sqlSession.getMapper(CartImpl.class).objectdiy(a);
				diy.setTopping4_name(topping4.getP_name());		
				diy.setTopping4_price(topping4.getP_price());
				diy.setTopping4_size(topping4.getP_size());	
			}
			a = diy.getTopping5();
			if(a != 0) {
				CartDTO topping5 = sqlSession.getMapper(CartImpl.class).objectdiy(a);
				diy.setTopping5_name(topping5.getP_name());		
				diy.setTopping5_price(topping5.getP_price());
				diy.setTopping5_size(topping5.getP_size());	
			}
			 
		}
		model.addAttribute("listsdiy", listsdiy);	
		  
		 
		
		//cart테이블 전체 리스트 불러오기 (일반제품)
		ArrayList<CartDTO> lists =
			sqlSession.getMapper(CartImpl.class).listPage(m_code);
		model.addAttribute("lists", lists);
		
		//장바구니에 저장되어있는 것들 총 금액?
		int a = sqlSession.getMapper(CartImpl.class).sum1(m_code);
		int b = sqlSession.getMapper(CartImpl.class).sum2(m_code);
		
		model.addAttribute("sum", a+b);
		return "common/cart";
	}	
	
}
