package com.kosmo.freepproject;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.BoardDAOImpl;
import member.MemberImpl;
import member.MemberVO;
import member.ParameterDTO;
import util.PagingUtil_mem;

@Controller
public class MemberController {
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/admin/member.do")
	public String listSearch(Model model, HttpServletRequest req) {
		
		//Mapper로 전달할 파라미터를 저장할 DTO 객체 생성
		ParameterDTO parameterDTO = new ParameterDTO();
		//검색어가 있을 경우 저장
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setGrade(req.getParameter("grade"));
		
		//게시물 카운트(DTO 객체를 인수로 전달)
		int totalRecordCount = 
				sqlSession.getMapper(MemberImpl.class).getTotalCount(parameterDTO);
		//System.out.println("totalRecordCount"+ totalRecordCount);
		
		int pageSize = 2; //한 페이지당 출력할 게시물의 개수
		int blockPage = 2; //한 블럭당 출력할 페이지 번호의 개수
		
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		String grade = parameterDTO.getGrade();
		
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		
		//위에서 계산한 게시물의 구간 start, end를 DTO에 저장
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);

		//출력할 게시물 select(DTO객체를 인수로 전달)
		ArrayList<MemberVO> lists = 
				sqlSession.getMapper(MemberImpl.class).listPage(parameterDTO);
		
		
		String pagingImg = PagingUtil_mem.pagingImg(totalRecordCount,
	            pageSize, blockPage, nowPage, 
	            req.getContextPath()+"/admin/member.do?grade="+grade);
		
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("lists", lists);
		model.addAttribute("grade", grade);
		
		//검색 기능이 추가된 view를 반환
		return "admin/member_list";
	}
	
	
	//글쓰기 처리
	@RequestMapping(value="/admin/memRegist.do", method=RequestMethod.POST)
	public String regist(Model model, HttpServletRequest req) {
		
		//Mybatis 사용
		//insert문을 실행시 성공한 행의 개수가 정수형으로 반환된다.
		sqlSession.getMapper(MemberImpl.class).regist(
				req.getParameter("id"),
				req.getParameter("name"),
				req.getParameter("pass"),
				req.getParameter("phone"),
				req.getParameter("email"),
				req.getParameter("grade")
		);
		
		//쓰기 처리를 완료한 후 리스트로 이동
		return "redirect:member.do?grade="+req.getParameter("grade");
	}
	
	
	//글수정 페이지 진입하기
	@RequestMapping("/admin/memView.do")
	public String view(Model model, HttpServletRequest req) {
		
		/*
		 파라미터를 전달하는 4번째 방법으로 DTO(혹은 VO) 객체에 파라미터를
		 저장한 후 Mapper로 전달한다.
		 */
		ParameterDTO parameterDTO = new ParameterDTO();
		//회원코드 저장
		parameterDTO.setM_code(req.getParameter("m_code"));
		
		//view() 메서드로 앞에서 저장된 DTO 객체를 매개변수로 전달한다.
		MemberVO vo = sqlSession.getMapper(MemberImpl.class).view(parameterDTO);
		
		model.addAttribute("vo", vo);
		
		return "admin/member_modify";
	}
	

	//수정 처리
	@RequestMapping("/admin/memModify.do")
	public String modifyAction(HttpSession session, MemberVO memberVO) {
		
		//수정페이지에서 전송된 폼값은 커맨드객체를 통해 한꺼번에 받는다.
		
		//수정처리를 위해 modify 메서드 호출
		sqlSession.getMapper(MemberImpl.class).modify(memberVO);
		
		//방명록 게시판은 상세보기 페이지가 별도로 없으므로 리스트로 이동하면 된다.
		return "redirect:member.do?grade="+memberVO.getGrade();
	}
	
	
	@RequestMapping("/admin/memDelete.do")
	public String delete(HttpServletRequest req) {
		String m_code = req.getParameter("m_code");
		String grade = req.getParameter("grade");
		
		sqlSession.getMapper(MemberImpl.class).delete(m_code);
		
		return "redirect:member.do?grade="+grade;
	}
	
	
	@RequestMapping(value="/admin/memDeleteChk.do")
	public String removechk(Model model, HttpServletRequest req) {
		
		String[] mem_no = req.getParameterValues("chk");
		String grade = req.getParameter("grade");
		
		try {
			for(int i = 0; i <mem_no.length; i++) {
				sqlSession.getMapper(MemberImpl.class).delete(mem_no[i].toString());
			}
		}
		catch(Exception e) { 
			e.printStackTrace();
		}
		
		return "redirect:member.do?grade="+grade;
	}
}
