package com.board.company.controller;

import java.io.Console;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.company.mapper.CompanyMapper;
import com.board.company.vo.CompanyVo;

@Controller
@RequestMapping("/Company")
public class CompanyController {
	
	@Autowired
	private CompanyMapper companyMapper;
	
	// Company/Login
	@RequestMapping("/Login")
	public String login() {
		return "company/login";
    }
	
	// Company/Main
	@RequestMapping("/Main")
	public ModelAndView main() {
		
		List<CompanyVo> mainList = companyMapper.getmainList();
		System.out.println("mainlist"+mainList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("mainList", mainList);
		mv.setViewName("company/main");
		return mv ;
	}
	
	//Company/View
	// http://localhost:9090/Company/View?aplnum=1
	@RequestMapping("/View")
	public ModelAndView view(CompanyVo companyVo) {
		
		
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
		mv.setViewName("company/view");
		return mv;
	}
	
	
	//Company/WriteForm
	// http://localhost:9090/Company/WriteForm?aplnum=1
	
	@RequestMapping("/WriteForm")
	public ModelAndView writeform(CompanyVo companyVo) {
		
		ModelAndView mv = new ModelAndView();
		System.out.println("writeformVo"+companyVo);
		mv.addObject("companyVo", companyVo);
		mv.setViewName("company/write");
		return mv;
	}
	
	@RequestMapping("/Write")
	public ModelAndView write(CompanyVo companyVo) {
		
		companyMapper.insertposting(companyVo);
		
		System.out.println("writeVo"+companyVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Company/Main");
		return mv;
	}
	
	
	// http://localhost:9090/Company/Delete?&aplnum=11
	// delete
	@RequestMapping("/Delete")
	public ModelAndView delete(CompanyVo companyVo) {
		
		companyMapper.deleteposting(companyVo);
		System.out.println("delete"+companyVo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Company/Main");
		return mv;
	}
	
	//http://localhost:9090/Company/UpdateForm?&aplnum=8
	//update
	
	@RequestMapping("/UpdateForm")
	public ModelAndView updateform(CompanyVo companyVo) {
		
		ModelAndView mv = new ModelAndView();
		CompanyVo vo = companyMapper.getmain(companyVo);
		System.out.println("updateform"+vo);
		
		mv.addObject("vo", vo);
		mv.setViewName("company/update");
		return mv;
	}
	
	@RequestMapping("/Update")
	public ModelAndView update(CompanyVo companyVo) {
		
		System.out.println("update"+companyVo);
		
		companyMapper.updateposting(companyVo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Company/Main");
		return mv;
	}
	

}



