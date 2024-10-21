package com.board.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.company.mapper.CompanyMapper;
import com.board.company.vo.CompanyVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Company")
public class CompanyController {
	
	@Autowired
	private CompanyMapper companyMapper;
	
	// Company/Login
	@RequestMapping("/Login")
	public String login(
		HttpServletRequest  request,
        HttpServletResponse response
	    ) {
        String userid    = request.getParameter("userid");
        String password  = request.getParameter("password");
        String uri       = request.getParameter("uri");
		String nowpage   = request.getParameter("nowpage");

        CompanyVo vo = companyMapper.login(userid, password);
        // System.out.println("vo=" + vo);

        HttpSession session = request.getSession();
        session.setAttribute("login", vo);

        if (vo != null) {
       	 // 로그인 성공 처리
       	session.setAttribute("login", vo);
       	return "redirect:/Company/Main?user_id=" + userid;
           			
       } else {
       	// 로그인 실패 처리
       	 request.setAttribute("errorMessage", "Invalid username or password.");
            //System.out.println("실패");        
            return "company/login"; // 로그인 페이지로 돌아가기
       }
      
    }
	// Company/Logout
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
		return "/company/login";
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
        mv.setViewName("company/signup");
        return mv;
    }
    
    // Company/Signup
    @RequestMapping("/Signup")
    public String signup() {
    	return "company/signup";
    }
    
	@RequestMapping("/")
	public String home() {
		return "views/home";
	}
	// http://localhost:9090/Company/Mypage?user_id=user1
	@RequestMapping("/Mypage")
	public String mypage(CompanyVo companyVo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		CompanyVo login = (CompanyVo) session.getAttribute("login");
	
		String userid = login.getUser_id();
		CompanyVo vo = companyMapper.getUserById(userid);		
		
		model.addAttribute("vo", vo);
		return "company/mypage";
	}
	
	// http://localhost:9090/Company/UpdateForm?user_id=user1
	@RequestMapping("/UpdateForm")
	public String updateForm(CompanyVo companyVo, Model model) {
		// 수정할 자료 조회
		CompanyVo vo = companyMapper.getUserById(companyVo.getUser_id());	
		model.addAttribute("vo", vo);
		
		return "company/update";
	}
	// Company/Update
	@RequestMapping("/Update")
	public String update(CompanyVo companyVo) {
		// 수정하기
		companyMapper.update(companyVo);
		String user_id = companyVo.getUser_id();
		// 수정 후 목록조회
		return "redirect:/Company/Mypage?user_id=" + user_id;
	}
	// Company/Delete
	@RequestMapping("/Delete")
	public String delete(CompanyVo companyVo, RedirectAttributes redirectAttributes) {
		System.out.println("companyVo는" + companyVo );
		companyMapper.delete(companyVo);
		String user_id = companyVo.getUser_id();
		redirectAttributes.addFlashAttribute("message", "회원탈퇴가 완료되었습니다.");
		return "redirect:/Company/Login";
	}

}