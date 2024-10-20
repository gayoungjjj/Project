package com.board.individual.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Individual")
public class IndividualController {
	// Individual/Login
	@RequestMapping("/Login")
	public String login() {
		return "individual/login";
	}
		
	// Individual/Main
	@RequestMapping("/Main")
	public String main() {
		return "individual/main" ;
	}
	
	// Individual/Signup
	@RequestMapping("/Signup")
	public String signup() {
		return "/individual/signup";
	}
	
	@RequestMapping("/")
	public String home() {
		return "/views/home";
	}
	
	@RequestMapping(value="/Logout",
			        method = RequestMethod.GET)
		public   String   logout(
			HttpServletRequest    request,
			HttpServletResponse   response,
			HttpSession           session
				) {
			
			//Object url = session.getAttribute("URL");
			session.invalidate();
			
			//return "redirect:" + (String) url;
			return  "redirect:/";
		}
}