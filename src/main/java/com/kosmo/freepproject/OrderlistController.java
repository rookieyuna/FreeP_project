package com.kosmo.freepproject;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import orderlist.OrderlistImpl;
import orderlist.OrderlistVO;
import util.PagingUtil;
import util.ParameterDTO;

@Controller
public class OrderlistController {
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/admin/orderlist.do")
	public String listSearch(Model model, HttpServletRequest req) {
		
		//Mapper로 전달할 파라미터를 저장할 DTO 객체 생성
		ParameterDTO parameterDTO = new ParameterDTO();
		//검색어가 있을 경우 저장
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		
		//게시물 카운트(DTO 객체를 인수로 전달)
		int totalRecordCount = 
				sqlSession.getMapper(OrderlistImpl.class).getTotalCount(parameterDTO);
		//System.out.println("totalRecordCount"+ totalRecordCount);
		
		int pageSize = 8; //한 페이지당 출력할 게시물의 개수
		int blockPage = 3; //한 블럭당 출력할 페이지 번호의 개수
		
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		
		//위에서 계산한 게시물의 구간 start, end를 DTO에 저장
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);

		//출력할 게시물 select(DTO객체를 인수로 전달)
		ArrayList<OrderlistVO> lists = 
				sqlSession.getMapper(OrderlistImpl.class).listPage(parameterDTO);
		
		
		String pagingImg = PagingUtil.pagingImg(totalRecordCount,
	            pageSize, blockPage, nowPage, 
	            req.getContextPath()+"/admin/orderlist.do?");
		
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("lists", lists);
		
		//검색 기능이 추가된 view를 반환
		return "admin/order_list";
	}
	
	
	//주문  상세보기
	@RequestMapping("/admin/orderlistView.do")
	public String view(Model model, HttpServletRequest req) {
		
		ParameterDTO parameterDTO = new ParameterDTO();
		//주문번호 저장
		parameterDTO.setOr_idx(req.getParameter("or_idx"));
		
		//view() 메서드로 앞에서 저장된 DTO 객체를 매개변수로 전달한다.
		OrderlistVO vo = sqlSession.getMapper(OrderlistImpl.class).view(parameterDTO);
		
		model.addAttribute("vo", vo);
		//테스트
		return "admin/orderlist_edit";
	}
	

	//수정 처리
	@RequestMapping("/admin/orderlistEdit.do")
	public String editAction(HttpSession session, OrderlistVO OrderlistVO) {
		
		//수정처리를 위해 modify 메서드 호출
		sqlSession.getMapper(OrderlistImpl.class).edit(OrderlistVO);
		
		//방명록 게시판은 상세보기 페이지가 별도로 없으므로 리스트로 이동하면 된다.
		return "redirect:orderlist.do";
	}
	
	
	@RequestMapping("/admin/orderlistDelete.do")
	public String delete(HttpServletRequest req) {
		String or_idx = req.getParameter("or_idx");
		
		sqlSession.getMapper(OrderlistImpl.class).delete(or_idx);
		
		return "redirect:orderlist.do";
	}
	
	
	@RequestMapping(value="/admin/orderlistDeleteChk.do")
	public String removechk(Model model, HttpServletRequest req) {
		
		String[] or_idx = req.getParameterValues("chk");
		
		try {
			for(int i = 0; i <or_idx.length; i++) {
				sqlSession.getMapper(OrderlistImpl.class).delete(or_idx[i].toString());
			}
		}
		catch(Exception e) { 
			e.printStackTrace();
		}
		
		return "redirect:orderlist.do";
	}
}
