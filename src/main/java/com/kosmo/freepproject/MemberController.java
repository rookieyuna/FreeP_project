package com.kosmo.freepproject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberImpl;
import member.MemberVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import util.PagingUtil_mem;
import util.ParameterDTO;

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
	
	
	//회원가입 첫번째 페이지 매핑
		@RequestMapping("/member/regist1.do")
		public String regStep1() {return "member/regStep1";}
		//회원가입 두번째 페이지
		@RequestMapping(value="/member/regist2.do", method=RequestMethod.POST)
		public String regStep2() {return "member/regStep2";}
		
		//회원가입 처리 입력값 DB로 넘기고 regStep3로 이동
		@RequestMapping(value="/member/regAction.do" , method = RequestMethod.POST)
		public String regAction(Model model, HttpServletRequest req) {
			
			String phone = req.getParameter("hand_tel1")+"-"+req.getParameter("hand_tel2")+"-"+req.getParameter("hand_tel3");
			String email = req.getParameter("email1")+"@"+req.getParameter("email2");
			String address = req.getParameter("address")+" "+req.getParameter("address2");
			
			
			MemberVO memberVO = new MemberVO();
			memberVO.setId(req.getParameter("id")); 
			memberVO.setName(req.getParameter("name")); 
			memberVO.setPass(req.getParameter("pass")); 
			memberVO.setPhone(phone); 
			memberVO.setEmail(email);
			memberVO.setZipcode(req.getParameter("zipcode"));
			memberVO.setAddress(address); 
			System.out.println(memberVO);
			sqlSession.getMapper(MemberImpl.class).regAction(memberVO);
			sqlSession.getMapper(MemberImpl.class).coupon(memberVO);
			
			
			return "member/regStep3";}
		
		//아이디 중복 체크
		@ResponseBody
		@RequestMapping(value="/member/id_check_person.do", method = RequestMethod.GET)
		public Map<String,Object> id_check_person(Model model, HttpServletRequest req) throws Exception{
			String id = (String) req.getParameter("id");
			int num = sqlSession.getMapper(MemberImpl.class).idChk(id);
			System.out.println(id);
			Map<String, Object> result = new HashMap<String, Object>();
	        result.put("num", num);
			return result;
			
		}
		
		//휴대폰 본인인증
		
		 @RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
		  
		 @ResponseBody 
		 public String sendSMS(@RequestParam("phone") String
		 userPhoneNumber) { // 휴대폰 문자보내기 
			 int randomNumber = (int)((Math.random()*(9999 - 1000 + 1)) + 1000);//난수 생성
			 certifiedPhoneNumber(userPhoneNumber,randomNumber); 
			 return Integer.toString(randomNumber); 
		 } 
		 
		//휴대폰 본인인증
			
		 public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		 String api_key = "NCSGOIQ67LAVMBIU"; 
		 String api_secret = "JM35WZMCTAE0A5ZSAERCB9VACDIGKRAN"; 
		 Message coolsms = new Message(api_key, api_secret); 
		 
		 // 4 params(to, from, type, text) are mandatory. must be filled
		 HashMap<String, String> params = new HashMap<String, String>();
		 params.put("to", userPhoneNumber); // 수신전화번호 
		 params.put("from", "자신의 번호"); //발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨 
		 params.put("type", "SMS");
		 params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용입력 
		 params.put("app_version", "test app 1.2"); // application name and version
		 
		 try { 
			 JSONObject obj = (JSONObject) coolsms.send(params);
			 System.out.println(obj.toString()); 
			 } 
			 catch (CoolsmsException e) {
			 System.out.println(e.getMessage()); 
			 System.out.println(e.getCode()); 
			 }
		  }
		
		
}
