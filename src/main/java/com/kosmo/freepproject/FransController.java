package com.kosmo.freepproject;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import Franchise.FransImpl;
import Franchise.FransVO;
import board.BoardDAOImpl;
import board.BoardDTO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import util.PagingUtil;
import util.ParameterDTO;

@Controller
public class FransController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/admin/franlist.do")
	public String listSearch(Model model, HttpServletRequest req) {
		
		//Mapper로 전달할 파라미터를 저장할 DTO 객체 생성
		ParameterDTO parameterDTO = new ParameterDTO();
		//검색어가 있을 경우 저장
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		
		//게시물 카운트(DTO 객체를 인수로 전달)
		int totalRecordCount = 
				sqlSession.getMapper(FransImpl.class).getTotalCount(parameterDTO);
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
		ArrayList<FransVO> lists = 
				sqlSession.getMapper(FransImpl.class).listPage(parameterDTO);
		
		
		String pagingImg = PagingUtil.pagingImg(totalRecordCount,
	            pageSize, blockPage, nowPage, 
	            req.getContextPath()+"/admin/franlist.do?");
		
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("lists", lists);
		
		//검색 기능이 추가된 view를 반환
		return "admin/fran_list";
	}
	
	public static String getUuid(){
		String uuid = UUID.randomUUID().toString();		
		uuid = uuid.replaceAll("-", "");
		
		return uuid;
	}
	
	//가맹문의 작성하기
	
	
	
	//수정하기진입
	@RequestMapping("/admin/franEdit.do")
	public String view(Model model, HttpServletRequest req) {
		
		ParameterDTO parameterDTO = new ParameterDTO();
		parameterDTO.setF_code(req.getParameter("f_code"));
		
		FransVO vo = sqlSession.getMapper(FransImpl.class).view(parameterDTO);
		
		model.addAttribute("vo", vo);
		return "admin/fran_detail";
	}

		
	@RequestMapping(value="/admin/franEditAction.do",method=RequestMethod.POST)
	public String editAction(FransVO fransVO, HttpServletRequest req) {
		
		sqlSession.getMapper(FransImpl.class).edit(fransVO);
		
		return "redirect:franlist.do";
	}
	
	//가맹문의 삭제하기
	@RequestMapping("/admin/franDelete.do")
	public String delete(Model model, HttpServletRequest req) {
		
		String f_code = req.getParameter("f_code");
		
		sqlSession.getMapper(FransImpl.class).delete(req.getParameter("f_code"));
		
		return "redirect:franlist.do";
	}
	
	//체크한 것 삭제
	@RequestMapping(value="/admin/franDeleteChk.do")
	public String removechk(Model model, HttpServletRequest req) {
		
		String[] f_code = req.getParameterValues("chk");
		
		try {
			for(int i = 0; i <f_code.length; i++) {
				sqlSession.getMapper(FransImpl.class).delete(f_code[i].toString());
			}
		}
		catch(Exception e) { 
			e.printStackTrace();
		}
		
		return "redirect:franlist.do";
	}
	
	
	
	
	//이메일발송용 주입
	@Autowired
	private JavaMailSender mailSender;
	
	
	//가맹문의페이지 입력 액션 + 이메일 발송
	@RequestMapping(value="/etc/franWriteAction.do", method=RequestMethod.POST)
	public String franWriteAction(Model model, HttpServletRequest req) {

		
		String f_name = req.getParameter("f_name");
		String f_phone = req.getParameter("f_phone");
		String f_email = req.getParameter("email1") + "@" + req.getParameter("email2");
		String f_address = req.getParameter("address1") + "-" + req.getParameter("address2");
		String f_content = req.getParameter("f_content");
		
		
		FransVO fransVO = new FransVO();
		fransVO.setF_name(f_name);
		fransVO.setF_phone(f_phone);
		fransVO.setF_email(f_email);
		fransVO.setF_address(f_address);
		fransVO.setF_content(f_content);
		
		
		f_content.replace("\r\n","<br/>");
		
		sqlSession.getMapper(FransImpl.class).write(fransVO);
	
		
		//메일발송
		String setfrom = "freepwebproject@gmail.com";
		String tomail = "freepwebproject@gmail.com";
		//String tomail = req.getParameter("tomail"); // 받는 사람 이메일
		//String title = req.getParameter("title"); // 제목
		//String content = req.getParameter("content"); // 내용
		
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject("FreeP가맹문의 - " + f_name + "-"+ f_phone) ; // 메일제목은 생략이 가능하다
			
			
			String mail_contents = ""
					+ "문의자 이름  : " + f_name + "\n"
					+ "창업희망지역 : " + f_address + "\n"
					+ "휴 대 전 화  : " + f_phone + "\n"
					+ "이  메  일   : " + f_email + "\n" 
					+ "문 의 내 용  : " + f_content 	
					;
			
			
			
			messageHelper.setText(mail_contents.toString()); // 메일 내용
			
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		
		
		//쓰기 처리를 완료한 후 리스트로 이동
		return "redirect:franComplete.do";
	}
	
}
