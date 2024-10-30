package com.board.company.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	@GetMapping("/Login")
    public String loginForm(Model model) {
        return "/company/login"; 
    }
	
	@PostMapping("/Login")
    public String login(HttpServletRequest  request, 
    					HttpServletResponse response,
    					RedirectAttributes redirectAttributes) {
        String user_id = request.getParameter("user_id"); 
        String password = request.getParameter("password");

        CompanyVo companyVo = companyMapper.login(user_id, password); 
        System.out.println(companyVo);

        HttpSession session = request.getSession();

        if (companyVo != null) {
            session.setAttribute("login", companyVo);
            return "redirect:/Company/Main?user_id=" + user_id; 
        } else {
        	redirectAttributes.addFlashAttribute
        	("errorMessage", "로그인 또는 비밀번호가 일치하지 않습니다.");
            return "redirect:/Company/Login"; 
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
		return "/home";
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
	    public String main(String user_id, Model model) {
	         String compname = companyMapper.compnameByUserId(user_id);
	        List<CompanyVo> postList = companyMapper.getPostList();
	        model.addAttribute("postList", postList); 
	        return "/company/main"; 
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
    @PostMapping("/CompanySignupForm")
    public ModelAndView companysignupForm(
            @RequestParam("logo") MultipartFile logo,
            CompanyVo companyVo) {

        // 프로젝트의 실제 경로
        String img = "D:\\dev_2\\spring\\TeamProject\\src\\main\\resources\\static\\img"; 

        // 파일 저장 경로 
        String filePath = img + "/" + logo.getOriginalFilename();

        try {
            // 디렉토리가 존재하지 않으면 생성
            File directory = new File(img);
            if (!directory.exists()) {
                directory.mkdirs(); // 디렉토리 생성
            }

            // 파일 저장
            logo.transferTo(new File(filePath));

            // 웹에서 접근할 수 있는 로고 경로 설정
            companyVo.setLogoPath("/img/" + logo.getOriginalFilename()); // DB에 저장할 경로 설정
            		// 동기 수정됨 vo 추가 하면됨 setlogopath 오류나면 불러주세요
            // 데이터베이스에 기업 정보 저장
            companyMapper.companysignup(companyVo);

        } catch (Exception e) {
            e.printStackTrace();
            // 파일 저장 실패 시 처리 로직 추가
        }

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
    
    // 이메일 중복방지  // 수정됨
    @RequestMapping(
    	    value = "/EmailDupCheck",
    	    method = RequestMethod.GET,
    	    headers = "Accept=application/json")
    @ResponseBody
    public CompanyVo emailDupCheck(String email) { 
        CompanyVo compemailVo = companyMapper.emailDupCheck(email);
        System.out.println(compemailVo);
        return compemailVo;
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
	public ModelAndView postlist(@RequestParam String user_id, @RequestParam String compname) {
	    System.out.println("/Postlist User ID: " + user_id);
	    System.out.println("Company Name: " + compname);
	    
	    List<CompanyVo> mainList = companyMapper.getmainList();
	    System.out.println("mainList"+mainList);
	    ModelAndView mv = new ModelAndView();
	    mv.addObject("mainList", mainList);
	    mv.addObject("user_id", user_id);
	    mv.addObject("compname", compname);
	    mv.setViewName("company/postlist");
	    return mv;
	}
	
	//-----------------------채용공고 상세페이지------------------------------------
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
	
	//----------------------채용공고 등록---------------------------------------------------
	//Company/WriteForm (채용공고 등록)
	// http://localhost:9090/Company/WriteForm?aplnum=1
	
	@RequestMapping("/WriteForm")
	public ModelAndView writeform(CompanyVo companyVo, String user_id, String compname) {
		
		ModelAndView mv = new ModelAndView();
		System.out.println("writeformVo"+companyVo);
		mv.addObject("companyVo", companyVo);
		mv.addObject("user_id", user_id);
		mv.setViewName("company/postwrite");
		return mv;
	}
	
	@RequestMapping("/Postwrite")
	public ModelAndView postwrite(CompanyVo companyVo, String user_id, String compname) {
	    companyMapper.insertposting(companyVo);
	    System.out.println("writeVo"+companyVo);
	    
	    ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", user_id);
		mv.addObject("compname", compname);
		mv.setViewName("redirect:/Company/Postlist");
		return mv;
	}
	
	//--------------------------채용공고 삭제-------------------------------------------
	// /Company/Postdelete (채용공고 삭제)
	// http://localhost:9090/Company/Postdelete?&aplnum=11
	@RequestMapping("/Postdelete")
	public ModelAndView postdelete(CompanyVo companyVo,String user_id, String compname) {
		
		companyMapper.deleteposting(companyVo);
		System.out.println("delete"+companyVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", user_id);
		mv.addObject("compname", compname);
		mv.setViewName("redirect:/Company/Postlist");
//		mv.setViewName("redirect:/Company/ListManagement");
		return mv;
	}
	
	//-----------------------------채용공고 수정-------------------------------------------------
	// /Company/PostupdateForm (채용공고 수정)
	//http://localhost:9090/Company/PostupdateForm?&aplnum=8
	@RequestMapping("/PostupdateForm")
	public ModelAndView postupdateForm(CompanyVo companyVo,String user_id, String compname) {
		
		ModelAndView mv = new ModelAndView();
		CompanyVo vo = companyMapper.getmain(companyVo);
		System.out.println("postupdateForm"+vo);
		
		mv.addObject("vo", vo);
		mv.addObject("user_id", user_id);
		mv.addObject("compname", compname);
		mv.setViewName("company/postupdate");
		return mv;
	}
	
	@RequestMapping("/Postupdate")
	public ModelAndView postupdate(CompanyVo companyVo, String user_id, String compname) {
		
		System.out.println("Postupdate:"+companyVo);
		
		companyMapper.updateposting(companyVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", user_id);
		mv.addObject("compname", compname);
		mv.setViewName("redirect:/Company/Postlist");
		return mv;
	}
	
	// ---------------------------- 등록공고목록 ----------------------------//
	// http://localhost:9090/Company/ListManagement
	// 기업별 등록 공고리스트
	@RequestMapping("/ListManagement")
	public ModelAndView listmanagment(String user_id, String compname) {
		 System.out.println("Received user_id: " + user_id);
		    System.out.println("Received compname: " + compname); 
			
			List<CompanyVo> CompanyList = companyMapper.getCompanyList(compname);
			System.out.println("CompanyList"+CompanyList);
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("CompanyList",CompanyList);
			mv.addObject("user_id", user_id);
			mv.addObject("compname", compname);
			mv.setViewName("company/listmanagement");
			return mv;
		}
	
	//------------------------등록공고에서 새로운 공고-----------------------// 
		@RequestMapping("/WriteForm2")
		public ModelAndView writeform2(CompanyVo companyVo, String user_id, String compname) {
			
			ModelAndView mv = new ModelAndView();
			System.out.println("writeformVo"+companyVo);
			mv.addObject("companyVo", companyVo);
			mv.addObject("user_id", user_id);
			mv.setViewName("/company/postwrite2");
			return mv;
		}
		
		@RequestMapping("/Postwrite2")
		public ModelAndView postwrite2(CompanyVo companyVo, String user_id, String compname) {
			
			companyMapper.insertposting(companyVo);
			
			System.out.println("writeVo"+companyVo);
			ModelAndView mv = new ModelAndView();
			mv.addObject("user_id", user_id);
			mv.addObject("compname", compname);
			mv.addObject("companyVo", companyVo);
			mv.setViewName("redirect:/Company/ListManagement");
			return mv;
		}
		
		//-----------------------등록공고에서 삭제------------------------------
		@RequestMapping("/Postdelete2")
		public ModelAndView postdelete2(CompanyVo companyVo,String user_id, String compname) {
			
			companyMapper.deleteposting(companyVo);
			System.out.println("delete"+companyVo);
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("user_id", user_id);
			mv.addObject("compname", compname);
			mv.addObject("companyVo", companyVo);
			mv.setViewName("redirect:/Company/ListManagement");
			return mv;
		}
		
		
		//---------------------------등록공고에서 상세보기----------------------------------------
		@RequestMapping("/Postview2")
		public ModelAndView postview2(CompanyVo companyVo,String user_id) {
			
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
			mv.addObject("companyVo", companyVo);
			mv.setViewName("company/postview2");
			return mv;
		}
		
		
		//--------------------------------등록공고에서 수정
		@RequestMapping("/PostupdateForm2")
		public ModelAndView postupdateForm2(CompanyVo companyVo,String user_id, String compname) {
			
			ModelAndView mv = new ModelAndView();
			CompanyVo vo = companyMapper.getmain(companyVo);
			System.out.println("postupdateForm"+vo);
			
			mv.addObject("vo", vo);
			mv.addObject("user_id", user_id);
			mv.addObject("compname", compname);
			mv.addObject("companyVo", companyVo);
			mv.setViewName("company/postupdate2");
			return mv;
		}
		
		@RequestMapping("/Postupdate2")
		public ModelAndView postupdate2(CompanyVo companyVo,String user_id, String compname) {
			
			System.out.println("Postupdate"+companyVo);
			
			companyMapper.updateposting(companyVo);
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("user_id", user_id);
			mv.addObject("compname", compname);
			mv.addObject("companyVo", companyVo);
			mv.setViewName("redirect:/Company/ListManagement");
			return mv;
		}
	
    // ------------------------------- 이력서 -------------------------------//
	//Company/ResumeList (이력서 목록)
	@RequestMapping("/ResumeList")
	public ModelAndView resumeList(String user_id, String compname) {
		System.out.println("user_id=" + user_id);
	    System.out.println("compname=" + compname);
	    
	    // Step 1: Get list of post IDs for the given user_id
	    List<String> postIds = companyMapper.getPostIdsByUserId(user_id);
	    System.out.println("Retrieved post IDs: " + postIds);

	    // Step 2: Get applications based on post IDs
	    List<IndividualVo> appList = companyMapper.getApplicationsByPostIds(postIds);
	    System.out.println("Retrieved app list: " + appList);

	    ModelAndView mv = new ModelAndView();
	    mv.addObject("appList", appList);
	    mv.addObject("user_id", user_id);
	    mv.addObject("compname", compname);
	    mv.setViewName("company/resumeList");
	    return mv;
	}
	
	//Company/Resumeview (이력서 상세페이지)
	// http://localhost:9090/Company/Resumview?title=usera이력서
	@RequestMapping("/Resumeview")
	public ModelAndView resumeview(IndividualVo individualVo, String title, String post_id, String user_id) {				
		//이력서 조회
		IndividualVo vo = companyMapper.getresumeList(individualVo);
		System.out.println("vo"+vo);
		System.out.println("post_id"+post_id);
		
		// System.out.println("Title without spaces: " + title);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("title", title);
		mv.addObject("post_id", post_id);
		mv.addObject("user_id", user_id);
		mv.setViewName("company/resumeview");
		return mv;
	}
	// 이력서 결과 수정
	@RequestMapping(value = "/updateresume", method = RequestMethod.GET)
	public String updateresume(String title, String result, String post_id, String user_id) {
	    System.out.println("title=" + title);
	    System.out.println("result=" + result);
	    System.out.println("post_id=" + post_id);
	    System.out.println("user_id=" + user_id);
	    
	    // 이력서 결과 업데이트
	    companyMapper.updateresume(title, result, post_id);
	    
	    // user_id와 compname을 포함한 리다이렉트
	    return "redirect:/Company/ResumeList?user_id=" + user_id;
	}
	
	//이력서 상세보기(보는것만)
	
	@RequestMapping("/Resumejustview")
	public ModelAndView resumejustview(IndividualVo individualVo, String title, String user_id) {				
		//이력서 조회
		IndividualVo vo = companyMapper.getresumeList(individualVo);
		System.out.println("vo"+vo);
		
		// System.out.println("Title without spaces: " + title);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("title", title);
		mv.addObject("user_id", user_id);
		mv.setViewName("company/resumejustview");
		return mv;
	
	}
	
	// ------------------------------- 인재 추천 -------------------------------//
	// http://localhost:9090/Company/Recommend?user_id=user3&compname=카카오
	//인재 추천
	@RequestMapping("/Recommend")
	public ModelAndView recommend(String user_id,String compname) {
		
		
		List<CompanyVo> recommendList = companyMapper.recommendList(compname);
		System.out.println("recommendList"+recommendList);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("recommendList", recommendList);
		mv.addObject("user_id", user_id);
	    mv.addObject("compname", compname);
		mv.setViewName("company/recommend");
		return mv;
	}
	
	//-----------------------------------북마크--------------------------------------//
	//http://localhost:9090/Company/Bookmark?user_id=user3&compname=%EC%82%BC%EC%84%B1
	
	//북마크기능 
	@SuppressWarnings("null")
	@RequestMapping(value = "/Bookmarking", method = RequestMethod.POST)
	public String bookmarking(CompanyVo companyVo,  String user_id,  String username,  RedirectAttributes redirectAttributes )throws UnsupportedEncodingException {

		
	    String userId = companyVo.getUser_id(); // user_id 가져오기
		String title = companyVo.getTitle(); // title 가져오기
        String Compname = companyVo.getCompname();
		
        System.out.println(Compname);
    	List<CompanyVo> existingBookmark = companyMapper.getBookmark(userId, title, Compname);
		
		ModelAndView mv = new ModelAndView();
		String alertMessage = "";	
		
			if (existingBookmark != null && !existingBookmark.isEmpty()) {
		    // 북마크가 존재할경우, 북마크 상태 변경 ON/OFF.

				String  isBookmarked =  companyMapper.isBookmark(userId, title);
				if ("ON".equals(isBookmarked)){
			        companyMapper.toggleBookmark(userId, title);  // DB의 BOOKMARK 값이 ON일경우 
			        alertMessage = "Pick! 취소 되었습니다.";
			         } else if ("OFF".equals(isBookmarked)){      // DB의 BOOKMARK 값이 OFF일경우 
			        companyMapper.toggleBookmark(userId, title);
			        alertMessage = "Pick! 하셨습니다.";
			         }
			        	 System.out.println("북마크 상태를 토글했습니다: User ID = " + userId + ", Title = " + title);
				} else {
				
		    // 존재하지않는경우  
			companyMapper.saveBookmark(companyVo); // 북마크 저장(기본값 OFF)
			System.out.println("북마크 저장: " + companyVo);
			 
			companyMapper.toggleBookmark(userId, title); // 북마크 값 변경(OFF -> ON)
			alertMessage = "Pick! 하셨습니다.";
			System.out.println("없는상태로 북마크 상태를 토글했습니다: User ID = " + userId + ", Title = " + title);	
	        }
		       
			
			List<CompanyVo> booklist = companyMapper.getBookmark(userId, title , Compname); // 북마크 목록 가져오기
			redirectAttributes.addFlashAttribute("alertMessage", alertMessage);
             
			String encodedCompname = URLEncoder.encode(Compname, StandardCharsets.UTF_8.toString());

			    
			// 뷰에 데이터 추가
			mv.addObject("booklist", booklist);
			mv.addObject("alertMessage", alertMessage);		
			return "redirect:/Company/Recommend?user_id=" + userId + "&compname=" + encodedCompname; 

		}

	//북마크확인

	@RequestMapping("Bookmark")
	public ModelAndView bookmark(CompanyVo companyVo,String user_id ,String username) {
		String userId = companyVo.getUser_id(); // user_id 가져오기
		String title = companyVo.getTitle();
		List<CompanyVo> bookmarkList = companyMapper.bookmarkList(userId,title);
		System.out.println("bookmark"+bookmarkList);
		ModelAndView mv = new ModelAndView();
		mv.addObject("bookmarkList", bookmarkList);
		mv.setViewName("/company/bookmark");
		return mv;
	}
	// ------------------------------- 고객센터 -------------------------------//
	// Company/Cslist (고객센터)
	@RequestMapping("/Cslist")
	public ModelAndView cslist(String user_id, String title, String compname) {
		List<CompanyVo> faqList = companyMapper.getfaqList();
		System.out.println("faqList=" +faqList);
		
		List<CompanyVo> csList = companyMapper.getcsList();
		System.out.println("csList=" +csList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("faqList", faqList);
		mv.addObject("csList", csList);
		mv.addObject("title", title);
		mv.addObject("user_id", user_id);
		mv.setViewName("company/cslist");
		return mv ;
	}
	// Company/Csview (문의글 상세페이지)
	@RequestMapping("/Csview")
	public ModelAndView csview(CompanyVo companyVo, String user_id, String csp_title, String compname) {
		CompanyVo vo = companyMapper.getcs(companyVo);
		
		// csp_title = csp_title.replaceAll(" ", "");
		
		System.out.println("vo1111=" +vo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo );
		mv.addObject("user_id",user_id );
		mv.addObject("csp_title",csp_title );
		mv.setViewName("company/csview");
		return mv;
	}
	// Company/CswriteForm (문의글 작성)
	@RequestMapping("/CswriteForm")
	public ModelAndView cswriteForm(CompanyVo companyVo,String user_id, String compname) {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("companyVo", companyVo);
		mv.addObject("user_id", user_id);
		mv.setViewName("company/cswrite");
		return mv;
	}
	// Company/Cswrite (문의글 작성)
	@RequestMapping("/Cswrite")
	public ModelAndView cswrite(CompanyVo companyVo,String user_id, String compname) {
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
		mv.setViewName("redirect:/Company/Cslist");
		return mv;
	}
	// Company/CsupdateForm (문의글 수정)
	@RequestMapping("/CsupdateForm")
	public ModelAndView csupdateForm(CompanyVo companyVo, String user_id, String csp_id, String csp_title, String compname) {
		CompanyVo vo = companyMapper.getcs(companyVo);
		System.out.println("updatevo=" +vo );
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo );
		mv.addObject("csp_id",csp_id );
		mv.addObject("user_id",user_id );
		mv.setViewName("company/csupdate");
		return mv;
	}
	
	// Company/Csupdate (문의글 수정)
	@RequestMapping("/Csupdate")
	public ModelAndView csupdate(CompanyVo companyVo, String user_id) {
		companyMapper.updatecs(companyVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", user_id);
		mv.setViewName("redirect:/Company/Cslist");
		return mv;
	}
	
	// Company/csdelet (문의글 삭제)
	@RequestMapping("/Csdelete")
	public ModelAndView csdelete(CompanyVo companyVo, String user_id) {
		companyMapper.deletecs(companyVo);
		System.out.println(user_id);
		System.out.println(companyVo);
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", user_id);
		mv.setViewName("redirect:/Company/Cslist");
		return mv;
	}

}