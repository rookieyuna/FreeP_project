package com.kosmo.freepproject;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileuploadController {
		
	
	//파일 다운로드 처리
	@RequestMapping("/admin/download.do")
	public ModelAndView download(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		/*
		파일리스트에서 다운로드 링크는
		download.do?fileName=${file.key }&oriFileName=임시파일명
		와 같이 걸려있다. 
		 */
		//저장된 파일명
		String fileName = req.getParameter("fileName");
		//원본 파일명
		String oriFileName = req.getParameter("oriFileName");
		//물리적 경로
		String saveDirectory = req.getSession().getServletContext()
				.getRealPath("/resources/uploads");
		//경로와 파일명을 통해 파일객체 생성
		File downloadFile = new File(saveDirectory+"/"+fileName);
		//해당 경로에 파일이 있는지 확인
		if(!downloadFile.canRead()) {
			throw new Exception("파일을 찾을 수 없습니다");
		}		
		
		//다운로드를 위한 View와 Model 처리
		ModelAndView mv = new ModelAndView();
		//다운로드 할 View명
		mv.setViewName("fileDownloadView");
		//저장된 파일의 전체 경로명
		mv.addObject("downloadFile", downloadFile);
		//원본 파일명
		mv.addObject("oriFileName", oriFileName); 
		return mv;		
	}
}
