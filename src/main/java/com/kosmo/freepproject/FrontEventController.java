package com.kosmo.freepproject;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.BoardDAOImpl;
import board.BoardDTO;
import util.PagingUtil;
import util.PagingUtil_front;

@Controller
public class FrontEventController {
	
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("Mybatis 사용준비끝");
	}
	
	 
	@RequestMapping("/community/event.do")
	public String list(Model model, HttpServletRequest req) {
		
		int totalRecordCount =
			sqlSession.getMapper(BoardDAOImpl.class).getTotalCount(1);
	
		
		//페이지 처리를 위한 설정값
		int pageSize = 8;//한 페이지당 출력할 게시물의 갯수
		int blockPage = 3;//한 블럭당 출력할 페이지번호의 갯수
		//전체 페이지 수 계산
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);

		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals("")) 
			? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		//해당 페이지에 출력할 게시물의 구간을 계산한다. 
		int start = (nowPage-1) * pageSize + 1;
		int end = pageSize * nowPage;

		ArrayList<BoardDTO> lists =
			sqlSession.getMapper(BoardDAOImpl.class).listPage(2, start, end);
				
		String pagingStr =
			PagingUtil_front.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath()+"/community/event.do?");
		
		model.addAttribute("pagingStr", pagingStr);
		model.addAttribute("totalRecordCount", totalRecordCount);
		//내용에 대한 줄바꿈 처리
		for(BoardDTO dto : lists){
			String temp = dto.getContents().replace("\r\n","<br/>");
			dto.setContents(temp); 
		}
		model.addAttribute("lists", lists);		
		return "community/event";
	}	
	
	/*
	 * @RequestMapping("/community/eventSearch.do") public String listSearch(Model
	 * model, HttpServletRequest req) {
	 * 
	 * 
	 * ParameterDTO parameterDTO = new ParameterDTO(); //검색어가 있을경우 저장
	 * parameterDTO.setCate(1);
	 * parameterDTO.setSearchField(req.getParameter("searchField"));
	 * parameterDTO.setSearchTxt(req.getParameter("searchtxt"));
	 * 
	 * int totalRecordCount =
	 * sqlSession.getMapper(BoardDAOImpl.class).getTotalCountSearch(parameterDTO);
	 * 
	 * 
	 * //페이지 처리를 위한 설정값 int pageSize = 3;//한 페이지당 출력할 게시물의 갯수 int blockPage = 2;//한
	 * 블럭당 출력할 페이지번호의 갯수 //전체 페이지 수 계산 //int totalPage =
	 * (int)Math.ceil((double)totalRecordCount/pageSize);
	 * 
	 * int nowPage = (req.getParameter("nowPage")==null ||
	 * req.getParameter("nowPage").equals("")) ? 1 :
	 * Integer.parseInt(req.getParameter("nowPage"));
	 * 
	 * //해당 페이지에 출력할 게시물의 구간을 계산한다. int start = (nowPage-1) * pageSize + 1; int end
	 * = pageSize * nowPage;
	 * 
	 * parameterDTO.setStart(start); parameterDTO.setEnd(end);
	 * 
	 * ArrayList<BoardDTO> lists =
	 * sqlSession.getMapper(BoardDAOImpl.class).listPageSearch(parameterDTO);
	 * 
	 * String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize,
	 * blockPage, nowPage, req.getContextPath()+"/company/notice.do?");
	 * model.addAttribute("pagingImg", pagingImg);
	 * 
	 * //내용에 대한 줄바꿈 처리 for(BoardDTO dto : lists){ String temp =
	 * dto.getContents().replace("\r\n","<br/>"); dto.setContents(temp); }
	 * model.addAttribute("lists", lists);
	 * 
	 * return "community/eventView"; }
	 */
	
	
	public static String getUuid(){
		String uuid = UUID.randomUUID().toString();		
		//System.out.println("생성된UUID-1:"+ uuid);
		  
		uuid = uuid.replaceAll("-", "");
		//System.out.println("생성된UUID-2:"+ uuid);
		return uuid;
	}

	
	@RequestMapping("/community/eventView.do")
	public String detail(Model model, HttpServletRequest req) {
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setB_idx( Integer.parseInt(req.getParameter("idx"))); 
		
		BoardDTO dto = 
				sqlSession.getMapper(BoardDAOImpl.class).view(boardDTO);
		  
		sqlSession.getMapper(BoardDAOImpl.class).updatehit(Integer.parseInt(req.getParameter("idx")));
		
		
		BoardDTO pre = sqlSession.getMapper(BoardDAOImpl.class).titlepre(Integer.parseInt(req.getParameter("idx")),2);
		BoardDTO next = sqlSession.getMapper(BoardDAOImpl.class).titlenext(Integer.parseInt(req.getParameter("idx")), 2);
		
		//내용에 대한 줄바꿈 처리
		String temp = dto.getContents().replace("\r\n","<br/>");
		dto.setContents(temp);
	
		model.addAttribute("dto", dto);
		model.addAttribute("pre", pre);
		model.addAttribute("next", next);
		return "/community/eventView";
	}
}
