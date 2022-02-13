package com.kosmo.freepproject;

import java.security.Principal;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SecurityController {

	
	@RequestMapping("/admin/index.do")
	public String securityIndex2(Principal principal, Model model,			
			Authentication authentication) {
		
		/*
		스프링 시큐리티에서 로그인 아이디를 얻어오는 법
		방법1] principal객체를 통해 얻어온다. 
		 */
		String user_id = principal.getName();
		
		model.addAttribute("user_id", user_id);	
	
		return "/admin/index";
	}
	
	@RequestMapping("/admin/login.do")
	public String securityIndex2Login(Model model, Principal principal) {
		
		String user_id = "";
		try {
			user_id = principal.getName();
			System.out.println("user_id="+ user_id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
					
		model.addAttribute("id", user_id);	

		return "admin/login";
	}
	
	
	@RequestMapping("/accessDenied.do")
	public String securityIndex2AccessDenied(Model model, Principal principal) {
		
		String user_id = "";
		try {
			user_id = principal.getName();
			System.out.println("user_id="+ user_id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
					
		model.addAttribute("id", user_id);	

		return "/admin/accessDenied";
	}
	
	
	/*
	홈페이지 로그인 구현 2/14 YUNA
	 */
	
	@RequestMapping("/member/login.do")
	public String memberLogin(Model model, Principal principal) {
		
		String user_id = "";
		try {
			user_id = principal.getName();
			System.out.println("user_id="+ user_id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
					
		model.addAttribute("id", user_id);	

		return "member/login";
	}
	
}
