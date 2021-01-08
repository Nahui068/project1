package com.mycompany.project1;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.project1.bean.MemberBean;
import com.mycompany.project1.service.memberService;

@Controller
public class MemberController {

	@Inject
	memberService service;
	
	// 로그인 화면
	@RequestMapping(value="/login_form")
	public String login_form() {
		
		return "index";
	}
	
	// 로그인
	@RequestMapping(value="/login")
	public void login(MemberBean memberDTO, HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model) throws Exception{
		
		String id = request.getParameter("id");
		session.setAttribute("id", id); // 세션저장
		model.addAttribute("id",id);
		
		service.member_select(memberDTO, response);
	}
	
	//로그아웃
	@RequestMapping(value="/logout")
	public void logout(HttpSession session, HttpServletResponse response) throws Exception {
		
		session.invalidate();
		service.logout(response);
	}
	
	// 로그인 후 메인화면
	@RequestMapping(value="/main")
	public String main() {
		return "main";
	}
	
	// 정보등록 form
	@RequestMapping(value="/insert_form")
	public String member_form() {
		return "member_insert";
	}
	
	// 정보수정
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public void member_insert(MemberBean memberDTO,HttpServletResponse response) throws Exception {
		service.member_insert(memberDTO, response);
	}
	
	@RequestMapping(value="/insert_complete")
	public String member_complete() {
		return "member_insert_complete";
	}
	
}
