package com.mycompany.project1.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.mycompany.project1.bean.BoardBean;
import com.mycompany.project1.bean.MemberBean;
import com.mycompany.project1.bean.Pagination;

public interface AdminService {

	// 게시글 삽입
	public void board_insert(BoardBean board, HttpServletResponse response)  throws Exception;
	
	// 게시글 출력
	public List board_select(Pagination pagination) throws Exception;
		
	// 총 게시글 개수 확인
	public int board_count() throws Exception;
	
	// 내용 출력
	public BoardBean board_content(int num) throws Exception;
	
	// 게시글 수정
	public void board_update(BoardBean board, HttpServletResponse response) throws Exception;
	
	// 게시글 삭제
	public void board_delete(int num, HttpServletResponse response) throws Exception;
	
	// 회원 삭제
	public void member_delete(MemberBean member,HttpServletResponse response) throws Exception;
	
	
}
