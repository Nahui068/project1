package com.mycompany.project1.service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mycompany.project1.bean.MemberBean;

public interface memberService {

	// 회원조회(로그인)
	public void member_select(MemberBean member, HttpServletResponse response) throws Exception;
	
	// 로그아웃
	public void logout(HttpServletResponse response) throws Exception;
	
	// 회원등록
	public void member_insert(MemberBean member, HttpServletResponse response) throws Exception;

}