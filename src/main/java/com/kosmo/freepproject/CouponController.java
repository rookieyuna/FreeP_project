package com.kosmo.freepproject;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import coupon.CouponImpl;
import coupon.CouponVO;
import review.ReviewBoardDAOImpl;
import review.ReviewBoardDTO;
import util.PagingUtil;

@Controller
public class CouponController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/admin/coupon.do")
	public String list(Model model, HttpServletRequest req) {

		//게시물 전체갯수 
		int totalRecordCount =
				sqlSession.getMapper(CouponImpl.class).getTotalCount();

		//페이지 처리를 위한 설정값
		int pageSize = 8;//한 페이지당 출력할 게시물의 갯수
		int blockPage = 3;//한 블럭당 출력할 페이지번호의 갯수
		//전체 페이지 수 계산
		//int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);

		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals("")) 
				? 1 : Integer.parseInt(req.getParameter("nowPage"));

		//해당 페이지에 출력할 게시물의 구간을 계산한다. 
		int start = (nowPage-1) * pageSize + 1;
		int end = pageSize * nowPage;  

		//게시물 데이터 읽어오기 
		ArrayList<CouponVO> lists =
				sqlSession.getMapper(CouponImpl.class).listPage(start, end);

		String pagingImg =
				PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
						req.getContextPath()+"/admin/coupon.do?");
		model.addAttribute("pagingImg", pagingImg);

	
		model.addAttribute("lists", lists);		

		return "admin/coupon-list";
	}
	
	@RequestMapping(value="/admin/couponWrite.do", method=RequestMethod.POST)
	public String writeAction(Model model, MultipartHttpServletRequest req) {

		CouponVO coupon = new CouponVO();
		coupon.setCp_name(req.getParameter("title"));
		coupon.setCp_cate(req.getParameter("text"));
		coupon.setCp_price(Integer.parseInt(req.getParameter("price_start")));
		coupon.setCp_const(Integer.parseInt(req.getParameter("price_end")));
		coupon.setIssue_date(req.getParameter("date_start"));
		coupon.setExpire_date(req.getParameter("date_end"));

		 
		
		sqlSession.getMapper(CouponImpl.class).write( coupon );
		//쓰기 처리를 완료한 후 리스트로 이동
		return "redirect:coupon.do";
	}
	
	@RequestMapping(value="/admin/couponremovechk.do")
	public String removechk(Model model, HttpServletRequest req) {

		//물리적경로 얻어오기	
		String[] bd_no = req.getParameterValues("chk");

		for(int i = 0; i <bd_no.length; i++) {
		sqlSession.getMapper(CouponImpl.class).delete( 
				Integer.parseInt(bd_no[i]) );
		
		}
		//삭제 처리를 완료한 후 리스트로 이동
		return "redirect:coupon.do";
	}
	
}
