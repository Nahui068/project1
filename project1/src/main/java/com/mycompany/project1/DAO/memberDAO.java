package com.mycompany.project1.DAO;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.mycompany.project1.bean.MemberBean;
import com.mycompany.project1.bean.Pagination;

public interface memberDAO {

	//회원정보 찾기
	public int member_select(MemberBean member) throws Exception;
	
	// 회원정보 등록
	public void member_insert(MemberBean member) throws Exception;
	
	// 회원정보 가져오기
	public MemberBean member_info(MemberBean member) throws Exception;
	
	// 회원정보 수정
	public void member_update(MemberBean member) throws Exception;
	
	// 회원목록
	public List<MemberBean> member_list(Pagination pagination) throws Exception;
	
	// 회원 수
	public int memberCount() throws Exception;

	// 아이디 중복 체크
	public int idChk(MemberBean member) throws Exception;
	
	
}
