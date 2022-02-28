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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import store.StorechartImpl;
import store.StorechartVO;
import util.PagingUtil;
import util.ParameterDTO;

@Controller
public class StorechartController {

	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/admin/storechart.do")
	public String listSearch(Model model, HttpServletRequest req) {
		
		//Mapper로 전달할 파라미터를 저장할 DTO 객체 생성
		ParameterDTO parameterDTO = new ParameterDTO();
		
		//게시물 카운트(DTO 객체를 인수로 전달)
		int totalRecordCount = 
				sqlSession.getMapper(StorechartImpl.class).getTotalCount(parameterDTO);
		//System.out.println("totalRecordCount"+ totalRecordCount);
		
		//매출현황 날짜 검색 부분
		System.out.println(req.getParameter("yearMonth"));
		parameterDTO.setYearMonth(req.getParameter("yearMonth"));
		
		//매출현황 지역 검색 부분
		System.out.println(req.getParameter("locations"));
		parameterDTO.setLocations(req.getParameter("locations"));
		parameterDTO.setAddress(req.getParameter("address"));
		
		//출력할 게시물 select(DTO객체를 인수로 전달)
		ArrayList<StorechartVO> lists = 
				sqlSession.getMapper(StorechartImpl.class).listPage(parameterDTO);
		
		model.addAttribute("lists", lists);
		
		//검색 기능이 추가된 view를 반환
		return "admin/storechart";
	}
	
}
