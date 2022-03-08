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
import review.ReviewBoardDAOImpl;
import util.PagingUtil;
import util.ParameterDTO;

@Controller
public class EventController {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/admin/event.do")
	public String list(Model model, HttpServletRequest req) {

		int totalRecordCount =
			sqlSession.getMapper(BoardDAOImpl.class).getTotalCount(2);
		
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
				
		String pagingImg =
			PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath()+"/admin/event.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		//내용에 대한 줄바꿈 처리
		for(BoardDTO dto : lists){
			String temp = dto.getContents().replace("\r\n","<br/>");
			dto.setContents(temp);
		}
		model.addAttribute("lists", lists);		
		
		return "admin/event-list";
	}	
	
	
	@RequestMapping("/admin/eventSearch.do")
	public String listSearch(Model model, HttpServletRequest req) {

		
		ParameterDTO parameterDTO = new ParameterDTO();
		//검색어가 있을경우 저장
		parameterDTO.setCate(2);
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchtxt"));
		
		int totalRecordCount =
			sqlSession.getMapper(BoardDAOImpl.class).getTotalCountSearch(parameterDTO);
		
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
		
		ArrayList<BoardDTO> lists =
			sqlSession.getMapper(BoardDAOImpl.class).listPageSearch(parameterDTO);
				
		String pagingImg =
			PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath()+"/admin/event.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		//내용에 대한 줄바꿈 처리
		for(BoardDTO dto : lists){
			String temp = dto.getContents().replace("\r\n","<br/>");
			dto.setContents(temp);
		}
		model.addAttribute("lists", lists);		
		
		return "admin/event-list";
	}
	
	
	public static String getUuid(){
		String uuid = UUID.randomUUID().toString();		
		//System.out.println("생성된UUID-1:"+ uuid);
		  
		uuid = uuid.replaceAll("-", "");
		//System.out.println("생성된UUID-2:"+ uuid);
		return uuid;
	}
	//글쓰기 
	@RequestMapping(value="/admin/eventAction.do", method=RequestMethod.POST)
	public String writeAction(Model model, MultipartHttpServletRequest req) {

		
		BoardDTO boarddto = new BoardDTO();
		boarddto.setB_cate(Integer.parseInt(req.getParameter("cate")));
		boarddto.setTitle(req.getParameter("title"));
		boarddto.setContents(req.getParameter("text"));
		boarddto.setWriter(req.getParameter("writer"));
		//System.out.println("asdfasdf:"+boarddto.getWriter());
		//회원코드 가져오기
		int id = 
				sqlSession.getMapper(BoardDAOImpl.class).findm_code( req.getParameter("id"));
		boarddto.setM_code(id);
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
				
				 boarddto.setOfile(originalName);
		         boarddto.setSfile(saveFileName);
			}
			else {			
				//파일명에서 확장자를 따낸다. 
				String ext = originalName.substring(originalName.lastIndexOf('.'));

				//UUID를 통해 생성된 문자열과 확장자를 결합해서 파일명을 완성한다. 
				saveFileName = getUuid() + ext;

				//물리적경로에 새롭게 생성된 파일명으로 파일 저장				
				Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
	            mfile.transferTo(path1.toFile()); 
	            
	            boarddto.setOfile(originalName);
	            boarddto.setSfile(saveFileName);
			}
			mfile = req.getFile("file2");
			originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
			if("".equals(originalName)) {
				originalName = "";
				saveFileName = "";

				boarddto.setOfile2(originalName);
				boarddto.setSfile2(saveFileName);
			}
			else {			
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				saveFileName = getUuid() + ext;
	
				Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
				mfile.transferTo(path1.toFile()); 
				boarddto.setOfile2(originalName);
				boarddto.setSfile2(saveFileName);
			}
			
			  sqlSession.getMapper(BoardDAOImpl.class).writeEvent( boarddto );
			 
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		//쓰기 처리를 완료한 후 리스트로 이동
		return "redirect:event.do";
	}
	//상세보기
	@RequestMapping("/admin/eventdetail.do")
	public String detail(Model model, HttpServletRequest req) {
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setB_idx( Integer.parseInt(req.getParameter("idx"))); 
		
		BoardDTO dto = 
				sqlSession.getMapper(BoardDAOImpl.class).view(boardDTO);
		  
		
		model.addAttribute("dto", dto);
		return "/admin/event-detail";
	}
	
	@RequestMapping("/admin/eventedit.do")
	public String edit(Model model, HttpServletRequest req) {
		 
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setB_idx( Integer.parseInt(req.getParameter("idx"))); 
		
		BoardDTO dto = 
				sqlSession.getMapper(BoardDAOImpl.class).view(boardDTO);
		  
		
		model.addAttribute("dto", dto);
		return "/admin/event-edit";
	}

	//이벤트 수정
	@RequestMapping(value="/admin/eventeditAction.do", method=RequestMethod.POST)
	public String editAction(Model model, MultipartHttpServletRequest req) {

		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");
		MultipartFile mfile = null;
		
		BoardDTO boardDTO = new BoardDTO();
		String originalName;
		String saveFileName;
		try {
			String var = req.getParameter("deleteofile");
			if(var.equals("1"))
			{
				
				//기존에 있던 파일 uploads 폴더에서 삭제
				String deletefile = req.getParameter("pre_sfile");
				File file = new File(path+File.separator+deletefile);
				if(file.exists()) {
					
					file.delete();
				}
				
				sqlSession.getMapper(BoardDAOImpl.class).deletefile(Integer.parseInt(req.getParameter("pre_idx")));								
			}
			if(req.getParameter("pre_file") != null)
			{
				boardDTO.setSfile(req.getParameter("pre_sfile"));
				boardDTO.setOfile(req.getParameter("pre_file"));
			}
			else
			{	
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
				boardDTO.setSfile(saveFileName ); 
				boardDTO.setOfile( originalName); 
			}
			//파일2번
			var = req.getParameter("deleteofile2");
			if(var.equals("1"))
			{				
				//기존에 있던 파일 uploads 폴더에서 삭제
				String deletefile = req.getParameter("pre_sfile2");
				File file = new File(path+File.separator+deletefile);
				if(file.exists()) {					
					file.delete();
				}				
				sqlSession.getMapper(BoardDAOImpl.class).deletefile2(Integer.parseInt(req.getParameter("pre_idx")));								
			}
			if(req.getParameter("pre_file2") != null)
			{
				boardDTO.setSfile2(req.getParameter("pre_sfile2"));
				boardDTO.setOfile2(req.getParameter("pre_file2"));				
			}
			else {							
				mfile = req.getFile("file2");
				originalName = new String(mfile.getOriginalFilename().getBytes(),"UTF-8");
				if("".equals(originalName)) {
					originalName = "";
					saveFileName = "";
					
					boardDTO.setOfile2(originalName);
					boardDTO.setSfile2(saveFileName);
				}
				else {			
					String ext = originalName.substring(originalName.lastIndexOf('.'));
					saveFileName = getUuid() + ext;
					
					Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
					mfile.transferTo(path1.toFile()); 
					boardDTO.setOfile2(originalName);				
					boardDTO.setSfile2(saveFileName);
				}
			}
			
			boardDTO.setB_idx( Integer.parseInt(req.getParameter("pre_idx"))); 
			boardDTO.setTitle( req.getParameter("title"));
			boardDTO.setContents( req.getParameter("text")); 
			
			
			
			sqlSession.getMapper(BoardDAOImpl.class).edit(boardDTO);
			  
			 
		}
		catch(Exception e) { 
			e.printStackTrace();
		}

		//쓰기 처리를 완료한 후 리스트로 이동
		return "redirect:event.do";
	}
	
	
	@RequestMapping(value="/admin/eventremove.do")
	public String remove(Model model, HttpServletRequest req) {

		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");

		try {

			//기존에 있던 파일 uploads 폴더에서 삭제
			String deletefile = req.getParameter("pre_sfile");
			String deletefile2 = req.getParameter("pre_sfile2");
			File file = new File(path+File.separator+deletefile);
			File file2 = new File(path+File.separator+deletefile2);
			if(file.exists()) {

				file.delete();
			}
			if(file2.exists()) {
				file2.delete();
			}

			sqlSession.getMapper(BoardDAOImpl.class).delete(
					Integer.parseInt(req.getParameter("idx")) );

		}
		catch(Exception e) { 
			e.printStackTrace();
		}

		//삭제 처리를 완료한 후 리스트로 이동
		return "redirect:event.do";
	}
	

	@RequestMapping(value="/admin/eventremovechk.do")
	public String removechk(Model model, HttpServletRequest req) {

		//물리적경로 얻어오기
		String path = req.getSession().getServletContext().getRealPath("/resources/uploads");

		
		String[] bd_no = req.getParameterValues("chk");


		try {
			for(int i = 0; i <bd_no.length; i++) {

				//기존에 있던 파일 uploads 폴더에서 삭제
				//String deletefile = req.getParameter("pre_sfile");
				String sfile =
						sqlSession.getMapper(BoardDAOImpl.class).selectsfile(bd_no[i]);
				
				File file = new File(path+File.separator+sfile);
				if(file.exists()) {

					file.delete();
				}
				sfile =
						sqlSession.getMapper(BoardDAOImpl.class).selectsfile2(bd_no[i]);				
				file = new File(path+File.separator+sfile);
				if(file.exists()) {
					file.delete(); 
				}

				sqlSession.getMapper(BoardDAOImpl.class).delete(
						Integer.parseInt(bd_no[i]) );
			}

		}
		catch(Exception e) { 
			e.printStackTrace();
		}

		//삭제 처리를 완료한 후 리스트로 이동
		return "redirect:event.do";
	}
}
