package com.mycompany.project1.DAO;

import javax.servlet.http.HttpServletResponse;

import com.mycompany.project1.bean.MemberBean;

public interface memberDAO {

	//회원정보 찾기
	public int member_select(MemberBean member) throws Exception;
	
	// 회원정보 등록
	public void member_insert(MemberBean member) throws Exception;
}
