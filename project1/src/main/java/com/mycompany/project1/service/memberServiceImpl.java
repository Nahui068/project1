package com.mycompany.project1.service;
import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mycompany.project1.DAO.memberDAO;
import com.mycompany.project1.bean.MemberBean;

@Service
public class memberServiceImpl implements memberService{

	@Inject
	private memberDAO md;
	
	// 로그인
	@Override
	public void member_select(MemberBean member, HttpServletResponse response) throws Exception {
		
		int result = md.member_select(member);
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 또는 패스워드가 틀립니다.')");
			out.println("window.location='login_form'");
			out.println("</script>");
		}
		if(result == 1) {
			
			//String id = md.member_id(member);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("window.location='board_select'");
			out.println("</script>");
		}
	}	
	
	// 로그아웃
	@Override
	public void logout(HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('로그아웃되었습니다.')");
		out.println("window.location='login_form'");
		out.println("</script>");
		out.close();
	
	}
	
	// 회원등록
	@Override
	public void member_insert(MemberBean member, HttpServletResponse response) throws Exception {

		md.member_insert(member);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('등록되었습니다.')");
		out.println("window.location='insert_complete.ex'");
		out.println("</script>");
				
	}




		
}


