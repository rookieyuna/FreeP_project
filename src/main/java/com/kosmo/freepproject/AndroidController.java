package com.kosmo.freepproject;

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

import android.IAndroidDAO;
import member.MemberVO;
import mypage.MypageImpl;
import orderlist.OrderlistVO;
import store.StoreVO;

@Controller
public class AndroidController {

	//Mybatis 사용을 위한 자동주입
	@Autowired
	private SqlSession sqlSession;
	
	
	//매개변수가 필요없이 회원리스트 전체를 JSONObject로 반환
	@RequestMapping("/android/memberObject.do")
	@ResponseBody
	public Map<String, Object> memberObject(HttpServletRequest req) {
		
		Map<String, Object> map = new HashMap<String, Object>();		
		ArrayList<MemberVO> lists = 
				sqlSession.getMapper(IAndroidDAO.class).memberList();
		map.put("memberList", lists);
		return map;
	}

	//JSONArray로 데이터 반환
	@RequestMapping("/android/memberList.do")
	@ResponseBody
	public ArrayList<MemberVO> memberList(HttpServletRequest req) {
		System.out.println("요청들어옴");
		ArrayList<MemberVO> lists = 
				sqlSession.getMapper(IAndroidDAO.class).memberList();
		return lists;
	}
			
	/*
	파라미터로 전달되는 아이디, 패스워드를 request객체가 아닌
	커멘트객체를 통해 한번에 받는다. 회원인증 결과를 JSONObject로
	반환한다. 
	 */
	@RequestMapping("/android/memberLogin.do")
	@ResponseBody
	public Map<String, Object> memberLogin(MemberVO memberVO) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();

		MemberVO memberInfo =
			sqlSession.getMapper(IAndroidDAO.class).memberLogin(memberVO);
		
		if(memberInfo==null) {
			//회원정보 불일치로 로그인에 실패한 경우..결과만 0으로 내려준다.
			returnMap.put("isLogin", 0);
		}
		else {
			//로그인에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다. 
			returnMap.put("memberInfo", memberInfo);
			returnMap.put("isLogin", 1);
		}
		
		System.out.println("요청들어옴:"+returnMap);
		return returnMap;
	}
	
	
	
	//웹뷰 로그인 연동을 위한 로그인 작업
	@RequestMapping("/and/login.do")
	public String autoLogin(Model model, HttpServletRequest req) {
		
		String id = req.getParameter("id").toString();
		String pass = req.getParameter("pass").toString();
		
		model.addAttribute("id", id);
		model.addAttribute("pass", pass);	
		
		return "android/login";
	}
	
	
	
	
	//주문내역. 주문번호 주문일자 최종결제금액 주문상품내역
	@RequestMapping("/android/orderList.do")
	@ResponseBody
	public ArrayList<OrderlistVO> orderList(HttpServletRequest req) {
		String m_code = req.getParameter("m_code");
		ArrayList<OrderlistVO> lists = sqlSession.getMapper(IAndroidDAO.class).orderList(m_code);
		
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
        }
		
		return lists;
	}
	
	
	//배달현황
	@RequestMapping("/android/orderStatus.do")
	@ResponseBody
	public OrderlistVO orderStatus(HttpServletRequest req) {
		String m_code = req.getParameter("m_code");
		OrderlistVO list = sqlSession.getMapper(IAndroidDAO.class).orderStatus(m_code);
		
		//주문한 상품의 상품명 전체를 저장할 변수
		List<String> total_name;
		
		int or_idx = list.getOr_idx();
		//주문번호를 통해 주문한 상품명을 가져옴
		total_name = sqlSession.getMapper(MypageImpl.class).totalname(or_idx);
		//해당 주문번호의 모든 상품명을 가져와서 이어붙임
		String names = String.join(" + ", total_name);
		//주문내역 리스트에 set
		list.setTotal_name(names);
        
		return list;
	}
	
	//매개변수가 필요없이 회원리스트 전체를 JSONObject로 반환
	@RequestMapping("/android/mapObject.do")
	@ResponseBody
	public Map<String, Object> mapObject(HttpServletRequest req) {
		
		Map<String, Object> map = new HashMap<String, Object>();		
		ArrayList<StoreVO> lists = 
				sqlSession.getMapper(IAndroidDAO.class).mapList();
		map.put("mapList", lists);
		return map;
	}
	
	//JSONArray로 데이터 반환
	@RequestMapping("/android/mapList.do")
	@ResponseBody
	public ArrayList<StoreVO> mapList(HttpServletRequest req) {
		System.out.println("요청들어옴");
		ArrayList<StoreVO> lists = 
				sqlSession.getMapper(IAndroidDAO.class).mapList();
		return lists;
	}
}
