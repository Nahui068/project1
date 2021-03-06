package com.mycompany.project1;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.project1.bean.MemberBean;
import com.mycompany.project1.bean.Pagination;
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
	public String main() throws IOException {
	
		return "main";
	}
	
	// 정보수정(회원체크Form)
	@RequestMapping(value="/updateCheck_form")
	public String updateCheck_form() {
		return "updateCheck";
	}
	
	//정보수정(회원체크 완료 후 수정페이지)
	@RequestMapping(value="/updateCheck")
	public String updateCheck(MemberBean memberDTO,Model model,HttpServletResponse response) throws Exception {
		int check = service.update_check(memberDTO); // 정보확인
		if(check==1) {
			
			MemberBean memInfo = service.member_info(memberDTO); // 회원정보 가져오기
			model.addAttribute("memInfo", memInfo);
			
		}else {
			
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('비밀번호를 확인해주세요.'); history.go(-1);</script>");
            out.flush();
			
		}
		
		return "memberInfo";
	}
	
	// 정보수정
	@RequestMapping(value="/updateMember")
	public void updateMember(MemberBean memberDTO, HttpServletResponse response) throws Exception {
		
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPw());
		System.out.println(memberDTO.getName());
		service.member_update(memberDTO,response);
	
	}
	
	
	// 직원목록
	@RequestMapping(value="/memberList")
	public String memberList(MemberBean memberDTO, Model model,
			@RequestParam(required = false, defaultValue = "1") int page
			,@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		
		int member_count = service.memberCount(); // 전체 직원 수
		
		// Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, member_count);
		
		List memberList = service.member_list(pagination);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("memberList", memberList);
		
		return "memberList";
	}
	
	// 정보등록 form
	@RequestMapping(value="/insert_form")
	public String member_form() {
		return "member_insert";
	}
	

	// 회원등록
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public void member_insert(MemberBean memberDTO,HttpServletResponse response) throws Exception {
		
		int result = service.idChk(memberDTO);
		if(result == 1) {
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('현재 ID는 존재합니다.'); history.go(-1);</script>");
	        out.flush();
		}else {
			service.member_insert(memberDTO, response);
		}
		
	}	

	
}
