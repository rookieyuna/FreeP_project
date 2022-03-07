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
import org.springframework.web.bind.annotation.ResponseBody;

import board.BoardDAOImpl;
import cart.CartDTO;
import cart.CartImpl;
import store.StoreVO;

@Controller
public class CartController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/order/cart.do")
	public String list() {

		return "common/cart2";
	}
	
	@RequestMapping(value = "/order/delete_action.do")
	@ResponseBody
	public String delete_action(Model model, HttpServletRequest req, Principal principal){
	    
	    try{

	       int cart = Integer.parseInt(req.getParameter("idx"));
	       sqlSession.getMapper(CartImpl.class).deleteCart(cart);
	        
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	    return "";
	}
	
	@RequestMapping(value = "/order/deleteall_action.do")
	@ResponseBody
	public String deleteall_action(Model model, HttpServletRequest req,Principal principal){
		
		String user_id = "";
		user_id = principal.getName();
		int m_code = 
				sqlSession.getMapper(BoardDAOImpl.class).findm_code(user_id);
	    
	    try{			
	       sqlSession.getMapper(CartImpl.class).deleteCartall(m_code);
	        
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	    return "";
	}
	
	@RequestMapping(value = "/order/update_action.do")
	@ResponseBody
	public String update_action(Model model, HttpServletRequest req, Principal principal){
	    
	    try{			
	       int cart = Integer.parseInt(req.getParameter("idx"));	    
	       int num = Integer.parseInt(req.getParameter("num"));	
	       int org = Integer.parseInt(req.getParameter("org"));
	       org = org + num;
	      
			
	       sqlSession.getMapper(CartImpl.class).updateCart(num,cart);

	        
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	    
	    return "";
	}
	
	@RequestMapping(value = "/order/storeList.do")
	@ResponseBody
	public Map<String,Object> storeList(Model model, HttpServletRequest req, Principal principal){
		Map<String, Object> result = new HashMap<String, Object>();
	    try{
	    	
	       double longitude = Double.parseDouble(req.getParameter("longitude"));	    
	       double latitude = Double.parseDouble(req.getParameter("latitude"));	

	
	      
	       ArrayList<StoreVO> lists =
	   			sqlSession.getMapper(CartImpl.class).storeList(latitude,longitude);
	      
	       result.put("listsstore", lists);

	        
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	    
	    return result;
	}
	
	
	@RequestMapping("/order/cart1.do")
	@ResponseBody
	public Map<String,Object> list1(Model model, HttpServletRequest req, Principal principal) {

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

			a = diy.getCt_code();
			List<Integer> b = new ArrayList<Integer>();
			CartDTO toppings = sqlSession.getMapper(CartImpl.class).takeTopping(a);
			b.add(toppings.getTopping1());
			b.add(toppings.getTopping2());
			b.add(toppings.getTopping3());
			b.add(toppings.getTopping4());
			b.add(toppings.getTopping5());
			diy.setToppinglist(b);			
			
			List<CartDTO> topping = new ArrayList<CartDTO>();
			List<String> topping_name = new ArrayList<String>();
			List<String> topping_price = new ArrayList<String>();
			List<String> topping_size = new ArrayList<String>();
			
			for(int i=0; i<5;i++) {
				
				a = diy.getToppinglist().get(i);
				System.out.println("a :"+ a);
				if(a != 0)
				{
					topping.add(sqlSession.getMapper(CartImpl.class).objectdiy(a));					
					topping_name.add(topping.get(i).getP_name());
					topping_price.add(topping.get(i).getP_price());
					topping_size.add(topping.get(i).getP_size());
				}
		
			}
			diy.setTopping_name(topping_name);
			diy.setTopping_price(topping_price);
			diy.setTopping_size(topping_size);
			
			 
		}
		
		//cart테이블 전체 리스트 불러오기 (일반제품)
		ArrayList<CartDTO> lists =
			sqlSession.getMapper(CartImpl.class).listPage(m_code);
		
		//장바구니에 저장되어있는 것들 총 금액?
		
		int sum = sqlSession.getMapper(CartImpl.class).sum1(m_code);
		int sum1 = sqlSession.getMapper(CartImpl.class).sum2(m_code);
		
		//model.addAttribute("sum", sum+sum1); 
		
		 Map<String, Object> result = new HashMap<String, Object>();
		 result.put("listsdiy", listsdiy);
		 result.put("lists", lists);
		 result.put("sum", sum+sum1);
		 
		return result;
	}
	
}
