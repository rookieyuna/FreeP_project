package com.kosmo.freepproject;

import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import store.StoreImpl;
import store.StoreVO;
import util.PagingUtil;
import util.ParameterDTO;

@Controller
public class StoreController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/admin/storelist.do")
	public String listSearch(Model model, HttpServletRequest req) {
		
		//Mapper로 전달할 파라미터를 저장할 DTO 객체 생성
		ParameterDTO parameterDTO = new ParameterDTO();
		//검색어가 있을 경우 저장
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		
		//게시물 카운트(DTO 객체를 인수로 전달)
		int totalRecordCount = 
				sqlSession.getMapper(StoreImpl.class).getTotalCount(parameterDTO);
		//System.out.println("totalRecordCount"+ totalRecordCount);
		
		int pageSize = 2; //한 페이지당 출력할 게시물의 개수
		int blockPage = 2; //한 블럭당 출력할 페이지 번호의 개수
		
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		
		//위에서 계산한 게시물의 구간 start, end를 DTO에 저장
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);

		//출력할 게시물 select(DTO객체를 인수로 전달)
		ArrayList<StoreVO> lists = 
				sqlSession.getMapper(StoreImpl.class).listPage(parameterDTO);
		
		
		String pagingImg = PagingUtil.pagingImg(totalRecordCount,
	            pageSize, blockPage, nowPage, 
	            req.getContextPath()+"/admin/storelist.do?");
		
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("lists", lists);
		
		//검색 기능이 추가된 view를 반환
		return "admin/store_list";
	}
	
	public static String getUuid(){
		String uuid = UUID.randomUUID().toString();		
		uuid = uuid.replaceAll("-", "");
		
		return uuid;
	}
	
	//매장목록 추가하기(글쓰기)
	@RequestMapping(value="/admin/storeWrite.do", method=RequestMethod.POST)
	public String regist(Model model, HttpServletRequest req) {

		StoreVO storeVO = new StoreVO();
		 
		storeVO.setB_name(req.getParameter("b_name"));  
		storeVO.setAddress(req.getParameter("address")); 
		storeVO.setLatitude(req.getParameter("latitude")); 
		storeVO.setLongitude(req.getParameter("longitude")); 
		storeVO.setPhone(req.getParameter("phone")); 
			
		
		sqlSession.getMapper(StoreImpl.class).regist(storeVO);
		
		return "redirect:storelist.do"; 
	}
	
	//매장목록 상세보기 
	@RequestMapping("/admin/storeView.do")
	public String view(Model model, HttpServletRequest req) {
		
		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setB_code(req.getParameter("b_code"));
		
		//view() 메서드로 앞에서 저장된 DTO 객체를 매개변수로 전달한다.
		StoreVO vo = sqlSession.getMapper(StoreImpl.class).view(parameterDTO);
		
		model.addAttribute("vo", vo);
		
		return "admin/store_detail";
	}
	
	//수정하기진입
	@RequestMapping("/admin/storeEdit.do")
	public String edit(Model model, HttpServletRequest req) {
		
		ParameterDTO parameterDTO = new ParameterDTO();
		parameterDTO.setB_code(req.getParameter("b_code"));
		
		StoreVO vo = sqlSession.getMapper(StoreImpl.class).view(parameterDTO);
		
		model.addAttribute("vo", vo);
		return "admin/store_edit";
	}

		
	@RequestMapping(value="/admin/storeEditAction.do",method=RequestMethod.POST)
	public String editAction(StoreVO storeVO, HttpServletRequest req) {
		
//		storeVO.setB_code(Integer.parseInt(req.getParameter("b_code")));
//		storeVO.setB_name(req.getParameter("b_name"));  
//		storeVO.setAddress(req.getParameter("address")); 
//		storeVO.setLatitude(req.getParameter("latitude")); 
//		storeVO.setLongitude(req.getParameter("longitude")); 
//		storeVO.setPhone(req.getParameter("phone")); 
		
		sqlSession.getMapper(StoreImpl.class).edit(storeVO);
		
		return "redirect:storelist.do";
	}
	
	//매장목록 삭제하기
	@RequestMapping("/admin/storeDelete.do")
	public String delete(Model model, HttpServletRequest req) {
		
		String b_code = req.getParameter("b_code");
		
		sqlSession.getMapper(StoreImpl.class).delete(req.getParameter("b_code"));
		
		return "redirect:storelist.do";
	}
	
	//체크한 것 삭제
	@RequestMapping(value="/admin/storeDeleteChk.do")
	public String removechk(Model model, HttpServletRequest req) {
		
		String[] b_code = req.getParameterValues("chk");
		
		try {
			for(int i = 0; i <b_code.length; i++) {
				sqlSession.getMapper(StoreImpl.class).delete(b_code[i].toString());
			}
		}
		catch(Exception e) { 
			e.printStackTrace();
		}
		
		return "redirect:storelist.do";
	}
}