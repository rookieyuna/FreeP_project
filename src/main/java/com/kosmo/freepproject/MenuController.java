package com.kosmo.freepproject;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.HandlerMapping;

import board.BoardDAOImpl;
import cart.CartImpl;
import menu.MenuImpl;
import menu.MenuVO;
import net.sf.json.JSONArray;
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
		int pageSize = 8;//한 페이지당 출력할 게시물의 갯수
		int blockPage = 3;//한 블럭당 출력할 페이지번호의 갯수
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
		MenuVO menuVO = new MenuVO();
		
		try {
			String var = req.getParameter("deleteofile");
			if(var != null)
			{
				//기존에 있던 파일 uploads 폴더에서 삭제
				String deletefile = req.getParameter("pre_sfile");
				File file = new File(path+File.separator+deletefile);
				if(file.exists()) {
					file.delete();
				}
				sqlSession.getMapper(MenuImpl.class).deletefile(req.getParameter("p_code"));
			}
			
			mfile = req.getFile("file");

			//한글깨짐방지 처리 후 전송된 파일명을 가져온다. 
			originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");

			//서버로 전송된 파일이 없다면 while문의 처음으로 돌아간다. 
			if("".equals(originalName)) {
				originalName = "";
				saveFileName = "";
				
				menuVO.setP_sfile(saveFileName);
				menuVO.setP_ofile(originalName);
			}
			else {			
				//파일명에서 확장자를 따낸다. 
				String ext = originalName.substring(originalName.lastIndexOf('.'));

				//UUID를 통해 생성된 문자열과 확장자를 결합해서 파일명을 완성한다. 
				saveFileName = getUuid() + ext;
				
				//물리적경로에 새롭게 생성된 파일명으로 파일 저장				
				Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
	            mfile.transferTo(path1.toFile());
	            
	            menuVO.setP_sfile(saveFileName);
				menuVO.setP_ofile(originalName);
			} 
			
			menuVO.setG_code(Integer.parseInt(req.getParameter("g_code"))); 
			menuVO.setP_code(Integer.parseInt(req.getParameter("p_code")));
			menuVO.setP_name(req.getParameter("p_name")); 
			menuVO.setP_price(req.getParameter("p_price")); 
			menuVO.setP_size(req.getParameter("p_size")); 
			menuVO.setP_info(req.getParameter("p_info")); 
			
			
			sqlSession.getMapper(MenuImpl.class).edit(menuVO);
			  
			return "redirect:menu.do?g_code="+menuVO.getG_code(); 
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
	
	
	@RequestMapping(value={"/order/orderDIY.do", "/order/orderDrink.do", "/order/orderSide.do", "/order/orderNormal.do"})
	public String menuList(Model model, HttpServletRequest req, Principal principal) {
		String requestUrl = (String)req.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);

		ArrayList<MenuVO> lists =
			sqlSession.getMapper(MenuImpl.class).selectAllmenu();
		
		for(int i=0 ; i < lists.size()-1; i++) {
			if(lists.get(i).getP_name().equals(lists.get(i+1).getP_name())) {
				lists.get(i).setP_price1(lists.get(i+1).getP_price());
				lists.get(i).setP_size1(lists.get(i+1).getP_size());
				lists.get(i).setP_info1(lists.get(i+1).getP_info());
			}
		}
		System.out.println("제품목록 : "+lists);
		model.addAttribute("lists", lists);
		
		
		Object principal2 = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//회원코드 
		if(principal2.equals("anonymousUser")) {
			model.addAttribute("id","");
		}
		else {			
			model.addAttribute("id",principal2);
		}

		if(requestUrl.equals("/order/orderDIY.do")) {
			return "/order/orderDIY";
		}else if(requestUrl.equals("/order/orderDrink.do")){
			return "/order/orderDrink";
	    }else if(requestUrl.equals("/order/orderSide.do")){
	    	return "/order/orderSide";
	    }else if(requestUrl.equals("/order/orderNormal.do")){
	    	return "/order/orderNormal";
	    }else {
	    	return "";
	    }
	}	
	
	// 장바구니 등록
	@RequestMapping(value={"/order/insertCart.do"}, method=RequestMethod.POST)
	public String insertCart(Model model, HttpServletRequest req, Principal principal) {
		String requestUrl = (String)req.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		String referer = req.getHeader("Referer");

		//회원코드 
		String user_id = "";
		user_id = principal.getName();

		int m_code = 
				sqlSession.getMapper(BoardDAOImpl.class).findm_code(user_id);
		String m_codeStr = Integer.toString(m_code);
		try {
			
			String[] code = (String[]) req.getParameterValues("ct_code");
			
			for(int i=0; i<code.length; i++) {
				System.out.println("code : "+code[i]);
				Map<String, Object> sqlData = new HashMap<String, Object>();
				sqlData.put("m_code", m_codeStr);
				sqlData.put("ct_code", code[i]);
				/*
				기존에 테이블에 같은 제품이 있따면? 판별하고 insert가 아닌 update 수량 [여기부분만 제가했읍니다 STI]*/
				int num = sqlSession.getMapper(CartImpl.class).confirmCart(sqlData);
				if(num != 0) { //같은제품이 있따!는뜻
					sqlData.put("ct_count", 1);
					sqlSession.getMapper(CartImpl.class).updateCountCart(sqlData);
				}
				else {		
					sqlSession.getMapper(MenuImpl.class).insertCart(sqlData);
				}
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	
		 return "redirect:"+ referer; 
	}

		
	@RequestMapping(path = "/order/insertCartDiy.do")
	@ResponseBody
	public Map<String, Object> insertCartDiy(Model model, HttpServletRequest req, Principal principal, @RequestParam String data){
		String referer = req.getHeader("Referer");
		//회원코드 
		String user_id = "";
		user_id = principal.getName();
		int m_code = 
				sqlSession.getMapper(BoardDAOImpl.class).findm_code(user_id);
		String m_codeStr = Integer.toString(m_code);
		
		Map<String, Object> result = new HashMap<String, Object>();
		try {
		    List<Map<String,Object>> info = new ArrayList<Map<String,Object>>();
		    info = JSONArray.fromObject(data);
		    
		    // INSERT TABLE DIY
		    for (Map<String, Object> sendData : info) {
		    	List<Object> targetList = new ArrayList<Object>(sendData.values());
		    	// DIY 토탈 가격
		    	Integer d_price = sqlSession.getMapper(MenuImpl.class).insertCartDiyCalc(targetList);
		    	sendData.put("d_price", d_price);
		    	String d_nameStr = user_id + "님의 DIY 피자";
		    	sendData.put("d_name", d_nameStr);
		    	sqlSession.getMapper(MenuImpl.class).insertCartDiy(sendData);
		        
		        // INSERT TABLE CART
		        	// 필요 데이터 얻어오기(시퀀스 값)
		        Map<String, Object> sqlData = new HashMap<String, Object>();
				sqlData.put("m_code", m_codeStr);
				sqlData.put("ct_code", sendData.get("diy_idx"));
				sqlData.put("ct_name", d_nameStr);

				sqlSession.getMapper(MenuImpl.class).insertCart(sqlData);
		    }  
		    result.put("result", referer);
		} catch (Exception e) {
		    result.put("result", false);
		}
		return result;
	}
}


