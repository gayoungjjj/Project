package com.board.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.board.company.mapper.CompanyMapper;
import com.board.company.vo.CompanyVo;

@Controller
@RequestMapping("/Company")
public class CompanyController {

    @Autowired
    private CompanyMapper companyMapper; // Mapper 주입

    // Company/Login
    @RequestMapping("/Login")
    public String login() {
        return "company/login";
    }
    
    // Company/Main
    @RequestMapping("/Main")
    public String main() {
        return "company/main";
    }
    
    // 회원가입 폼
    @RequestMapping("/SignupForm")
    public ModelAndView signupForm() {    
        ModelAndView mv = new ModelAndView();
        mv.setViewName("company/login");
        return mv;
    }
    
    @RequestMapping("/Signup")
    public String signup() {
    	return "company/signup";
    }
   
    
    // 홈
    @RequestMapping("/")
    public String home() {
        return "/home";
    }
}
