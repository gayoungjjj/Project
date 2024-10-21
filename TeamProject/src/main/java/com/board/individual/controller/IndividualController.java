package com.board.individual.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.individual.mapper.IndividualMapper;

@Controller
@RequestMapping("/Individual")
public class IndividualController {

    @Autowired
    private IndividualMapper individualMapper;

    // 로그인 화면
    @RequestMapping("/Login")
    public String login() {
        return "individual/login";
    }

    // 메인 페이지
    @RequestMapping("/Main")
    public String main() {
        return "individual/main";
    }

    // 회원가입 화면
    @GetMapping("/Signup")
    public String signup() {
        return "/individual/signup";
    }

    // 홈 화면
    @RequestMapping("/")
    public String home() {
        return "/views/home";
    }
}
