package com.board.individual.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.company.mapper.CompanyMapper;
import com.board.company.vo.CompanyVo;
import com.board.individual.mapper.IndividualMapper;
import com.board.individual.vo.IndividualVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Individual")
public class IndividualController {
	
	@Autowired
	private CompanyMapper    companyMapper;
	
	@Autowired
	private IndividualMapper individualMapper;
	
	// ------------------------------- 로그인 -------------------------------//
	// Individual/Login (로그인)
	@RequestMapping("/Login")
	public String login(
		HttpServletRequest  request,
        HttpServletResponse response
	    ) {
        String userid    = request.getParameter("userid");
        String password  = request.getParameter("password");
        String uri       = request.getParameter("uri");
    	String menu_id   = request.getParameter("menu_id");
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
	// ------------------------------- 로그아웃 -------------------------------//
	// Individual/Logout (로그아웃)
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
	
	// ------------------------------- 홈 화면 -------------------------------//
	// /Home (홈 화면)
	@RequestMapping("/")
	public String home() {
		return "views/home";
	}
	
	// ------------------------------- 메인 화면 -------------------------------//
	// Individual/Main (메인 화면)
	@RequestMapping("/Main")
	public String main() {
		return "individual/main";
	}
	// ------------------------------- 회원가입 -------------------------------//
	// Individual/Signup (회원가입)
	@RequestMapping("/Signup")
	public String signup() {
		return "individual/signup";
	}
	
	// ------------------------------- 마이페이지 -------------------------------//
	// Individual/Mypage (마이페이지)
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
	
	// Individual/UpdateForm (마이페이지 수정)
	// http://localhost:9090/Individual/UpdateForm?user_id=user1
	@RequestMapping("/UpdateForm")
	public String updateForm(IndividualVo individualVo, Model model) {
		// 수정할 자료 조회
		IndividualVo vo = individualMapper.getUserById(individualVo.getUser_id());	
		model.addAttribute("vo", vo);
		
		return "individual/update";
	}
	// Individual/Update (마이페이지 수정)
	@RequestMapping("/Update")
	public String update(IndividualVo individualVo) {
		// 수정하기
		individualMapper.update(individualVo);
		String user_id = individualVo.getUser_id();
		System.out.println("user_id는:" + user_id);
		// 수정 후 목록조회
		return "redirect:/Individual/Mypage?user_id=" + user_id;
	}
	// Individual/Delete (마이페이지_회원탈퇴)
	@RequestMapping("/Delete")
	public String delete(IndividualVo individualVo, RedirectAttributes redirectAttributes) {
		System.out.println("IndividualVo는" + individualVo );
		individualMapper.delete(individualVo);
		String user_id = individualVo.getUser_id();
		redirectAttributes.addFlashAttribute("message", "회원탈퇴가 완료되었습니다.");
		return "redirect:/Individual/Login";
	}
	
	// ------------------------------- 채용공고 -------------------------------//

	//Individual/Postlist (채용공고 목록)
	@RequestMapping("/Postlist")
	public ModelAndView postlist() {
		
		List<CompanyVo> mainList = companyMapper.getmainList();
		System.out.println("mainlist"+mainList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("mainList", mainList);
		mv.setViewName("individual/postlist");
		return mv ;
		}
	
	//Individual/Postview (채용공고 상세페이지)
	// http://localhost:9090/Individual/View?aplnum=1
	@RequestMapping("/Postview")
	public ModelAndView postview(CompanyVo companyVo ,IndividualVo individualVo ,HttpServletRequest request, Model model) {
				
		//조회수 증가
		companyMapper.plushit(companyVo);
		// System.out.println("plusint"+companyVo);
		
		//글 조회
		CompanyVo vo = companyMapper.getmain(companyVo);
		//System.out.println("vo"+vo);
		
		String       duty   =  vo.getDuty().replace("\n", "<br>");
		vo.setDuty( duty );
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo );
		mv.setViewName("individual/postview");

		return mv;
		
	}
	
	       //채용공고 지원 //
		@RequestMapping("/Postapp")
		public ModelAndView postapp(String user_id, CompanyVo companyVo ,IndividualVo individualVo ,HttpServletRequest request, Model model) {
			
			CompanyVo vo = companyMapper.getmain(companyVo);
					
			String       duty   =  vo.getDuty().replace("\n", "<br>");
			vo.setDuty( duty );
		    
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("vo",vo );
			
			mv.setViewName("individual/postapp");

			List<String> titles = individualMapper.getTitlesByUSerId(user_id);
			System.out.println("titles"+titles);
			model.addAttribute("titles", titles);

			
			return mv;
		}
		
		@RequestMapping("/WriteForm2")
	    public ModelAndView writeForm2() {    
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("/individual/write2");
	        return mv;
	    }
	    
	    @RequestMapping("/Write2")
	    public ModelAndView white2(IndividualVo individualVo) {
	        individualMapper.insert2(individualVo);
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("redirect:/Individual/Main"); 
	        return mv;
	    }
	


	// ------------------------------- 이력서 등록 -------------------------------//
	
	
	//Individual/Resumereg (이력서등록)
	@RequestMapping("/Resumereg")
	public String resumereg(IndividualVo individualVo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		IndividualVo login = (IndividualVo) session.getAttribute("login");
	
		String userid = login.getUser_id();
		IndividualVo vo = individualMapper.getUserById(userid);		
				
		model.addAttribute("vo", vo); 
		return "individual/resumereg";
	}
	
	@RequestMapping("/WriteForm")
    public ModelAndView writeForm() {    
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/individual/write");
        return mv;
    }
    
    @RequestMapping("/Write")
    public ModelAndView white(IndividualVo individualVo) {
        individualMapper.insert(individualVo);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/Individual/Main"); 
        return mv;
    }

}