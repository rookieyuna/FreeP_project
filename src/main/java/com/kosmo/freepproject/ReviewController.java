package com.kosmo.freepproject;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.BoardDAOImpl;
import board.BoardDTO;
import cart.CartImpl;
import menu.MenuImpl;
import menu.MenuVO;
import mypage.MypageImpl;
import net.sf.json.JSONArray;
import order.OrderDTO;
import util.ParameterDTO;
import review.LikedReviewDTO;
import review.ReviewBoardDAOImpl;
import review.ReviewBoardDTO;
import util.PagingUtil;
import util.PagingUtil_front;
/*
 
 */
@Controller
public class ReviewController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	/************************리뷰 관리자페이지**************************/
	
	//리뷰 게시판 리스트 보여주기
	@RequestMapping("/admin/review.do")
	public String list(Model model, HttpServletRequest req) {
		
		//게시물 전체갯수 
		int totalRecordCount =
			sqlSession.getMapper(ReviewBoardDAOImpl.class).getTotalCount();
		
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
		ArrayList<ReviewBoardDTO> lists =
			sqlSession.getMapper(ReviewBoardDAOImpl.class).listPage(start, end);
				
		String pagingImg =
			PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath()+"/admin/review.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		//내용에 대한 줄바꿈 처리
		for(ReviewBoardDTO dto : lists){
			String temp = dto.getContents().replace("\r\n","<br/>");
			dto.setContents(temp);
		}
		model.addAttribute("lists", lists);		
		
		return "admin/review-list";
	}	
	
	//리뷰 리스트 검색처리
	@RequestMapping("/admin/reviewSearch.do")
	public String listSearch(Model model, HttpServletRequest req) {

		
		ParameterDTO parameterDTO = new ParameterDTO();
		//검색어가 있을경우 저장
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchtxt"));
		
		int totalRecordCount =
			sqlSession.getMapper(ReviewBoardDAOImpl.class).getTotalCountSearch(parameterDTO);
		
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

		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
		
		ArrayList<ReviewBoardDTO> lists =
			sqlSession.getMapper(ReviewBoardDAOImpl.class).listPageSearch(parameterDTO);
				
		String pagingImg =
			PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath()+"/admin/review.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		//내용에 대한 줄바꿈 처리
		for(ReviewBoardDTO dto : lists){
			String temp = dto.getContents().replace("\r\n","<br/>");
			dto.setContents(temp);
		}
		model.addAttribute("lists", lists);		
		
		return "admin/review-list";
	}
	
	//sfile(upload폴더에 저장될 파일이름 생성용)
	public static String getUuid(){
		String uuid = UUID.randomUUID().toString();		
		//System.out.println("생성된UUID-1:"+ uuid);
		  
		uuid = uuid.replaceAll("-", "");
		//System.out.println("생성된UUID-2:"+ uuid);
		return uuid;
	}

	//리뷰 작성 글쓰기 insert
	@RequestMapping(value="/admin/reviewwriteAction.do", method=RequestMethod.POST)
	public String writeAction(Model model, MultipartHttpServletRequest req) {

		
		ReviewBoardDTO boarddto = new ReviewBoardDTO();
		boarddto.setOr_idx(Integer.parseInt(req.getParameter("order"))); //주문번호
		boarddto.setTitle(req.getParameter("title")); 
		boarddto.setContents(req.getParameter("text"));
		boarddto.setWriter(req.getParameter("writer"));
		
		//회원코드 가져오기 
		int id = 
				sqlSession.getMapper(ReviewBoardDAOImpl.class).findm_code( req.getParameter("id"));
		boarddto.setM_code(id);
		 
		
		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");
		MultipartFile mfile = null;

		String originalName;
		String saveFileName;
		try { 
			//파일1
			mfile = req.getFile("file1");
			originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
			if("".equals(originalName)) { //업로드된 파일이 없을때
				originalName = "";
				saveFileName = "";

				boarddto.setRv_ofile1(originalName);
				boarddto.setRv_sfile1(saveFileName);
			}
			else {			//업로드된 파일이 있을때
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				saveFileName = getUuid() + ext;
	
				Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
				mfile.transferTo(path1.toFile()); 
				boarddto.setRv_ofile1(originalName);
				boarddto.setRv_sfile1(saveFileName);
			}
			//파일2
			mfile = req.getFile("file2");
			originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
			if("".equals(originalName)) {
				originalName = "";
				saveFileName = "";

				boarddto.setRv_ofile2(originalName);
				boarddto.setRv_sfile2(saveFileName);
			}
			else {			
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				saveFileName = getUuid() + ext;
	
				Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
				mfile.transferTo(path1.toFile()); 
				boarddto.setRv_ofile2(originalName);
				boarddto.setRv_sfile2(saveFileName);
			}
			//파일3
			mfile = req.getFile("file3");
			originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
			if("".equals(originalName)) {
				originalName = "";
				saveFileName = "";

				boarddto.setRv_ofile3(originalName);
				boarddto.setRv_sfile3(saveFileName);
			}
			else {			
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				saveFileName = getUuid() + ext;
	
				Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
				mfile.transferTo(path1.toFile()); 
				boarddto.setRv_ofile3(originalName);
				boarddto.setRv_sfile3(saveFileName);
			}
			//DB에 인서트
			sqlSession.getMapper(ReviewBoardDAOImpl.class).write( boarddto );

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		//쓰기 처리를 완료한 후 리스트로 이동
		return "redirect:review.do";
	}

	//리뷰 상세보기
	@RequestMapping("/admin/reviewdetail.do")
	public String detail(Model model, HttpServletRequest req) {

		ReviewBoardDTO boardDTO = new ReviewBoardDTO();
		boardDTO.setRv_idx( Integer.parseInt(req.getParameter("idx"))); 
		
		ReviewBoardDTO dto = 
				sqlSession.getMapper(ReviewBoardDAOImpl.class).view(boardDTO);
		  
		
		model.addAttribute("dto", dto); 
		return "/admin/review-detail";
	}
	
	
	//리뷰 수정버튼 눌렀을때 데이터 가져오는거
	@RequestMapping("/admin/reviewedit.do")
	public String edit(Model model, HttpServletRequest req) {
		
		ReviewBoardDTO boardDTO = new ReviewBoardDTO();
		boardDTO.setRv_idx( Integer.parseInt(req.getParameter("idx"))); 
		
		ReviewBoardDTO dto = 
				sqlSession.getMapper(ReviewBoardDAOImpl.class).view(boardDTO);
		  
		
		model.addAttribute("dto", dto);
		return "/admin/review-edit";
	}

	
	@RequestMapping(value="/admin/revieweditAction.do", method=RequestMethod.POST)
	public String editAction(Model model, MultipartHttpServletRequest req) {

		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");
		MultipartFile mfile = null;

		String originalName;
		String saveFileName;
		ReviewBoardDTO boardDTO = new ReviewBoardDTO();
		try {
			//파일 1
			String var = req.getParameter("deleteofile1");
			
			if(var.equals("1")) //첨부파일 삭제 버튼이 눌린거라면
			{				
				//기존에 있던 파일 uploads 폴더에서 삭제
				String deletefile = req.getParameter("pre_sfile1");
				File file = new File(path+File.separator+deletefile);
				if(file.exists()) {					
					file.delete();
				}				
				// DB 에서도 sfile, ofile 속성 null로 바꿔주기
				sqlSession.getMapper(BoardDAOImpl.class).deletefile(Integer.parseInt(req.getParameter("pre_idx")));								
			} 
			if(req.getParameter("pre_file1") != null) //첨부파일이 있었고, 그대로 파일 유지하는 경우 실행 
			{
				boardDTO.setRv_sfile1(req.getParameter("pre_sfile1"));
				boardDTO.setRv_ofile1(req.getParameter("pre_file1"));				
			}
			else {	 		
				mfile = req.getFile("file1");
				originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
				if("".equals(originalName)) { //첨부파일이 아예 없는경우
					originalName = "";
					saveFileName = "";
					
					boardDTO.setRv_ofile1(originalName);
					boardDTO.setRv_sfile1(saveFileName);
				}
				else {		//첨부파일이 새로 등록된 경우
					String ext = originalName.substring(originalName.lastIndexOf('.'));
					saveFileName = getUuid() + ext;
					
					Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
					mfile.transferTo(path1.toFile()); 
					boardDTO.setRv_ofile1(originalName);
					boardDTO.setRv_sfile1(saveFileName);
				}
			}
			//파일 2
			var = req.getParameter("deleteofile2");
			if(var.equals("1"))
			{				
				//기존에 있던 파일 uploads 폴더에서 삭제
				String deletefile = req.getParameter("pre_sfile2");
				File file = new File(path+File.separator+deletefile);
				if(file.exists()) {					
					file.delete();
				}				
				sqlSession.getMapper(BoardDAOImpl.class).deletefile(Integer.parseInt(req.getParameter("pre_idx")));								
			}
			if(req.getParameter("pre_file2") != null)
			{
				boardDTO.setRv_sfile2(req.getParameter("pre_sfile2"));
				boardDTO.setRv_ofile2(req.getParameter("pre_file2"));				
			}
			else {							
				mfile = req.getFile("file2");
				originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
				if("".equals(originalName)) {
					originalName = "";
					saveFileName = "";
					
					boardDTO.setRv_ofile2(originalName);
					boardDTO.setRv_sfile2(saveFileName);
				}
				else {			
					String ext = originalName.substring(originalName.lastIndexOf('.'));
					saveFileName = getUuid() + ext;
					
					Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
					mfile.transferTo(path1.toFile()); 
					boardDTO.setRv_ofile2(originalName);
					boardDTO.setRv_sfile2(saveFileName);
				}
			}
			//파일 3
			var = req.getParameter("deleteofile3");
			if(var.equals("1"))
			{				
				//기존에 있던 파일 uploads 폴더에서 삭제
				String deletefile = req.getParameter("pre_sfile3");
				File file = new File(path+File.separator+deletefile);
				if(file.exists()) {					
					file.delete();
				}				
				sqlSession.getMapper(BoardDAOImpl.class).deletefile(Integer.parseInt(req.getParameter("pre_idx")));								
			}
			if(req.getParameter("pre_file3") != null)
			{
				boardDTO.setRv_sfile3(req.getParameter("pre_sfile3"));
				boardDTO.setRv_ofile3(req.getParameter("pre_file3"));				
			}
			else {							
				mfile = req.getFile("file3");
				originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
				if("".equals(originalName)) {
					originalName = "";
					saveFileName = "";
					
					boardDTO.setRv_ofile3(originalName);
					boardDTO.setRv_sfile3(saveFileName);
				}
				else {			
					String ext = originalName.substring(originalName.lastIndexOf('.'));
					saveFileName = getUuid() + ext;
					
					Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
					mfile.transferTo(path1.toFile()); 
					boardDTO.setRv_ofile3(originalName);
					boardDTO.setRv_sfile3(saveFileName);
				}
			}
		
			boardDTO.setRv_idx( Integer.parseInt(req.getParameter("pre_idx"))); 
			boardDTO.setTitle( req.getParameter("title"));
			boardDTO.setContents( req.getParameter("text")); 
			boardDTO.setOr_idx(Integer.parseInt(req.getParameter("order")));
			boardDTO.setWriter(req.getParameter("writer"));			 
			
			sqlSession.getMapper(ReviewBoardDAOImpl.class).edit(boardDTO);
			  			 
		}
		catch(Exception e) { 
			e.printStackTrace();
		}

		//쓰기 처리를 완료한 후 리스트로 이동
		return "redirect:review.do";
	}
	
	
	@RequestMapping(value="/admin/reviewremove.do")
	public String remove(Model model, HttpServletRequest req) {

		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");

		try {

			//기존에 있던 파일 uploads 폴더에서 삭제
			String deletefile = req.getParameter("pre_sfile");
			String deletefile2 = req.getParameter("pre_sfile2");
			String deletefile3 = req.getParameter("pre_sfile3");
			File file = new File(path+File.separator+deletefile);
			File file2 = new File(path+File.separator+deletefile2);
			File file3 = new File(path+File.separator+deletefile3);
			if(file.exists()) {
				file.delete();
			}
			if(file2.exists()) {
				file2.delete();
			}
			if(file3.exists()) {
				file3.delete();
			}
			sqlSession.getMapper(ReviewBoardDAOImpl.class).delete(
					Integer.parseInt(req.getParameter("idx")) );

		}
		catch(Exception e) { 
			e.printStackTrace();
		}

		//삭제 처리를 완료한 후 리스트로 이동
		return "redirect:review.do";
	}
	

	@RequestMapping(value="/admin/reviewremovechk.do")
	public String removechk(Model model, HttpServletRequest req) {

		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");

		
		String[] bd_no = req.getParameterValues("chk");


		try {
			for(int i = 0; i <bd_no.length; i++) {

				//기존에 있던 파일 uploads 폴더에서 삭제
				//파일1
				String sfile =
						sqlSession.getMapper(ReviewBoardDAOImpl.class).selectsfile(bd_no[i]);				
				File file = new File(path+File.separator+sfile);
				if(file.exists()) {
					file.delete(); 
				}
				//파일2
				sfile =
						sqlSession.getMapper(ReviewBoardDAOImpl.class).selectsfile2(bd_no[i]);				
				file = new File(path+File.separator+sfile);
				if(file.exists()) {
					file.delete(); 
				}
				//파일3
				sfile =
						sqlSession.getMapper(ReviewBoardDAOImpl.class).selectsfile3(bd_no[i]);				
				file = new File(path+File.separator+sfile);
				if(file.exists()) {
					file.delete(); 
				}
				

				sqlSession.getMapper(ReviewBoardDAOImpl.class).delete(
						Integer.parseInt(bd_no[i]) );
			}

		}
		catch(Exception e) { 
			e.printStackTrace();
		}

		//삭제 처리를 완료한 후 리스트로 이동
		return "redirect:review.do";
	}
	
	
	
	/************************리뷰 프론트페이지**************************/
	
	
	/* front 리뷰게시판 일반 리뷰 리스트 보여주기 2/17 JYA */
	@RequestMapping("/community/review.do")
	public String reviewList(Principal principal, Model model, HttpServletRequest req) {
		
		//게시물 전체갯수 
		int totalRecordCount =
			sqlSession.getMapper(ReviewBoardDAOImpl.class).getTotalCount();
		
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
		ArrayList<ReviewBoardDTO> lists =
			sqlSession.getMapper(ReviewBoardDAOImpl.class).listPage(start, end);
				
		String pagingImg =
			PagingUtil_front.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath()+"/community/review.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		//내용에 대한 줄바꿈 처리
		for(ReviewBoardDTO dto : lists){
			String temp = dto.getContents().replace("\r\n","<br/>");
			dto.setContents(temp);
		}
		
		//베스트 리뷰 읽어오기
		ArrayList<ReviewBoardDTO> listsBest =
				sqlSession.getMapper(ReviewBoardDAOImpl.class).listBest(1, 4);
		
		
		
		if(principal != null) {
			LikedReviewDTO likeDto = new LikedReviewDTO();
			likeDto.setM_code(sqlSession.getMapper(ReviewBoardDAOImpl.class).findm_code(principal.getName()));
			List<String> viewMyLike = sqlSession.getMapper(ReviewBoardDAOImpl.class).viewMyLike(likeDto);
						
			for(ReviewBoardDTO dto :lists) {
				String temp = Integer.toString(dto.getRv_idx());
				for(String i : viewMyLike) {
					if(temp.equals(i)) {
						dto.setLike(true);
						break;
						
					}else {
						dto.setLike(false);
					}
					
				}
			}
			
			for(ReviewBoardDTO dto :listsBest) {
				String temp = Integer.toString(dto.getRv_idx());
				for(String i : viewMyLike) {
					if(temp.equals(i)) {
						dto.setLike(true);
						break;
						
					}else {
						dto.setLike(false);
					}
					
				}
			}
		}else {
			
		}

		model.addAttribute("lists", lists);
		model.addAttribute("listsBest", listsBest);
		return "community/review";
	}	
	
	
	//리뷰 상세보기
	@RequestMapping("/community/reviewdetail.do")
	@ResponseBody
	public List<Map<String,Object>> reviewdetail(Principal principal, Model model, HttpServletRequest req) {

		ReviewBoardDTO boardDTO = new ReviewBoardDTO();
		boardDTO.setRv_idx(Integer.parseInt(req.getParameter("idx"))); 
		
		int myidx= Integer.parseInt(req.getParameter("idx"));
		
		ReviewBoardDTO dto = 
				sqlSession.getMapper(ReviewBoardDAOImpl.class).view(boardDTO);
		int orIdx = dto.getOr_idx();
		// orIdx를 order_product테이블에 넣어서 code를 가져온다.
		// 일반상품일 경우 그냥 해당 데이터를 product테이블에서 가져온다.
		// diy상품일 경우 diy테이블에서 정보를 가져온다.
		
		// 1. orIDX를 통해 주문상품 code가져오기
		List<String> temp = sqlSession.getMapper(ReviewBoardDAOImpl.class).geReviewtInfo(orIdx);
		List<Map<String, Object>> listSender = new ArrayList<Map<String, Object>>();
		
		
		// ★ 묶어서 보내야한다.
		// 	주문상품별로 객체로 묶어서 보내라!
		
		// 2. 주문상품 code를 통해
			// 2-1. 일제품반 || DIY제품인지 구별하여 수행한다.
		for(String key : temp) {
			// a. DIY상품일 경우
				// a-1. code를 가지고 DIY테이블에서 DIYcode,DIYname/ 토핑code 가져오기
					// a-2. 토핑code를 가지고 product테이블에서 p_name 가져오기
						// a-3. 보내주기 위해서 하나로 묶어라
			if(key.contains("9999")) {
				Map<String,Object> getDiyData = sqlSession.getMapper(ReviewBoardDAOImpl.class).getDiyData(key);
				
				// DIY피자 이름 가져오기
				//System.out.println("c의 이름 : " + getDiyData.get("D_NAME"));
				Map<String, Object> cResult = new HashMap<String, Object>();
				
				cResult.put("DIY_IDX", getDiyData.get("DIY_IDX")); // 코드 저장
				cResult.put("D_NAME", getDiyData.get("D_NAME")); // 이름 저장
				// DIY피자 재료만들기
				List<Object> secretRecipe = new ArrayList<Object>();
				secretRecipe.add(getDiyData.get("DOUGH"));
				secretRecipe.add(getDiyData.get("SAUCE"));
				secretRecipe.add(getDiyData.get("TOPPING1"));
				if(getDiyData.get("TOPPING2") != null) secretRecipe.add(getDiyData.get("TOPPING2"));					
				if(getDiyData.get("TOPPING3") != null) secretRecipe.add(getDiyData.get("TOPPING3"));	
				if(getDiyData.get("TOPPING4") != null) secretRecipe.add(getDiyData.get("TOPPING4"));	
				if(getDiyData.get("TOPPING5") != null) secretRecipe.add(getDiyData.get("TOPPING5"));	
				
				// 레시피 map에 담기 (key = recipe0,1,2,3..)
				List<String> recipeResult = sqlSession.getMapper(ReviewBoardDAOImpl.class).getDiyName(secretRecipe);
				for(int z=0; z<recipeResult.size(); z++) {
					cResult.put("recipe"+z, recipeResult.get(z));
				}
				
				model.addAttribute("cResult", cResult);
				
				listSender.add(cResult);
				
			// b. 일반/사이드/음료 제품일 경우
				// b-1. code를 product테이블의 code와 일치시켜 p_name 가져오기
			}else {
				Map<String,Object> getNormalName = sqlSession.getMapper(ReviewBoardDAOImpl.class).getNormalName(key);
				listSender.add(getNormalName);
			}
		}
		
		
		String rvIdx = Integer.toString(dto.getRv_idx());
		if(principal != null) {
			LikedReviewDTO likeDto = new LikedReviewDTO();
			likeDto.setM_code(sqlSession.getMapper(ReviewBoardDAOImpl.class).findm_code(principal.getName()));
			List<String> viewMyLike = sqlSession.getMapper(ReviewBoardDAOImpl.class).viewMyLike(likeDto);

			for(String i : viewMyLike) {
				if(rvIdx.equals(i)) {
					dto.setLike(true);
					break;
				}else {
					dto.setLike(false);
				}
			}
		}else {
			
		}
		
		//회원코드 가져오기 
		int m_code = 
				sqlSession.getMapper(ReviewBoardDAOImpl.class).findm_code(principal.getName());
		String m_codeTemp = Integer.toString(m_code);
		ParameterDTO paramDto = new ParameterDTO();
		paramDto.setM_code(m_codeTemp);
		int likeCount = sqlSession.getMapper(MypageImpl.class).getMyReviewLikeCount(Integer.parseInt(req.getParameter("idx")));
		dto.setLikeCount(likeCount);
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("dto", dto);
		listSender.add(result);
		
		return listSender;
	}
	
	
	
	//리뷰 글 작성페이지로 이동 (마이페이지)
	@RequestMapping("/mypage/myReviewWrite.do")
	public String myReviewWrite(Model model, HttpServletRequest req) {
		
		int or_idx = Integer.parseInt(req.getParameter("or_idx")); 
		model.addAttribute("or_idx", or_idx);
		
		
		return "mypage/myReviewWrite";
	}
	
	//리뷰 글 작성완료 (마이페이지)
	@RequestMapping(value="/mypage/myReviewWriteAction.do", method=RequestMethod.POST)
	public String myReviewWriteAction(Principal principal, Model model, MultipartHttpServletRequest req) {
		String referer = req.getHeader("Referer");
		String refTemp = referer.substring(referer.lastIndexOf("/")+1, referer.indexOf("."));

		
		//dto에 id를 저장
		ParameterDTO dto = new ParameterDTO();
		dto.setId(principal.getName());
		//id를 이용해서 회원이름 가져옴
		String name = sqlSession.getMapper(MypageImpl.class).myName(dto);
		
		ReviewBoardDTO boarddto = new ReviewBoardDTO();
		boarddto.setOr_idx(Integer.parseInt(req.getParameter("or_idx"))); //주문번호
		boarddto.setTitle(req.getParameter("title")); 
		boarddto.setContents(req.getParameter("contents"));
		boarddto.setWriter(req.getParameter("writer"));
		
		//회원코드 가져오기 
		int m_code = 
				sqlSession.getMapper(ReviewBoardDAOImpl.class).findm_code(req.getParameter("id"));
		boarddto.setM_code(m_code);


		//나만의 피자이름 얻어오기
		//String myPizzaName = req.getParameter("myPizzaName");
		
		/********나만의 피자 컬럼 업데이트 필요**********/
		
		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");
		MultipartFile mfile = null;

		String originalName;
		String saveFileName;
		try { 
			//DB에 인서트
			if(refTemp.equals("myReviewWrite")) {
				//파일1
				mfile = req.getFile("file1");
				originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
				
				
				if("".equals(originalName)) { //업로드된 파일이 없을때
					originalName = "";
					saveFileName = "";

					boarddto.setRv_ofile1(originalName);
					boarddto.setRv_sfile1(saveFileName);
				}
				else {			//업로드된 파일이 있을때
					String ext = originalName.substring(originalName.lastIndexOf('.'));
					saveFileName = getUuid() + ext;
		
					Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
					mfile.transferTo(path1.toFile()); 
					boarddto.setRv_ofile1(originalName);
					boarddto.setRv_sfile1(saveFileName);
				}
				//파일2
				mfile = req.getFile("file2");
				originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
				if("".equals(originalName)) {
					originalName = "";
					saveFileName = "";

					boarddto.setRv_ofile2(originalName);
					boarddto.setRv_sfile2(saveFileName);
				}
				else {			
					String ext = originalName.substring(originalName.lastIndexOf('.'));
					saveFileName = getUuid() + ext;
		
					Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
					mfile.transferTo(path1.toFile()); 
					boarddto.setRv_ofile2(originalName);
					boarddto.setRv_sfile2(saveFileName);
				}
				//파일3
				mfile = req.getFile("file3");
				originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
				if("".equals(originalName)) {
					originalName = "";
					saveFileName = "";

					boarddto.setRv_ofile3(originalName);
					boarddto.setRv_sfile3(saveFileName);
				}
				else {			
					String ext = originalName.substring(originalName.lastIndexOf('.'));
					saveFileName = getUuid() + ext;
		
					Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
					mfile.transferTo(path1.toFile()); 
					boarddto.setRv_ofile3(originalName);
					boarddto.setRv_sfile3(saveFileName);
				}
				
				sqlSession.getMapper(ReviewBoardDAOImpl.class).write( boarddto );
				
			}else if(refTemp.equals("myReviewEdit")) {
				System.out.println("myReviewEdit입니다.");
				
				boarddto.setRv_idx(Integer.parseInt(req.getParameter("rv_idx")));
				
				
				//파일 1
				String var = req.getParameter("deleteofile1");
				ReviewBoardDTO temp = new ReviewBoardDTO();
				temp = sqlSession.getMapper(ReviewBoardDAOImpl.class).view(boarddto);
				
				if(!req.getParameter("file1Txt").equals("")) {
					
					mfile = req.getFile("file1");
					originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
					
					if(originalName.equals("")) {
						boarddto.setRv_ofile1(temp.getRv_ofile1());
						boarddto.setRv_sfile1(temp.getRv_sfile1());
						
					}else {
						String ext = originalName.substring(originalName.lastIndexOf('.'));
						saveFileName = getUuid() + ext;

						Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
						mfile.transferTo(path1.toFile()); 
						boarddto.setRv_ofile1(originalName);
						boarddto.setRv_sfile1(saveFileName);
					}

				}else {
					//기존에 있던 파일 uploads 폴더에서 삭제
					String deletefile = req.getParameter("pre_sfile1");
					File file = new File(path+File.separator+deletefile);
					if(file.exists()) {					
						file.delete();
					}				
					// DB 에서도 sfile, ofile 속성 null로 바꿔주기
					sqlSession.getMapper(BoardDAOImpl.class).deletefile(Integer.parseInt(req.getParameter("rv_idx")));						
				}

				
				//파일 2
				var = req.getParameter("deleteofile2");
				if(!req.getParameter("file2Txt").equals("")) {
					mfile = req.getFile("file2");
					originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
					
					if(originalName.equals("")) {
						boarddto.setRv_ofile2(temp.getRv_ofile2());
						boarddto.setRv_sfile2(temp.getRv_sfile2());
						
					}else{
						String ext = originalName.substring(originalName.lastIndexOf('.'));
						saveFileName = getUuid() + ext;

						Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
						mfile.transferTo(path1.toFile()); 
						boarddto.setRv_ofile2(originalName);
						boarddto.setRv_sfile2(saveFileName);
					}
					
					
				}else {
					//기존에 있던 파일 uploads 폴더에서 삭제
					String deletefile = req.getParameter("pre_sfile2");
					File file = new File(path+File.separator+deletefile);
					if(file.exists()) {					
						file.delete();
					}				
					// DB 에서도 sfile, ofile 속성 null로 바꿔주기
					sqlSession.getMapper(BoardDAOImpl.class).deletefile(Integer.parseInt(req.getParameter("rv_idx")));						
				}
				
				//파일 3
				var = req.getParameter("deleteofile3");
				if(!req.getParameter("file3Txt").equals("")) {
					mfile = req.getFile("file3");
					originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
					
					if(originalName.equals("")) {
						
						boarddto.setRv_ofile3(temp.getRv_ofile3());
						boarddto.setRv_sfile3(temp.getRv_sfile3());
						
					}else{
						String ext = originalName.substring(originalName.lastIndexOf('.'));
						saveFileName = getUuid() + ext;

						Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
						mfile.transferTo(path1.toFile()); 
						boarddto.setRv_ofile3(originalName);
						boarddto.setRv_sfile3(saveFileName);
					}
					
					
					
				}else {
					//기존에 있던 파일 uploads 폴더에서 삭제
					String deletefile = req.getParameter("pre_sfile3");
					File file = new File(path+File.separator+deletefile);
					if(file.exists()) {					
						file.delete();
					}				
					// DB 에서도 sfile, ofile 속성 null로 바꿔주기
					sqlSession.getMapper(BoardDAOImpl.class).deletefile(Integer.parseInt(req.getParameter("rv_idx")));						
				}
				
				sqlSession.getMapper(ReviewBoardDAOImpl.class).edit( boarddto );
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		//쓰기 처리를 완료한 후 리스트로 이동
		
		if(refTemp.equals("myReviewWrite")) {
			return "redirect:myOrder.do";
		}else if(refTemp.equals("myReviewEdit")) {
			return "redirect:myReview.do";
		}
		return "";
	}

	
	//리뷰 글 수정페이지로 이동 (마이페이지)
	@RequestMapping("/mypage/myReviewEdit.do")
	public String myReviewEdit(Model model, HttpServletRequest req) {
		
		int or_idx = Integer.parseInt(req.getParameter("or_idx")); 
		ReviewBoardDTO dto = new ReviewBoardDTO();

		dto = sqlSession.getMapper(MypageImpl.class).myReview(or_idx);

		// 줄바꿈처리
		String temp = dto.getContents().replace("\r\n","<br/>");
		dto.setContents(temp);
		
		model.addAttribute("data", dto);
		
		return "mypage/myReviewEdit";
	}
	
	// 삭제처리
	@RequestMapping(value="/mypage/reviewremove.do")
	public String reviewRemove(Model model, HttpServletRequest req) {

		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");
		ReviewBoardDTO dto = new ReviewBoardDTO();
		dto.setRv_idx(Integer.parseInt(req.getParameter("rv_idx")));
		dto = sqlSession.getMapper(ReviewBoardDAOImpl.class).view(dto);
		
		try {
			
			//기존에 있던 파일 uploads 폴더에서 삭제 
			String deletefile1 = dto.getRv_sfile1();
			String deletefile2 = dto.getRv_sfile2();
			String deletefile3 = dto.getRv_sfile3();
			File file1 = new File(path+File.separator+deletefile1); 
			File file2 = new File(path+File.separator+deletefile2);
			File file3 = new File(path+File.separator+deletefile3); 
			if(file1.exists()) {
				file1.delete(); 
			}
			if(file2.exists()) {
				file2.delete(); 
			} 
			if(file3.exists()) {
				file3.delete(); 
			}
			sqlSession.getMapper(ReviewBoardDAOImpl.class).deleteLikedReview(Integer.parseInt(req.getParameter("rv_idx")));
			sqlSession.getMapper(ReviewBoardDAOImpl.class).delete(Integer.parseInt(req.getParameter("rv_idx")));
		}
		catch(Exception e) { 
			e.printStackTrace();
		}

		//삭제 처리를 완료한 후 리스트로 이동
		return "redirect:myReview.do";
	}
	
	
	
	// 리뷰페이지 좋아요
	@RequestMapping("/community/reviewLike.do")
	@ResponseBody
	public LikedReviewDTO reviewLike(Principal principal, Model model, HttpServletRequest req) {

		LikedReviewDTO dto = new LikedReviewDTO();
		dto.setRv_idx(Integer.parseInt(req.getParameter("idx")));
		dto.setM_code(sqlSession.getMapper(ReviewBoardDAOImpl.class).findm_code(principal.getName()));
		int likeChk = sqlSession.getMapper(ReviewBoardDAOImpl.class).likeChk(dto);
		
		if(likeChk>0) {
			//System.out.println("기존 좋아요 입력");
			sqlSession.getMapper(ReviewBoardDAOImpl.class).dislikeReview(dto);
			//System.out.println("삭제 완료되었습니다.");
		}else {
			//System.out.println("새로운 좋아요 입력");
			sqlSession.getMapper(ReviewBoardDAOImpl.class).likeReview(dto);			
			//System.out.println("추가 완료되었습니다");
		}
		
		return dto;
	}
	
	// 리뷰페이지 카드담기
	@RequestMapping("/community/reviewToCart.do")
	@ResponseBody
	public void reviewToCart(Principal principal, Model model, HttpServletRequest req) {

		//회원코드 
		String user_id = "";
		user_id = principal.getName();
		int m_code = 
				sqlSession.getMapper(BoardDAOImpl.class).findm_code(user_id);
		String m_codeStr = Integer.toString(m_code);
		
		
		try {
			// map 객체로 만들어서 보내줘라
			Map<String, Object> sqlData = new HashMap<String, Object>();
				// 1. 회원번호
				sqlData.put("m_code", m_codeStr);
				if(!req.getParameter("code").contains("9999")) {
					// 2. 제품번호
						// 1. 일반인경우
					sqlData.put("ct_code", req.getParameter("code"));	
				}else {
						// 2. DIY인경우
					Map<String, Object> temp = new HashMap<String, Object>();
					temp = sqlSession.getMapper(ReviewBoardDAOImpl.class).getDiyChk(req.getParameter("code"));
						// DIY테이블에 담기
					
					// key 소문자 변경
					Map<String, Object> newTemp = new HashMap<String, Object>();
					Set<String> set = temp.keySet();
				    Iterator<String> e = set.iterator();
				    while(e.hasNext()){
				    	String key = e.next();
				    	Object value = (Object) temp.get(key);
				    	newTemp.put(key.toLowerCase(), value);
				    }
				    
				    String d_nameStr = user_id + "님의 DIY 피자";
				    newTemp.put("d_name", d_nameStr);
				    newTemp.remove("diy_idx");
				    newTemp.remove("g_code");
				    
					sqlSession.getMapper(MenuImpl.class).insertCartDiy(newTemp);	
					// DIY테이블에 담기 완료(시퀀스 반환)
					// DIY테이블에 등록된 diy_idx값 가져오기
					sqlData.put("ct_code", newTemp.get("diy_idx"));
					sqlData.put("ct_name", d_nameStr);
				}
				
				// 둘다 CART 테이블에 담기
				int num = sqlSession.getMapper(CartImpl.class).confirmCart(sqlData);
				if(num != 0) { //같은제품이 있따!는뜻
					sqlData.put("ct_count", 1);
					sqlSession.getMapper(CartImpl.class).updateCountCart(sqlData);
				}
				else {		
					sqlSession.getMapper(MenuImpl.class).insertCart(sqlData);
				}
				
		} catch (Exception e) {
			
		}
	}
	
}
