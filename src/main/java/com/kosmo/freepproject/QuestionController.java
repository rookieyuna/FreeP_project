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
import util.PagingUtil;

@Controller
public class QuestionController {

	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping("/admin/question.do")
	public String list(Model model, HttpServletRequest req) {

		int totalRecordCount =
			sqlSession.getMapper(BoardDAOImpl.class).getTotalCount(1);
		
		//페이지 처리를 위한 설정값
		int pageSize = 3;//한 페이지당 출력할 게시물의 갯수
		int blockPage = 2;//한 블럭당 출력할 페이지번호의 갯수
		//전체 페이지 수 계산
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);

		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals("")) 
			? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		//해당 페이지에 출력할 게시물의 구간을 계산한다. 
		int start = (nowPage-1) * pageSize + 1;
		int end = pageSize * nowPage;

		ArrayList<BoardDTO> lists =
			sqlSession.getMapper(BoardDAOImpl.class).listPage(3, start, end);
				
		String pagingImg =
			PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath()+"/admin/question.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		//내용에 대한 줄바꿈 처리
		for(BoardDTO dto : lists){
			String temp = dto.getContents().replace("\r\n","<br/>");
			dto.setContents(temp);
		}
		model.addAttribute("lists", lists);		
		
		return "admin/question-list";
	}	
	

	//메인페이지 1:1문의 입력 액션
	@RequestMapping(value="/community/questionWriteAction.do", method=RequestMethod.POST)
	public String writeAction(Model model, MultipartHttpServletRequest req) {

		
		BoardDTO boarddto = new BoardDTO();
		boarddto.setB_cate(Integer.parseInt(req.getParameter("cate")));
		boarddto.setTitle(req.getParameter("title"));
		boarddto.setContents(req.getParameter("contents"));
		boarddto.setWriter("작성자");
		
		boarddto.setQ_category(Integer.parseInt(req.getParameter("qcate")));
		
		
		//회원코드 가져오기
		int id = sqlSession.getMapper(BoardDAOImpl.class).findm_code(req.getParameter("id"));
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
				
				/*
				 * System.out.println("saveFileName:  "+saveFileName);
				 * System.out.println("path: asdf "+path);
				 */
				//물리적경로에 새롭게 생성된 파일명으로 파일 저장				
				Path path1 = Paths.get(path+File.separator+saveFileName).toAbsolutePath();		
	            mfile.transferTo(path1.toFile()); 
	            
	            boarddto.setOfile(originalName);
	            boarddto.setSfile(saveFileName);
			} 			
			
			  sqlSession.getMapper(BoardDAOImpl.class).write(boarddto);
			 
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		//쓰기 처리를 완료한 후 리스트로 이동
		return "redirect:question.do";
	}
	
	
	public static String getUuid(){
		String uuid = UUID.randomUUID().toString();		
		//System.out.println("생성된UUID-1:"+ uuid);
		  
		uuid = uuid.replaceAll("-", "");
		//System.out.println("생성된UUID-2:"+ uuid);
		return uuid;
	}
	
	
}
