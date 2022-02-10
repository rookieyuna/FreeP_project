package com.kosmo.freepproject;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	/*
	 이부분 /admin 치면 로그인화면으로 바로 뜨게 하고싶은데 연결이 안되가지고..
	 처음 관리자페이지 진입할때 주소를 /admin 하면 관리자페이지로그인 화면이 뜨게 하고싶어요 근데안댐 ㅋ
	 */

	
	/*
	 * @RequestMapping(value="/{admin}", method=RequestMethod.GET) public String
	 * index(@PathVariable("admin") String admin) {
	 * 
	 * return "redirect:admin/login";
	 * 
	 * }
	 */

	
	
	 @RequestMapping(value="/admin/{var}", method=RequestMethod.GET) 
	 public String base(@PathVariable String var) { 
		 System.out.println("homecontroller");
		 return "/admin/"+ var; 
		
	}
	 
}
