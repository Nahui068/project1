package com.mycompany.project1.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.mycompany.project1.bean.BoardBean;
import com.mycompany.project1.bean.Pagination;

public interface BoardService {

	
	
	// 게시글 출력
	public List board_select(Pagination pagination) throws Exception;
	
	// 총 게시글 개수 확인
	public int board_count() throws Exception;
	
	// 내용 출력
	public BoardBean board_content(int num) throws Exception;
	
	// 조회수 증가
	public void upReadcount(int num) throws Exception;
	
}
