package com.board.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
@RequestMapping("/Company")
public class CompanyController {
	
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private IndividualMapper individualMapper;
	
	// ------------------------------- 로그인 -------------------------------//
	// Company/Login (로그인)
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

        CompanyVo vo = companyMapper.login(userid, password);
        System.out.println("vo=" + vo);

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
	
	// ------------------------------- 로그아웃 -------------------------------//
	// Company/Logout (로그아웃)
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
	
	// ------------------------------- 홈 화면 -------------------------------//
	// /Home (홈 화면)
	@RequestMapping("/")
	public String home() {
		return "views/home";
	}
	
	// ------------------------------- 메인 화면 -------------------------------//
	// Company/Main (메인 화면)
	@RequestMapping("/Main")
	public String main() {
		return "company/main" ;
	}
	
	// ------------------------------- 회원가입 -------------------------------//		   
    // Company/Signup (회원가입)
    @RequestMapping("/Signup")
    public ModelAndView signup() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/company/signup");
        return mv;
    }
    // Company/SignupForm (회원가입)
    @RequestMapping("/SignupForm")
    public ModelAndView signupForm(CompanyVo companyVo) {
    	companyMapper.signup(companyVo);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/Company/Login"); 
        return mv;
        
    // ------------------------------- 기업등록 -------------------------------//		
    }
    // Company/CompanySignup (기업등록)
    @RequestMapping("/CompanySignup")
    public ModelAndView companysignup() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/company/companysignup");
        return mv;
    }
 // Company/CompanySignupForm (기업등록)
    @RequestMapping("/CompanySignupForm")
    public ModelAndView companysignupForm(CompanyVo companyVo) {
    	companyMapper.companysignup(companyVo);
        ModelAndView mv = new ModelAndView();
        System.out.println("Address: " + companyVo.getAddress());
        mv.setViewName("redirect:/Company/Signup"); 
        return mv;
    }
	// 아이디 중복확인
    @RequestMapping(
    		value   = "/IdDupCheck",
    		method  = RequestMethod.GET,
    		headers = "Accept=application/json" )  
    	@ResponseBody                           
    	public  CompanyVo   idDupCheck(String user_id) {
    		String  result = "";  
    		CompanyVo  companyVo = companyMapper.idDupCheck( user_id  );		
    		return  companyVo;
    	}
    // 기업 중복확인
    @RequestMapping(
    		value   = "/CompDupCheck",
    		method  = RequestMethod.GET,
    		headers = "Accept=application/json" )  
    @ResponseBody                           
    public  CompanyVo   compDupCheck(String compname) {
    	String  result = "";
    	CompanyVo  compnameVo = companyMapper.compDupCheck( compname  );
    	System.out.println("컴퍼니:" + compnameVo);
    	return  compnameVo;
    } 
    // ------------------------------- 마이페이지 -------------------------------//
	// Company/Mypage (마이페이지)
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
	
	// Company/UpdateForm (마이페이지 수정)
	// http://localhost:9090/Company/UpdateForm?user_id=user1 
	@RequestMapping("/UpdateForm")
	public String updateForm(CompanyVo companyVo, Model model) {
		// 수정할 자료 조회
		CompanyVo vo = companyMapper.getUserById(companyVo.getUser_id());	
		model.addAttribute("vo", vo);
		
		return "company/update";
	}
	// Company/Update (마이페이지 수정)
	@RequestMapping("/Update")
	public String update(CompanyVo companyVo) {
		// 수정하기
		companyMapper.update(companyVo);
		String user_id = companyVo.getUser_id();
		// 수정 후 목록조회
		return "redirect:/Company/Mypage?user_id=" + user_id;
	}
	// Company/Delete (마이페이지_회원탈퇴)
	@RequestMapping("/Delete")
	public String delete(CompanyVo companyVo, RedirectAttributes redirectAttributes) {
		System.out.println("companyVo는" + companyVo );
		companyMapper.delete(companyVo);
		String user_id = companyVo.getUser_id();
		redirectAttributes.addFlashAttribute("message", "회원탈퇴가 완료되었습니다.");
		return "redirect:/Company/Login";
	}	
	
    // ------------------------------- 채용공고 -------------------------------//
	//Company/Postlist (채용공고 목록)
	@RequestMapping("/Postlist")
	public ModelAndView postlist(String user_id) {
		
		List<CompanyVo> mainList = companyMapper.getmainList();
		System.out.println("mainlist"+mainList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("mainList", mainList);
		mv.addObject("user_id", user_id);
		mv.setViewName("company/postlist");
		return mv ;
	}
	
	//Company/Postview (채용공고 상세페이지)
	// http://localhost:9090/Company/View?aplnum=1
	@RequestMapping("/Postview")
	public ModelAndView postview(CompanyVo companyVo,String user_id) {
		
		//조회수 증가
		companyMapper.plushit(companyVo);
		System.out.println("plusint"+companyVo);
		
		//글 조회
		CompanyVo vo = companyMapper.getmain(companyVo);
		//System.out.println("vo"+vo);
		
		String       duty   =  vo.getDuty().replace("\n", "<br>");
		vo.setDuty( duty );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo );
		mv.addObject("user_id", user_id);
		mv.setViewName("company/postview");
		return mv;
	}
	
	//Company/WriteForm (채용공고 등록)
	// http://localhost:9090/Company/WriteForm?aplnum=1
	
	@RequestMapping("/WriteForm")
	public ModelAndView writeform(CompanyVo companyVo,String user_id) {
		
		ModelAndView mv = new ModelAndView();
		System.out.println("writeformVo"+companyVo);
		mv.addObject("companyVo", companyVo);
		mv.addObject("user_id", user_id);
		mv.setViewName("company/postwrite");
		return mv;
	}
	
	@RequestMapping("/Postwrite")
	public ModelAndView postwrite(CompanyVo companyVo,String user_id) {
		
		companyMapper.insertposting(companyVo);
		
		System.out.println("writeVo"+companyVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", user_id);
		mv.setViewName("redirect:/Company/Postlist");
		return mv;
	}
	
	
	// /Company/Postdelete (채용공고 삭제)
	// http://localhost:9090/Company/Postdelete?&aplnum=11
	@RequestMapping("/Postdelete")
	public ModelAndView postdelete(CompanyVo companyVo,String user_id) {
		
		companyMapper.deleteposting(companyVo);
		System.out.println("delete"+companyVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", user_id);
		mv.setViewName("redirect:/Company/Postlist");
//		mv.setViewName("redirect:/Company/ListManagement");
		return mv;
	}
	
	// /Company/PostupdateForm (채용공고 수정)
	//http://localhost:9090/Company/PostupdateForm?&aplnum=8
	@RequestMapping("/PostupdateForm")
	public ModelAndView postupdateForm(CompanyVo companyVo,String user_id) {
		
		ModelAndView mv = new ModelAndView();
		CompanyVo vo = companyMapper.getmain(companyVo);
		System.out.println("postupdateForm"+vo);
		
		mv.addObject("vo", vo);
		mv.addObject("user_id", user_id);
		mv.setViewName("company/postupdate");
		return mv;
	}
	
	@RequestMapping("/Postupdate")
	public ModelAndView postupdate(CompanyVo companyVo) {
		
		System.out.println("Postupdate"+companyVo);
		
		companyMapper.updateposting(companyVo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Company/Postlist");
		return mv;
	}
	
	// ---------------------------- 등록공고목록 ----------------------------//
	// http://localhost:9090/Company/ListManagement
	// 기업별 등록 공고리스트
	@RequestMapping("/ListManagement")
	public ModelAndView listmanagment(String user_id) {
			
			List<CompanyVo> CompanyList = companyMapper.getCompanyList();
			System.out.println("CompanyList"+CompanyList);
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("CompanyList",CompanyList);
			mv.addObject("user_id", user_id);
			mv.setViewName("company/listmanagement");
			return mv;
		}
	
	
    // ------------------------------- 이력서 -------------------------------//
	//Company/ResumeList (이력서 목록)
	@RequestMapping("/ResumeList")
	public ModelAndView resumeList(IndividualVo individualVo, String user_id, String compname) {
		
		List<IndividualVo> appList = companyMapper.getappList();
		System.out.println("applist=" + appList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("appList", appList);
		mv.addObject("user_id", user_id);
		mv.addObject("compname", compname);
		mv.setViewName("company/resumeList");
		return mv;
	}
	
	//Company/Resumeview (이력서 상세페이지)
	// http://localhost:9090/Company/Resumview?resume_id=1001
	@RequestMapping("/Resumeview")
	public ModelAndView resumeview(IndividualVo individualVo, String title) {	
		
		System.out.println("individualList "+individualVo);
		//이력서 조회
		
		IndividualVo vo = companyMapper.getresumeList(individualVo);
		System.out.println("vo"+vo);
		
		title = title.replaceAll(" ", "");
		System.out.println("Title without spaces: " + title);
		
		ModelAndView mv = new ModelAndView();
		//mv.addObject("vo",vo );
		mv.addObject("vo", vo);
		mv.addObject("title", title);
		mv.setViewName("company/resumeview");
		return mv;
	}
	
	// ------------------------------- 인재 추천 -------------------------------//
	// http://localhost:9090/Company/Recommend?user_id=user3&compname=카카오
	//인재 추천
	@RequestMapping("/Recommend")
	public ModelAndView recommend() {
		
		
		List<CompanyVo> recommendList = companyMapper.recommendList();
		System.out.println("recommendList"+recommendList);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("recommendList", recommendList);
		mv.setViewName("company/recommend");
		return mv;
	}
	
	//-----------------------------------북마크--------------------------------------//
	//http://localhost:9090/Company/Bookmark?user_id=user3&compname=%EC%82%BC%EC%84%B1
	//북마크
	@RequestMapping("/Bookmark")
	public ModelAndView bookmark() {
		
		
		List<CompanyVo> recommendList = companyMapper.recommendList();
		System.out.println("recommendList"+recommendList);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("recommendList", recommendList);
		
		mv.setViewName("company/bookmark");
		return mv;
		
	}
	
	
	

}