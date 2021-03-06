package com.mycompany.project1.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mycompany.project1.bean.MemberBean;
import com.mycompany.project1.bean.Pagination;

public interface memberService {

	// 회원조회(로그인)
	public void member_select(MemberBean member, HttpServletResponse response) throws Exception;
	
	// 로그아웃
	public void logout(HttpServletResponse response) throws Exception;
	
	// 회원등록
	public void member_insert(MemberBean member, HttpServletResponse response) throws Exception;

	// 회원체크
	public int update_check(MemberBean member) throws Exception;
	
	// 회원정보 가져오기
	public MemberBean member_info(MemberBean member) throws Exception;

	// 회원정보 수정
	public void member_update(MemberBean member, HttpServletResponse response) throws Exception;
	
	// 회원list
	public List<MemberBean> member_list(Pagination pagination) throws Exception;
	
	// 회원 수
	public int memberCount() throws Exception;
	
	// 아이디 중복 체크
	public int idChk(MemberBean member) throws Exception;
}