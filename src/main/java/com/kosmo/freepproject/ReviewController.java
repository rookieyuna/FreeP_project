package com.kosmo.freepproject;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Iterator;
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
import mypage.MypageImpl;
import util.ParameterDTO;
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
		int pageSize = 3;//한 페이지당 출력할 게시물의 갯수
		int blockPage = 2;//한 블럭당 출력할 페이지번호의 갯수
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
		int pageSize = 3;//한 페이지당 출력할 게시물의 갯수
		int blockPage = 2;//한 블럭당 출력할 페이지번호의 갯수
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
	public String reviewList(Model model, HttpServletRequest req) {
		
		//게시물 전체갯수 
		int totalRecordCount =
			sqlSession.getMapper(ReviewBoardDAOImpl.class).getTotalCount();
		
		//페이지 처리를 위한 설정값
		int pageSize = 4;//한 페이지당 출력할 게시물의 갯수
		int blockPage = 2;//한 블럭당 출력할 페이지번호의 갯수
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
		model.addAttribute("lists", lists);
		
		
		//베스트 리뷰 읽어오기
		ArrayList<ReviewBoardDTO> listsBest =
				sqlSession.getMapper(ReviewBoardDAOImpl.class).listBest(1, 4);
		model.addAttribute("listsBest", listsBest);
		
		return "community/review";
	}	
	
	
	//리뷰 상세보기
	@RequestMapping("/community/reviewdetail.do")
	public String reviewdetail(Model model, HttpServletRequest req) {

		ReviewBoardDTO boardDTO = new ReviewBoardDTO();
		boardDTO.setRv_idx( Integer.parseInt(req.getParameter("idx"))); 
		
		ReviewBoardDTO dto = 
				sqlSession.getMapper(ReviewBoardDAOImpl.class).view(boardDTO);
		  
		model.addAttribute("dto", dto); 
		return "community/review";
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
		
		//dto에 id를 저장
		ParameterDTO dto = new ParameterDTO();
		dto.setId(principal.getName());
		//id를 이용해서 회원이름 가져옴
		String name = sqlSession.getMapper(MypageImpl.class).myName(dto);
		
		ReviewBoardDTO boarddto = new ReviewBoardDTO();
		boarddto.setOr_idx(Integer.parseInt(req.getParameter("or_idx"))); //주문번호
		boarddto.setTitle(req.getParameter("title")); 
		boarddto.setContents(req.getParameter("contents"));
		boarddto.setWriter(name);
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
		return "redirect:myOrder.do";

	}

	
	
}
