package com.board.individual.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.company.mapper.CompanyMapper;
import com.board.company.vo.CompanyVo;
import com.board.individual.mapper.IndividualMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Individual")
public class IndividualController {

	@Autowired
	private  IndividualMapper  individualMapper;
	
	// Individual/Login
	@RequestMapping("/Login")
	public String login(
			
    HttpServletRequest request,
    HttpServletResponse response
    ) {
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    String       uri       = request.getParameter("uri");
	String       menu_id   = request.getParameter("menu_id");
	String       nowpage   = request.getParameter("nowpage");

    CompanyVo vo = individualMapper.login(userid, password);
    System.out.println(vo);

    HttpSession session = request.getSession();
    session.setAttribute("login", vo);

    if (vo == null) {
        // 로그인 실패 처리
        request.setAttribute("errorMessage", "Invalid username or password.");
        return "individual/login"; // 로그인 페이지로 돌아가기
    } else {
        // 로그인 성공 처리
        session.setAttribute("login", vo);
        return  "individual/main" ; // 메인 페이지로 이동
    }
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
			return  "/individual/login";
		}
}