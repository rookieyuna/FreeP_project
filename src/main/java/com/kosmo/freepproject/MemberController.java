package com.kosmo.freepproject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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

	//관리자페이지 계정 리스트
	@RequestMapping("/admin/member.do")
	public String listSearch(Model model, HttpServletRequest req) {

		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setGrade(req.getParameter("grade"));

		// 계정 개수 카운트
		int totalRecordCount = sqlSession.getMapper(MemberImpl.class).getTotalCount(parameterDTO);

		int pageSize = 8; // 한 페이지당 출력할 게시물의 개수
		int blockPage = 3; // 한 블럭당 출력할 페이지 번호의 개수

		int nowPage = (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals("")) ? 1
				: Integer.parseInt(req.getParameter("nowPage"));
		String grade = parameterDTO.getGrade();

		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;

		// 위에서 계산한 게시물의 구간 start, end를 DTO에 저장
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);

		// 출력할 회원 select
		ArrayList<MemberVO> lists = sqlSession.getMapper(MemberImpl.class).listPage(parameterDTO);

		String pagingImg = PagingUtil_mem.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/admin/member.do?grade=" + grade);

		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("lists", lists);
		model.addAttribute("grade", grade);

		// 검색 기능이 추가된 view를 반환
		return "admin/member_list";
	}

	//관리자 페이지 회원 등록
	@RequestMapping(value = "/admin/memRegist.do", method = RequestMethod.POST)
	public String regist(Model model, HttpServletRequest req) {

		sqlSession.getMapper(MemberImpl.class).regist(req.getParameter("id"), req.getParameter("name"),
				req.getParameter("pass"), req.getParameter("phone"), req.getParameter("email"),
				req.getParameter("grade"));

		return "redirect:member.do?grade=" + req.getParameter("grade");
	}

	//관리자 페이지 회원 수정 페이지 진입하기
	@RequestMapping("/admin/memView.do")
	public String view(Model model, HttpServletRequest req) {

		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setM_code(req.getParameter("m_code"));

		MemberVO vo = sqlSession.getMapper(MemberImpl.class).view(parameterDTO);

		model.addAttribute("vo", vo);

		return "admin/member_modify";
	}

	//관리자 페이지 회원 정보 수정 처리
	@RequestMapping("/admin/memModify.do")
	public String modifyAction(HttpSession session, MemberVO memberVO) {

		sqlSession.getMapper(MemberImpl.class).modify(memberVO);

		return "redirect:member.do?grade=" + memberVO.getGrade();
	}

	//관리자 페이지 회원 삭제
	@RequestMapping("/admin/memDelete.do")
	public String delete(HttpServletRequest req) {
		String m_code = req.getParameter("m_code");
		String grade = req.getParameter("grade");

		sqlSession.getMapper(MemberImpl.class).delete(m_code);

		return "redirect:member.do?grade=" + grade;
	}

	//관리자 페이지 회원 체크박스 삭제
	@RequestMapping(value = "/admin/memDeleteChk.do")
	public String removechk(Model model, HttpServletRequest req) {

		String[] mem_no = req.getParameterValues("chk");
		String grade = req.getParameter("grade");

		try {
			for (int i = 0; i < mem_no.length; i++) {
				sqlSession.getMapper(MemberImpl.class).delete(mem_no[i].toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:member.do?grade=" + grade;
	}

	// 회원가입 첫번째 페이지 매핑
	@RequestMapping("/member/regist1.do")
	public String regStep1() {
		return "member/regStep1";
	}

	// 회원가입 두번째 페이지
	@RequestMapping(value = "/member/regist2.do", method = RequestMethod.POST)
	public String regStep2() {
		return "member/regStep2";
	}

	// 회원가입 처리 입력값 DB로 넘기고 regStep3로 이동
	@RequestMapping(value = "/member/regAction.do", method = RequestMethod.POST)
	public String regAction(Model model, HttpServletRequest req) {

		String email = req.getParameter("email1")+"@"+req.getParameter("email2");
		String address = req.getParameter("address")+" "+req.getParameter("address2");
		
		
		MemberVO memberVO = new MemberVO();
		memberVO.setId(req.getParameter("id")); 
		memberVO.setName(req.getParameter("name")); 
		memberVO.setPass(req.getParameter("pass")); 
		memberVO.setPhone(req.getParameter("phone")); 
		memberVO.setEmail(email);
		memberVO.setZipcode(req.getParameter("zipcode"));
		memberVO.setAddress(address); 
		System.out.println(memberVO);
		sqlSession.getMapper(MemberImpl.class).regAction(memberVO);
		sqlSession.getMapper(MemberImpl.class).coupon(memberVO);
		
		
		return "member/regStep3";
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/member/id_check_person.do", method = RequestMethod.GET)
	public Map<String, Object> id_check_person(Model model, HttpServletRequest req) throws Exception {
		String id = (String) req.getParameter("id");
		int num = sqlSession.getMapper(MemberImpl.class).idChk(id);
		System.out.println(id);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("num", num);
		return result;

	} 

	// 휴대폰 본인인증

	@ResponseBody
	@RequestMapping(value = "/member/phoneCheck.do", method = RequestMethod.GET)
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);// 난수 생성
		System.out.println(userPhoneNumber);
		certifiedPhoneNumber(userPhoneNumber, randomNumber);
		return Integer.toString(randomNumber);
	}

	// 휴대폰 본인인증

	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		String api_key = "NCS09JGQR9YPPA7A";
		String api_secret = "FQJV13AOQ8EWSKFHG2TIEN8USQ6QMCMO";
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", userPhoneNumber); // 수신전화번호
		params.put("from", "01064250597"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "[TEST] 인증번호는" + "[" + randomNumber + "]" + "입니다."); // 문자 내용입력
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
			System.out.println("try영역");
		} catch (CoolsmsException e) {
			System.out.println("catch영역");
			System.out.println(e.getMessage());
			System.out.println(e.getCode());

		}
	}

	// 아이디 패스워드 찾기 페이지 매핑
	@RequestMapping("/member/find.do")
	public String find() {
		return "member/findidpw";
	}

	@RequestMapping(value = "/member/kakaoLogin.do")
	@ResponseBody
	public Map<String, Object> kakoLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
	
		String id= request.getParameter("kakaoid");
		String name = request.getParameter("kakaoname");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kakaoid", id);
		map.put("kakaoname", name);
		
		int kakaoNum = sqlSession.getMapper(MemberImpl.class).kakaoselect(id);
		map.put("kakaoNum", kakaoNum);
		
		
		return map;
	}
	
	@RequestMapping("/member/regStepKakao.do")
	public String regStepKakao(Model model, HttpServletRequest req) {
		String a = req.getParameter("kakaoid");
		model.addAttribute("b",a);
		

		return "member/regStepKakao";
		}
	
	// 카카오 회원가입 처리 입력값 DB로 넘기
	
	 @RequestMapping(value = "/member/kakaoAction.do", method = RequestMethod.POST)
	 public String kakaoAction(Model model, HttpServletRequest req) {
	 
		 
			String email = req.getParameter("email1") + "@" + req.getParameter("email2");
			String address = req.getParameter("address") + " " + req.getParameter("address2");

			MemberVO memberVO = new MemberVO();
			memberVO.setId(req.getParameter("id"));
			memberVO.setName(req.getParameter("name"));
			memberVO.setPass(req.getParameter("pass"));
			memberVO.setPhone(req.getParameter("phone"));
			memberVO.setEmail(email);
			memberVO.setZipcode(req.getParameter("zipcode"));
			memberVO.setAddress(address);
			System.out.println(memberVO);
			sqlSession.getMapper(MemberImpl.class).regkakaoAction(memberVO);
			sqlSession.getMapper(MemberImpl.class).coupon(memberVO);


			return "member/regStep3";
	 }

		
		
		
		
		 
		//아이디 찾기 페이지 매핑
			@RequestMapping("/member/findId.do")
			public String findId() {return "member/findId";}
			
			//아이디 찾기 처리
			@ResponseBody
			@RequestMapping(value="/member/search_id.do", method = RequestMethod.GET)
			public Map<String,Object> search_id(Model model, HttpServletRequest req) throws Exception{
				String phone = (String) req.getParameter("phone");
				String id = sqlSession.getMapper(MemberImpl.class).find_id(phone);
				System.out.println(phone);
				Map<String, Object> result = new HashMap<String, Object>();
		        result.put("id", id);
				return result;
				
			}
			 
			//패스워드 찾기 페이지 매핑
			@RequestMapping("/member/findPw.do")
			public String findPw() {return "member/findPw";}
			
			
			//패스워드 변경하기 페이지 매핑
			@RequestMapping("/member/pwChange.do")
			public String pwChange(HttpServletRequest req, Model model) {
				
				String phone = req.getParameter("phone");
				model.addAttribute("phone", phone);
				
				return "member/pwChange";
			}
			
			
			//패스워드 변경처리 
			@RequestMapping("/member/pwAction.do")
			public String pwAction(HttpServletRequest req, Model model) {
				
				
				MemberVO memberVO = new MemberVO();
				memberVO.setPass(req.getParameter("pass")); 
				memberVO.setPhone(req.getParameter("phone")); 
				
				int result = sqlSession.getMapper(MemberImpl.class).pwAction(memberVO);
				
				if(result>0) {
					model.addAttribute("msg","패스워드가 수정되었습니다.");
					//return "member/myPwUpdate";
					return "member/myPwUpdate";
				}
				else {
					model.addAttribute("msg","패스워드 수정에 실패하였습니다.\\n가입 시 입력한 휴대폰 번호를 다시 확인해 주세요");
			        
			        return "member/myPwFail";
				}
				
			}
		 
		
		

}
