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

import menu.MenuImpl;
import menu.MenuVO;
import util.PagingUtil_menu;
import util.ParameterDTO;

@Controller
public class MenuController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/admin/menu.do")
	public String list(Model model, HttpServletRequest req) {

		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");
		
		//Mapper로 전달할 파라미터를 저장할 DTO 객체 생성
		ParameterDTO parameterDTO = new ParameterDTO();
		//검색어가 있을 경우 저장
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setG_code(req.getParameter("g_code"));
		
		int totalRecordCount =
			sqlSession.getMapper(MenuImpl.class).getTotalCount(parameterDTO);
				
		
		//페이지 처리를 위한 설정값
		int pageSize = 2;//한 페이지당 출력할 게시물의 갯수
		int blockPage = 2;//한 블럭당 출력할 페이지번호의 갯수
		//전체 페이지 수 계산
		//int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);

		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals("")) 
			? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		String g_code = parameterDTO.getG_code();
		
		//해당 페이지에 출력할 게시물의 구간을 계산한다. 
		int start = (nowPage-1) * pageSize + 1;
		int end = pageSize * nowPage;
		
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);

		ArrayList<MenuVO> lists =
			sqlSession.getMapper(MenuImpl.class).listPage(parameterDTO);
		
		if(g_code!=null) {
			String pagingImg =
					PagingUtil_menu.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
						req.getContextPath()+"/admin/menu.do?g_code="+g_code);
			
			model.addAttribute("pagingImg", pagingImg);
		}
		else {
			String pagingImg =
					PagingUtil_menu.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
							req.getContextPath()+"/admin/menu.do?");
			
			model.addAttribute("pagingImg", pagingImg);
		}
		
		model.addAttribute("lists", lists);
		model.addAttribute("g_code", g_code);
		model.addAttribute("path", path);
		
		return "admin/menu_list";
	}	
	
	
	public static String getUuid(){
		String uuid = UUID.randomUUID().toString();		
		uuid = uuid.replaceAll("-", "");
		
		return uuid;
	}

	
	//상품등록
	@RequestMapping(value="/admin/menuRegist.do", method=RequestMethod.POST)
	public String regist(Model model, MultipartHttpServletRequest req) {

		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");
		MultipartFile mfile = null;

		String originalName;
		String saveFileName;
		try {
			mfile = req.getFile("file");

			//한글깨짐방지 처리 후 전송된 파일명을 가져온다. 
			originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");

			//서버로 전송된 파일이 없다면 while문의 처음으로 돌아간다. 
			if("".equals(originalName)) {
				originalName = "";
				saveFileName = "";
			}
			else {			
				//파일명에서 확장자를 따낸다. 
				String ext = originalName.substring(originalName.lastIndexOf('.'));

				//UUID를 통해 생성된 문자열과 확장자를 결합해서 파일명을 완성한다. 
				saveFileName = getUuid() + ext;
				
				//System.out.println("saveFileName: "+saveFileName);
				//물리적경로에 새롭게 생성된 파일명으로 파일 저장				
				Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
	            mfile.transferTo(path1.toFile()); 
			}
			
			MenuVO menuVO = new MenuVO();
			menuVO.setG_code(Integer.parseInt(req.getParameter("g_code"))); 
			menuVO.setP_name(req.getParameter("p_name")); 
			menuVO.setP_price(req.getParameter("p_price")); 
			menuVO.setP_size(req.getParameter("p_size")); 
			menuVO.setP_info(req.getParameter("p_info")); 
			menuVO.setP_ofile(originalName);
			menuVO.setP_sfile(saveFileName);
			menuVO.setP_best_pizza(Integer.parseInt(req.getParameter("p_best_pizza"))); 
			
			sqlSession.getMapper(MenuImpl.class).regist(menuVO);
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		//쓰기 처리를 완료한 후 리스트로 이동
		return "redirect:menu.do?g_code="+req.getParameter("g_code");
	}
	
	
	//상세보기
	@RequestMapping("/admin/menuView.do")
	public String view(Model model, HttpServletRequest req) {
		
		ParameterDTO parameterDTO = new ParameterDTO();
		parameterDTO.setP_code(req.getParameter("p_code"));
		
		MenuVO vo = sqlSession.getMapper(MenuImpl.class).view(parameterDTO);
		
		model.addAttribute("vo", vo);
		return "/admin/menu_detail";
	}
	
	
	//수정하기진입
	@RequestMapping("/admin/menuEdit.do")
	public String edit(Model model, HttpServletRequest req) {
		
		ParameterDTO parameterDTO = new ParameterDTO();
		parameterDTO.setP_code(req.getParameter("p_code"));
		
		MenuVO vo = sqlSession.getMapper(MenuImpl.class).view(parameterDTO);
		
		model.addAttribute("vo", vo);
		return "/admin/menu_edit";
	}

	
	@RequestMapping(value="/admin/menuEditAction.do", method=RequestMethod.POST)
	public String editAction(Model model, MultipartHttpServletRequest req) {

		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");
		MultipartFile mfile = null;

		String originalName;
		String saveFileName;
		
		String g_code =req.getParameter("g_code");
		try {
			
			//기존에 있던 파일 uploads 폴더에서 삭제
			String deletefile = req.getParameter("pre_sfile");
			File file = new File(path+File.separator+deletefile);
			if(file.exists()) {
				file.delete();
			}
			
			mfile = req.getFile("file");

			//한글깨짐방지 처리 후 전송된 파일명을 가져온다. 
			originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");

			//서버로 전송된 파일이 없다면 while문의 처음으로 돌아간다. 
			if("".equals(originalName)) {
				originalName = "";
				saveFileName = "";
			}
			else {			
				//파일명에서 확장자를 따낸다. 
				String ext = originalName.substring(originalName.lastIndexOf('.'));

				//UUID를 통해 생성된 문자열과 확장자를 결합해서 파일명을 완성한다. 
				saveFileName = getUuid() + ext;
				
				//물리적경로에 새롭게 생성된 파일명으로 파일 저장				
				Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
	            mfile.transferTo(path1.toFile()); 
			} 
			
			MenuVO MenuVO = new MenuVO();
			MenuVO.setG_code(Integer.parseInt(req.getParameter("g_code"))); 
			MenuVO.setP_code(Integer.parseInt(req.getParameter("p_code")));
			MenuVO.setP_name(req.getParameter("p_name")); 
			MenuVO.setP_price(req.getParameter("p_price")); 
			MenuVO.setP_size(req.getParameter("p_size")); 
			MenuVO.setP_info(req.getParameter("p_info")); 
			MenuVO.setP_sfile(saveFileName);
			MenuVO.setP_ofile(originalName);
			MenuVO.setP_best_pizza(Integer.parseInt(req.getParameter("p_best_pizza"))); 
			
			
			sqlSession.getMapper(MenuImpl.class).edit(MenuVO);
			  
			return "redirect:menu.do?g_code="+MenuVO.getG_code(); 
		}
		catch(Exception e) { 
			e.printStackTrace();
		}
		
		return "redirect:menu.do?g_code="+g_code; 
	}
	
	
	@RequestMapping(value="/admin/menuDelete.do")
	public String delete(Model model, HttpServletRequest req) {
		
		String p_code = req.getParameter("p_code");
		String g_code = req.getParameter("g_code");
		
		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");

		try {
			//기존에 있던 파일 uploads 폴더에서 삭제
			String deletefile = req.getParameter("pre_sfile");
			File file = new File(path+File.separator+deletefile);
			if(file.exists()) {
				file.delete();
			}

			sqlSession.getMapper(MenuImpl.class).delete(p_code);

		}
		catch(Exception e) { 
			e.printStackTrace();
		}

		return "redirect:menu.do?g_code="+g_code; 
	}
	

	@RequestMapping(value="/admin/menuDeleteChk.do")
	public String removechk(Model model, HttpServletRequest req) {

		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");
		
		String[] menu_no = req.getParameterValues("chk");
		String g_code = req.getParameter("g_code");
		
		
		try {
			for(int i = 0; i <menu_no.length; i++) {
				
				//기존에 있던 파일 uploads 폴더에서 삭제
				//String deletefile = req.getParameter("pre_sfile");
				String sfile =
						sqlSession.getMapper(MenuImpl.class).selectsfile(menu_no[i]);
				
				File file = new File(path+File.separator+sfile);
				if(file.exists()) {
					file.delete();
				}
				sqlSession.getMapper(MenuImpl.class).delete((menu_no[i]).toString());
			}

		}
		catch(Exception e) { 
			e.printStackTrace();
		}
		
		return "redirect:menu.do?g_code="+g_code;
	}
}
