package com.mycompany.project1.DAO;

import java.util.List;

import com.mycompany.project1.bean.BoardBean;
import com.mycompany.project1.bean.MemberBean;
import com.mycompany.project1.bean.Pagination;

public interface AdminDAO {
	
	// 게시판 등록
	public void board_insert(BoardBean board) throws Exception;
	
	// 게시판 글 가져오기
	public List board_select(Pagination pagination) throws Exception;
	
	// 총 게시글 수
	public int board_count() throws Exception;
	
	// 해당 게시글 가져오기
	public BoardBean board_content(int num) throws Exception;
	
	// 게시글 수정
	public void board_update(BoardBean board) throws Exception;
	
	// 게시글 삭제
	public void board_delete(int num) throws Exception;
	
	// 회원 삭제
	public void member_delete(MemberBean member) throws Exception;

}
