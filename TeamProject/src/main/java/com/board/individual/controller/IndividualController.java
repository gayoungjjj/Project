package com.board.individual.controller;

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
	        String user_id   = request.getParameter("user_id");
	        String password  = request.getParameter("password");
	        String uri       = request.getParameter("uri");
	    	String menu_id   = request.getParameter("menu_id");
			String nowpage   = request.getParameter("nowpage");

			IndividualVo vo = individualMapper.login(user_id, password);
	        System.out.println("vo=" + vo);

	        HttpSession session = request.getSession();
	        session.setAttribute("login", vo);
	        
	        System.out.println("user_id=" + user_id);

	        if (vo != null) {
	       	 // 로그인 성공 처리
	       	session.setAttribute("login", vo);
	       	return "redirect:/Individual/Main?user_id=" + user_id;
	       } else {
	       	// 로그인 실패 처리
	       	 request.setAttribute("errorMessage", "아이디 또는 비밀번호를 확인하세요.");
	            //System.out.println("실패");        
	            return "/individual/login"; // 로그인 페이지로 돌아가기
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
    public ModelAndView signup() {    
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/individual/signup");
        return mv;
    }
    // Individual/SignupForm (회원가입)
    @RequestMapping("/SignupForm")
    public ModelAndView signupFrom(IndividualVo individualVo) {
        individualMapper.signup(individualVo);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/Individual/Login"); 
        return mv;
    }
	// 아이디 중복 확인
    @RequestMapping(
    		value   = "/IdDupCheck",
    		method  = RequestMethod.GET,
    		headers = "Accept=application/json" )  
    	@ResponseBody                           
    	public  IndividualVo   idDupCheck(String user_id) {
    		String  result = "";  
    		IndividualVo  individualVo = individualMapper.idDupCheck( user_id  );		
    		return  individualVo;
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
        mv.setViewName("/individual/write");
        return mv;
    }
	    
    @RequestMapping("/Write2")
    public ModelAndView white(IndividualVo individualVo) {
        individualMapper.insert2(individualVo);
		String user_id = individualVo.getUser_id();
		System.out.println("user_id는:" + user_id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/Individual/ResumeList?user_id=" + user_id); 
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
    public ModelAndView write() {    
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/individual/write");
        return mv;
    }
    
    @RequestMapping("/Write")
    public ModelAndView signupForm(IndividualVo individualVo) {
        individualMapper.insert(individualVo);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/Individual/Main"); 
        return mv;
    }



	// ------------------------------- 이력서 -------------------------------//
	//Company/ResumeList ( 제출 이력서 목록)
	@RequestMapping("/ResumeList")
	public ModelAndView resumeList(IndividualVo individualVo, HttpServletRequest request, String user_id, String compname) {
		HttpSession session = request.getSession();
	IndividualVo login = (IndividualVo) session.getAttribute("login");

	String userid = login.getUser_id();
	IndividualVo vo = individualMapper.getUserById(userid);	
		
		
		List<IndividualVo> appList = individualMapper.getappList(vo);
		List<IndividualVo> reList = individualMapper.getreList(vo);
		
		System.out.println("applist=" + appList);
		System.out.println("relist="+ reList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("appList", appList);
		mv.addObject("reList", reList);
		mv.addObject("user_id", user_id);
		mv.addObject("compname", compname);
		mv.setViewName("individual/resumeList");

		return mv;
		
		
	} 
	//Company/Resumeview (이력서 상세페이지)
	// http://localhost:9090/Company/Resumview?resume_id=1001
	@RequestMapping("/Resumeview")
	public ModelAndView resumeview(IndividualVo individualVo, String title) {				
		//이력서 조회
		IndividualVo vo = individualMapper.getresumeList(individualVo);
		System.out.println("vo"+vo);
		
		title = title.replaceAll(" ", "");
		System.out.println("Title without spaces: " + title);
		
		ModelAndView mv = new ModelAndView();
		//mv.addObject("vo",vo );
		mv.addObject("vo", vo);
		mv.addObject("title", title);
		mv.setViewName("individual/resumeview");
		return mv;
	}
	
	// 이력서 수정하기 
	@RequestMapping("/Resumeupdate")
	public ModelAndView resumeupdate(IndividualVo individualVo, String title) {				
		//이력서 조회
		IndividualVo vo = individualMapper.getresumeList(individualVo);
		System.out.println("vo2"+vo);
		
		
		String user_id = individualVo.getUser_id();
	System.out.println("user_id는:" + user_id);
    System.out.println("Title without spaces: " + title);
		ModelAndView mv = new ModelAndView();
		//mv.addObject("vo",vo );
		mv.addObject("vo", vo);
		mv.addObject("user_id",user_id);
		mv.addObject("title", title);
		mv.setViewName("individual/resumeupdate");
		return mv;
	}


	@RequestMapping("/UpdatingForm")
	public ModelAndView updatingForm() {    
   
		ModelAndView mv = new ModelAndView();
    mv.setViewName("/individual/Updating");
    return mv;
	}

	@RequestMapping("/Updating")
	public ModelAndView updating(IndividualVo individualVo) {
	
    individualMapper.update2(individualVo);
    
    System.out.println("IndividualVo: " + individualVo);
   
    
    System.out.println("완료");
    
    String user_id = individualVo.getUser_id();
    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:/Individual/ResumeList?user_id=" + user_id); 
    return mv;
	}
	// 삭제 
	@RequestMapping("/Deleteres")
	public String deleteres(IndividualVo individualVo, RedirectAttributes redirectAttributes) {
	System.out.println("IndividualVo는" + individualVo );
	individualMapper.deleteres(individualVo);
	
	
	String user_id = individualVo.getUser_id();
	System.out.println(user_id);
	redirectAttributes.addFlashAttribute("message", "선택한 이력서가 삭제되었습니다");
	return "redirect:/Individual/ResumeList?user_id=" + user_id;
	}
	
	// ------------------------------- 개인: 기업 추천 -------------------------------//
    @RequestMapping("/Recommend")
	public ModelAndView recommend() {	
		List<IndividualVo> recommendList = individualMapper.recommendList();
		System.out.println("recommendList"+recommendList);
		ModelAndView mv = new ModelAndView();
		mv.addObject("recommendList", recommendList);
		mv.setViewName("/individual/recommend");
		return mv;
	}
 // ------------------------------- 고객센터 -------------------------------//
 	// Company/Cslist (고객센터)
 	@RequestMapping("/Cslist")
 	public ModelAndView cslist(String user_id, String title) {
 		List<CompanyVo> faqList = companyMapper.getfaqList();
 		System.out.println("faqList=" +faqList);
 		
 		List<CompanyVo> csList = companyMapper.getcsList();
 		System.out.println("csList=" +csList);
 		
 		ModelAndView mv = new ModelAndView();
 		mv.addObject("faqList", faqList);
 		mv.addObject("csList", csList);
 		mv.addObject("title", title);
 		mv.setViewName("individual/cslist");
 		return mv ;
 	}
 	// Company/Csview (문의글 상세페이지)
 	@RequestMapping("/Csview")
 	public ModelAndView csview(CompanyVo companyVo, String csp_title) {
 		CompanyVo vo = companyMapper.getcs(companyVo);
 		
 		// csp_title = csp_title.replaceAll(" ", "");
 		
 		System.out.println("vo1111=" +vo);
 		ModelAndView mv = new ModelAndView();
 		mv.addObject("vo",vo );
 		mv.addObject("csp_title",csp_title );
 		mv.setViewName("individual/csview");
 		return mv;
 	}
 	// Company/CswriteForm (문의글 작성)
 	@RequestMapping("/CswriteForm")
 	public ModelAndView cswriteForm(CompanyVo companyVo,String user_id) {
 		
 		ModelAndView mv = new ModelAndView();
 		mv.addObject("companyVo", companyVo);
 		mv.addObject("user_id", user_id);
 		mv.setViewName("individual/cswrite");
 		return mv;
 	}
 	// Company/Cswrite (문의글 작성)
 	@RequestMapping("/Cswrite")
 	public ModelAndView cswrite(CompanyVo companyVo,String user_id) {
 	    if (user_id != null && !user_id.trim().isEmpty()) {
 	        companyVo.setUser_id(user_id);
 	    } else {
 	        // user_id가 NULL일 경우 오류 처리를 추가하거나 디폴트 값을 설정
 	        System.out.println("user_id가 NULL이어서 INSERT 실패");
 	        // 필요하다면 예외를 던질 수도 있습니다.
 	    }
 		companyMapper.insertcs(companyVo);
 		
 		ModelAndView mv = new ModelAndView();
 		mv.addObject("user_id", user_id);
 		mv.setViewName("redirect:/Individual/Cslist");
 		return mv;
 	}
 	// Company/CsupdateForm (문의글 수정)
 	@RequestMapping("/CsupdateForm")
 	public ModelAndView csupdateForm(CompanyVo companyVo, String csp_id, String csp_title) {
 		CompanyVo vo = companyMapper.getcs(companyVo);
 		System.out.println("updatevo=" +vo );
 		ModelAndView mv = new ModelAndView();
 		mv.addObject("vo",vo );
 		mv.addObject("csp_id",csp_id );
 		mv.setViewName("individual/csupdate");
 		return mv;
 	}
 	
 	// Company/Csupdate (문의글 수정)
 	@RequestMapping("/Csupdate")
 	public ModelAndView csupdate(CompanyVo companyVo, String user_id) {
 		companyMapper.updatecs(companyVo);
 		
 		ModelAndView mv = new ModelAndView();
 		mv.setViewName("redirect:/Individual/Cslist");
 		return mv;
 	}
}