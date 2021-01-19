package com.mycompany.project1.DAO;

import java.util.List;

import com.mycompany.project1.bean.BoardBean;
import com.mycompany.project1.bean.Pagination;

public interface BoardDAO {

	// 게시판 글 가져오기
	public List board_select(Pagination pagination) throws Exception;
	
	// 총 게시글 수
	public int board_count() throws Exception;
	
	// 해당 게시글 가져오기
	public BoardBean board_content(int num) throws Exception;
	
	// 조회 수 증가
	public int upReadcount(int num) throws Exception;
	
}
