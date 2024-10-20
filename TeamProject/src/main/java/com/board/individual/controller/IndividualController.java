package com.board.individual.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}