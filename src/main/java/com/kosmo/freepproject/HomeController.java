package com.kosmo.freepproject;

import java.security.Principal;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.BoardDAOImpl;
import board.BoardDTO;
import review.ReviewBoardDAOImpl;
import review.ReviewBoardDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		ArrayList<BoardDTO> noticeLists =
				sqlSession.getMapper(BoardDAOImpl.class).listPage(1, 1, 2);
		model.addAttribute("noticeLists", noticeLists);	
		
		ArrayList<BoardDTO> eventLists =
				sqlSession.getMapper(BoardDAOImpl.class).listPage(2, 1, 2);
		model.addAttribute("eventLists", eventLists);	
		
		ArrayList<ReviewBoardDTO> reviewLists =
				sqlSession.getMapper(ReviewBoardDAOImpl.class).listBest(1, 4);
		model.addAttribute("reviewLists", reviewLists);
		
		return "index";
	}
	

	@RequestMapping("index.do")
	public String Index(Model model) {

		ArrayList<BoardDTO> noticeLists =
				sqlSession.getMapper(BoardDAOImpl.class).listPage(1, 1, 2);
		model.addAttribute("noticeLists", noticeLists);	
		
		ArrayList<BoardDTO> eventLists =
				sqlSession.getMapper(BoardDAOImpl.class).listPage(2, 1, 2);
		model.addAttribute("eventLists", eventLists);	
		
		ArrayList<ReviewBoardDTO> reviewLists =
				sqlSession.getMapper(ReviewBoardDAOImpl.class).listBest(1, 4);
		model.addAttribute("reviewLists", reviewLists);
		
		return "index";}
	
	
	
	/* 
	 [22-02-11 YUNA]
	 링크연결용 임시매핑 - 데이터 매핑 만들때 본인것 삭제해야함. 
	 */
	
	@RequestMapping("/community/question.do")
	public String question() {return "community/question";}
	
	@RequestMapping("/company/intro.do")
	public String intro() {return "company/about/intro";}
	@RequestMapping("/company/introCeo.do")
	public String introCeo() {return "company/about/introCeo";}
	@RequestMapping("/company/introLocation.do")
	public String introLocation() {return "company/about/introLocation";}
	
	
	@RequestMapping("/etc/faq.do")
	public String faq() {return "etc/faq";}
	@RequestMapping("/etc/franInquiry.do")
	public String franInquiry() {return "etc/franInquiry";}
	@RequestMapping("/etc/franComplete.do")
	public String franComplete() {return "etc/franComplete";}
	
	/*
	 이부분 /admin 치면 로그인화면으로 바로 뜨게 하고싶은데 연결이 안되가지고..
	 처음 관리자페이지 진입할때 주소를 /admin 하면 관리자페이지로그인 화면이 뜨게 하고싶어요 근데안댐 ㅋ
	 */

	@RequestMapping(value="/order/cart2", method=RequestMethod.GET) 
	 public String base1() { 
		 System.out.println("homecontrollerasdf");
		 return "/common/cart2"; 
	}
	
	 @RequestMapping(value="/admin/{var}", method=RequestMethod.GET) 
	 public String base(@PathVariable String var) { 
		 System.out.println("homecontroller");
		 return "/admin/"+ var; 
	}
	 
	 
	 
	 
}
