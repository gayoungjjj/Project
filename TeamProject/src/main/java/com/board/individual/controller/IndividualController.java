package com.board.individual.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.individual.mapper.IndividualMapper;
import com.board.individual.vo.IndividualVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Individual")
public class IndividualController {
	
	@Autowired
	private IndividualMapper individualMapper;
	
	// Individual/Login
	@RequestMapping("/Login")
	public String login(
		HttpServletRequest  request,
        HttpServletResponse response
	    ) {
        String userid    = request.getParameter("userid");
        String password  = request.getParameter("password");
        String uri       = request.getParameter("uri");
		String nowpage   = request.getParameter("nowpage");

		IndividualVo vo = individualMapper.login(userid, password);
        System.out.println("vo=" + vo);

        HttpSession session = request.getSession();
        session.setAttribute("login", vo);
        
        System.out.println("userid=" + userid);

        if (vo != null) {
       	 // 로그인 성공 처리
       	session.setAttribute("login", vo);
       	return "redirect:/Individual/Main?user_id=" + userid;
           			
       } else {
       	// 로그인 실패 처리
       	 request.setAttribute("errorMessage", "Invalid userid or password.");
            //System.out.println("실패");        
            return "individual/login"; // 로그인 페이지로 돌아가기
       }
      
    }
	// Individual/Logout
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
		return "/individual/login";
		}

	
	// Individual/Main
	@RequestMapping("/Main")
	public String main() {
		return "individual/main";
	}
	
	// Individual/Signup
	@RequestMapping("/Signup")
	public String signup() {
		return "individual/signup";
	}
	
	@RequestMapping("/")
	public String home() {
		return "views/home";
	}
	// http://localhost:9090/Individual/Mypage?user_id=user1
	@RequestMapping("/Mypage")
	public String mypage(IndividualVo individualVo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		IndividualVo login = (IndividualVo) session.getAttribute("login");
	
		String userid = login.getUser_id();
		IndividualVo vo = individualMapper.getUserById(userid);		
		
		model.addAttribute("vo", vo);
		return "individual/mypage";
	}
	
	// http://localhost:9090/Individual/UpdateForm?user_id=user1
	@RequestMapping("/UpdateForm")
	public String updateForm(IndividualVo individualVo, Model model) {
		// 수정할 자료 조회
		IndividualVo vo = individualMapper.getUserById(individualVo.getUser_id());	
		model.addAttribute("vo", vo);
		
		return "individual/update";
	}
	// Individual/Update
	@RequestMapping("/Update")
	public String update(IndividualVo individualVo) {
		// 수정하기
		individualMapper.update(individualVo);
		String user_id = individualVo.getUser_id();
		System.out.println("user_id는:" + user_id);
		// 수정 후 목록조회
		return "redirect:/Individual/Mypage?user_id=" + user_id;
	}
	// Individual/Delete
	@RequestMapping("/Delete")
	public String delete(IndividualVo individualVo, RedirectAttributes redirectAttributes) {
		System.out.println("IndividualVo는" + individualVo );
		individualMapper.delete(individualVo);
		String user_id = individualVo.getUser_id();
		redirectAttributes.addFlashAttribute("message", "회원탈퇴가 완료되었습니다.");
		return "redirect:/Individual/Login";
	}

}